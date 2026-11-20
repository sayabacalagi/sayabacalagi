"use client";

import React, { useState } from "react";
import { useRouter } from "next/navigation";
import {
  X, CheckCircle2, Info, BookOpen, ChevronLeft,
  ChevronRight, RotateCcw, ArrowRight
} from "lucide-react";
import type { LessonNode } from "@/lib/vault-parser";
import { Broty } from "@/components/broty/Broty";
import { BrotyBubble } from "@/components/broty/BrotyBubble";
import { BROTY_AXOLOTL_COPY } from "@/lib/broty-copy";

type Stage = "pretest" | "material" | "posttest" | "summary";

export default function LessonPlayer({ lesson }: { lesson: LessonNode }) {
  const router = useRouter();
  const hasQuiz = lesson.questions.length > 0;

  const [stage, setStage] = useState<Stage>(hasQuiz ? "pretest" : "material");
  const [qIdx, setQIdx] = useState(0);
  const [selectedIdx, setSelectedIdx] = useState<number | null>(null);
  const [answered, setAnswered] = useState(false);

  const [preScore, setPreScore] = useState(0);
  const [postScore, setPostScore] = useState(0);
  const [slideIdx, setSlideIdx] = useState(0);

  const saveProgress = (finalPre: number, finalPost: number) => {
    const existing = JSON.parse(localStorage.getItem("sjawatdh_lms_progress") || "{}");
    existing[lesson.id] = {
      pretestScore: finalPre,
      posttestScore: finalPost,
      totalQuestions: lesson.questions.length,
      completed: true,
    };
    localStorage.setItem("sjawatdh_lms_progress", JSON.stringify(existing));
  };

  // STEPPER HEADER LMS KEMENKES
  const StepperHeader = () => {
    const steps: { id: Stage; label: string }[] = hasQuiz
      ? [
          { id: "pretest", label: "1. Pretest" },
          { id: "material", label: "2. Materi" },
          { id: "posttest", label: "3. Posttest" },
        ]
      : [{ id: "material", label: "Materi Bacaan" }];

    return (
      <div className="border-b border-slate-200 bg-white px-4 py-3.5">
        <div className="mx-auto flex max-w-3xl items-center justify-between gap-4">
          <button
            onClick={() => router.push("/")}
            className="flex items-center gap-1.5 rounded-xl px-2.5 py-1.5 text-xs font-bold text-slate-500 hover:bg-slate-100"
          >
            <X className="h-4 w-4" /> Keluar
          </button>

          <div className="flex items-center gap-2">
            {steps.map((s) => {
              const active = stage === s.id;
              return (
                <span
                  key={s.id}
                  className={`rounded-xl px-3 py-1 text-xs font-bold transition ${
                    active
                      ? "bg-teal-600 text-white"
                      : "bg-slate-100 text-slate-500"
                  }`}
                >
                  {s.label}
                </span>
              );
            })}
          </div>

          <button
            onClick={() => {
              setQIdx(0);
              setSelectedIdx(null);
              setAnswered(false);
              setStage("material");
            }}
            className="text-xs font-semibold text-teal-600 hover:underline hidden sm:inline"
          >
            Ke Materi
          </button>
        </div>
      </div>
    );
  };

  // TAHAP 1 & 3: PRETEST / POSTTEST (TANPA NYAWA, TANPA MENGHAKIMI, TANPA BROTY)
  if ((stage === "pretest" || stage === "posttest") && hasQuiz) {
    const isPre = stage === "pretest";
    const currentQ = lesson.questions[qIdx];
    const isCorrect = selectedIdx === currentQ.answerIndex;

    const handleCheck = () => {
      if (selectedIdx === null) return;
      setAnswered(true);
      if (isCorrect) {
        if (isPre) setPreScore((s) => s + 1);
        else setPostScore((s) => s + 1);
      }
    };

    const handleNext = () => {
      const nextIsDone = qIdx + 1 >= lesson.questions.length;
      setAnswered(false);
      setSelectedIdx(null);

      if (!nextIsDone) {
        setQIdx(qIdx + 1);
      } else if (isPre) {
        // Selesai pretest -> masuk ke materi
        setQIdx(0);
        setSlideIdx(0);
        setStage("material");
      } else {
        // Selesai posttest -> simpan progres & tampilkan refleksi
        const finalPost = isCorrect ? postScore : postScore;
        saveProgress(preScore, finalPost);
        setStage("summary");
      }
    };

    return (
      <div className="flex min-h-screen flex-col justify-between bg-slate-50">
        <StepperHeader />

        <div className="mx-auto w-full max-w-2xl flex-1 px-4 py-8">
          <div className="mb-4 flex items-center justify-between text-xs font-bold text-slate-500">
            <span className="uppercase tracking-wider text-teal-700">
              {isPre
                ? "PRETEST • Pemetaan Awal (Santai aja, belum baca wajar salah)"
                : "POSTTEST • Cek Pemahaman Setelah Baca"}
            </span>
            <span>
              Soal {qIdx + 1} / {lesson.questions.length}
            </span>
          </div>

          <div className="rounded-3xl border border-slate-200 bg-white p-6 shadow-sm">
            <h2 className="text-lg font-bold text-slate-800 leading-relaxed">
              {currentQ.prompt}
            </h2>

            <div className="mt-6 space-y-3">
              {currentQ.options.map((opt, idx) => {
                const isSelected = selectedIdx === idx;
                const isRightAns = answered && idx === currentQ.answerIndex;
                const isWrongPick = answered && isSelected && !isRightAns;

                return (
                  <button
                    key={idx}
                    disabled={answered}
                    onClick={() => setSelectedIdx(idx)}
                    className={`flex w-full items-center gap-3.5 rounded-2xl border-2 p-4 text-left text-sm font-medium transition ${
                      isRightAns
                        ? "border-teal-500 bg-teal-50 text-teal-900"
                        : isWrongPick
                        ? "border-amber-400 bg-amber-50 text-amber-900"
                        : isSelected
                        ? "border-teal-600 bg-teal-50/40 text-slate-900"
                        : "border-slate-200 bg-white hover:bg-slate-50"
                    }`}
                  >
                    <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-lg border text-xs font-bold">
                      {String.fromCharCode(65 + idx)}
                    </span>
                    <span>{opt}</span>
                  </button>
                );
              })}
            </div>

            {answered && (
              <div className="mt-5 rounded-2xl bg-slate-100 p-4 text-sm text-slate-700 flex items-start gap-2.5">
                <Info className="h-5 w-5 text-teal-600 shrink-0 mt-0.5" />
                <div>
                  <p className="font-bold text-slate-800">
                    {isCorrect ? "Tepat!" : "Catatan untuk dibaca nanti:"}
                  </p>
                  <p className="mt-0.5">{currentQ.explanation}</p>
                </div>
              </div>
            )}
          </div>
        </div>

        <div className="border-t border-slate-200 bg-white p-4">
          <div className="mx-auto flex max-w-2xl justify-end">
            {!answered ? (
              <button
                disabled={selectedIdx === null}
                onClick={handleCheck}
                className="rounded-2xl bg-teal-600 px-6 py-3 text-sm font-bold text-white disabled:opacity-40 hover:bg-teal-500 transition"
              >
                Lihat Kunci
              </button>
            ) : (
              <button
                onClick={handleNext}
                className="inline-flex items-center gap-2 rounded-2xl bg-teal-600 px-6 py-3 text-sm font-bold text-white hover:bg-teal-500 transition"
              >
                {qIdx + 1 < lesson.questions.length
                  ? "Soal Berikutnya"
                  : isPre
                  ? "Lanjut Baca Materi"
                  : "Lihat Ringkasan Belajar"}
                <ArrowRight className="h-4 w-4" />
              </button>
            )}
          </div>
        </div>
      </div>
    );
  }

  // TAHAP 2: MATERI BACAAN + BROTY BUBBLE DI ANTARA SLIDE
  if (stage === "material") {
    const currentSlide = lesson.slides[slideIdx];
    const isLastSlide = slideIdx + 1 >= lesson.slides.length;

    return (
      <div className="flex min-h-screen flex-col justify-between bg-slate-50">
        <StepperHeader />

        <div className="mx-auto w-full max-w-3xl flex-1 px-4 py-6">
          {hasQuiz && slideIdx === 0 && (
            <div className="mb-4 rounded-2xl border border-teal-200 bg-teal-50/70 px-4 py-3 text-xs text-teal-900">
              Skor Pretest awal kamu: <strong>{preScore}/{lesson.questions.length}</strong>. Sekarang yuk baca materinya pelan-pelan—nggak perlu dihafal semua sekaligus.
            </div>
          )}

          <div className="mb-2 flex items-center justify-between text-xs font-bold text-slate-500">
            <span className="flex items-center gap-1.5 text-teal-700">
              <BookOpen className="h-4 w-4" /> {lesson.title}
            </span>
            <span>
              Bagian {slideIdx + 1} dari {lesson.slides.length}
            </span>
          </div>

          <article className="rounded-3xl border border-slate-200 bg-white p-6 md:p-8 shadow-sm space-y-4">
            <h1 className="text-xl md:text-2xl font-extrabold text-slate-800 border-b border-slate-100 pb-3">
              {currentSlide.heading}
            </h1>

            <div className="space-y-4 text-[15px] leading-relaxed text-slate-700">
              {currentSlide.paragraphs.map((p, idx) => (
                <p key={idx} className="rounded-2xl bg-slate-50/80 p-4 border border-slate-100">
                  {p}
                </p>
              ))}
            </div>
          </article>

          {/* BROTY BUBBLE (MUNCUL DI ANTARA SLIDE TENGAH) */}
          {currentSlide.broty && (
            <BrotyBubble mood={currentSlide.broty.mood}>
              {currentSlide.broty.text}
            </BrotyBubble>
          )}
        </div>

        <div className="border-t border-slate-200 bg-white p-4">
          <div className="mx-auto flex max-w-3xl items-center justify-between gap-4">
            <button
              disabled={slideIdx === 0}
              onClick={() => setSlideIdx((i) => Math.max(0, i - 1))}
              className="inline-flex items-center gap-1 rounded-2xl border border-slate-300 bg-white px-5 py-3 text-sm font-bold text-slate-700 disabled:opacity-40 hover:bg-slate-50"
            >
              <ChevronLeft className="h-4 w-4" /> Sebelumnya
            </button>

            {!isLastSlide ? (
              <button
                onClick={() => setSlideIdx((i) => i + 1)}
                className="inline-flex items-center gap-1 rounded-2xl bg-teal-600 px-6 py-3 text-sm font-bold text-white hover:bg-teal-500"
              >
                Lanjut Baca <ChevronRight className="h-4 w-4" />
              </button>
            ) : hasQuiz ? (
              <button
                onClick={() => {
                  setQIdx(0);
                  setPostScore(0);
                  setSelectedIdx(null);
                  setAnswered(false);
                  setStage("posttest");
                }}
                className="inline-flex items-center gap-2 rounded-2xl bg-teal-600 px-6 py-3 text-sm font-bold text-white hover:bg-teal-500"
              >
                Lanjut ke Posttest <ArrowRight className="h-4 w-4" />
              </button>
            ) : (
              <button
                onClick={() => {
                  saveProgress(0, 0);
                  setStage("summary");
                }}
                className="rounded-2xl bg-teal-600 px-6 py-3 text-sm font-bold text-white hover:bg-teal-500"
              >
                Selesai Membaca
              </button>
            )}
          </div>
        </div>
      </div>
    );
  }

  // TAHAP 4: RINGKASAN & REFLEKSI NON-JUDGMENTAL BERSAMA BROTY
  const improved = postScore >= preScore;

  return (
    <div className="mx-auto flex min-h-screen max-w-xl flex-col items-center justify-center p-6 text-center space-y-6">
      <Broty size={96} mood={improved ? "calm" : "curious"} />

      <div className="space-y-2">
        <h1 className="text-2xl font-extrabold text-slate-800">Sesi Belajar Selesai</h1>
        <p className="text-sm text-slate-600">
          {improved
            ? BROTY_AXOLOTL_COPY.post_pass[0]
            : BROTY_AXOLOTL_COPY.post_fail[0]}
        </p>
      </div>

      {hasQuiz && (
        <div className="grid w-full grid-cols-2 gap-4 rounded-3xl border border-slate-200 bg-white p-5 shadow-sm">
          <div className="rounded-2xl bg-slate-50 p-4">
            <p className="text-xs font-semibold text-slate-500">Pretest Awal</p>
            <p className="mt-1 text-2xl font-extrabold text-slate-700">
              {preScore} / {lesson.questions.length}
            </p>
          </div>
          <div className="rounded-2xl bg-teal-50 p-4">
            <p className="text-xs font-semibold text-teal-700">Posttest Akhir</p>
            <p className="mt-1 text-2xl font-extrabold text-teal-700">
              {postScore} / {lesson.questions.length}
            </p>
          </div>
        </div>
      )}

      <div className="flex w-full flex-col sm:flex-row gap-3">
        {hasQuiz && (
          <button
            onClick={() => {
              setQIdx(0);
              setPostScore(0);
              setSelectedIdx(null);
              setAnswered(false);
              setStage("posttest");
            }}
            className="flex-1 inline-flex items-center justify-center gap-2 rounded-2xl border border-slate-300 bg-white py-3.5 text-sm font-bold text-slate-700 hover:bg-slate-50"
          >
            <RotateCcw className="h-4 w-4" /> Ulangi Posttest
          </button>
        )}

        <button
          onClick={() => router.push("/")}
          className="flex-1 inline-flex items-center justify-center gap-2 rounded-2xl bg-teal-600 py-3.5 text-sm font-bold text-white hover:bg-teal-500"
        >
          <CheckCircle2 className="h-4 w-4" /> Kembali ke Daftar Modul
        </button>
      </div>
    </div>
  );
}