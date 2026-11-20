"use client";

import React, { useState } from "react";
import { useRouter } from "next/navigation";
import {
  X, Heart, CheckCircle2, AlertCircle, Sparkles,
  BookOpen, ChevronLeft, ChevronRight
} from "lucide-react";
import type { LessonNode } from "@/lib/vault-parser";

export default function LessonPlayer({ lesson }: { lesson: LessonNode }) {
  const router = useRouter();
  const hasSlides = lesson.slides.length > 0;
  const [mode, setMode] = useState<"slides" | "quiz" | "complete">(
    hasSlides ? "slides" : "quiz"
  );
  const [slideIdx, setSlideIdx] = useState(0);
  const [qIdx, setQIdx] = useState(0);
  const [selectedIdx, setSelectedIdx] = useState<number | null>(null);
  const [hearts, setHearts] = useState(5);
  const [status, setStatus] = useState<"idle" | "correct" | "wrong">("idle");
  const [score, setScore] = useState(0);

  const finishLesson = () => {
    const saved = JSON.parse(localStorage.getItem("sjawatdh_progress") || "{}");
    const completedIds = Array.from(new Set([...(saved.completedIds || []), lesson.id]));
    localStorage.setItem(
      "sjawatdh_progress",
      JSON.stringify({
        xp: (saved.xp || 120) + lesson.xpReward,
        streak: saved.streak || 5,
        hearts,
        completedIds,
      })
    );
    setMode("complete");
  };

  // MODE 1: SLIDE MATERI RAPI DARI HARRISON'S
  if (mode === "slides" && hasSlides) {
    const currentSlide = lesson.slides[slideIdx];
    const slideProgress = Math.round(((slideIdx + 1) / lesson.slides.length) * 100);

    return (
      <div className="mx-auto flex min-h-screen max-w-3xl flex-col justify-between p-6">
        <div>
          <div className="mb-6 flex items-center gap-4">
            <button onClick={() => router.push("/")} className="rounded-xl p-2 hover:bg-slate-200">
              <X className="h-6 w-6 text-slate-500" />
            </button>
            <div className="h-3.5 flex-1 overflow-hidden rounded-full bg-slate-200">
              <div
                className="h-full bg-sky-500 transition-all duration-300"
                style={{ width: `${slideProgress}%` }}
              />
            </div>
            <span className="text-xs font-extrabold text-slate-500">
              Slide {slideIdx + 1}/{lesson.slides.length}
            </span>
          </div>

          <div className="mb-2 flex items-center gap-2 text-xs font-extrabold uppercase tracking-wider text-sky-600">
            <BookOpen className="h-4 w-4" />
            <span>{lesson.title}</span>
          </div>

          <div className="rounded-3xl border bg-white p-6 md:p-8 shadow-sm space-y-4">
            <h1 className="text-xl md:text-2xl font-black text-slate-800 border-b pb-3">
              {currentSlide.heading}
            </h1>
            <div className="space-y-4 text-[15px] leading-relaxed text-slate-700 max-h-[58vh] overflow-y-auto pr-2">
              {currentSlide.paragraphs.map((p, idx) => (
                <p key={idx} className="bg-slate-50/70 rounded-xl p-3.5 border border-slate-100">
                  {p}
                </p>
              ))}
            </div>
          </div>
        </div>

        <div className="mt-6 flex items-center justify-between gap-4">
          <button
            disabled={slideIdx === 0}
            onClick={() => setSlideIdx((i) => Math.max(0, i - 1))}
            className="flex items-center gap-1 rounded-2xl border-2 border-slate-300 bg-white px-5 py-3.5 font-extrabold text-slate-700 disabled:opacity-40 hover:bg-slate-50"
          >
            <ChevronLeft className="h-5 w-5" /> Sebelumnya
          </button>

          {slideIdx + 1 < lesson.slides.length ? (
            <button
              onClick={() => setSlideIdx((i) => i + 1)}
              className="flex items-center gap-1 rounded-2xl border-b-4 border-sky-700 bg-sky-500 px-6 py-3.5 font-extrabold text-white hover:bg-sky-400"
            >
              Slide Berikutnya <ChevronRight className="h-5 w-5" />
            </button>
          ) : lesson.questions.length > 0 ? (
            <button
              onClick={() => setMode("quiz")}
              className="rounded-2xl border-b-4 border-emerald-700 bg-emerald-500 px-6 py-3.5 font-extrabold text-white hover:bg-emerald-400"
            >
              MULAI KUIS ({lesson.questions.length} SOAL)
            </button>
          ) : (
            <button
              onClick={finishLesson}
              className="rounded-2xl border-b-4 border-emerald-700 bg-emerald-500 px-6 py-3.5 font-extrabold text-white hover:bg-emerald-400"
            >
              SELESAI (+{lesson.xpReward} XP)
            </button>
          )}
        </div>
      </div>
    );
  }

  // MODE 2: SELESAI
  if (mode === "complete" || lesson.questions.length === 0) {
    const pct = lesson.questions.length > 0 ? Math.round((score / lesson.questions.length) * 100) : 100;
    return (
      <div className="mx-auto flex min-h-screen max-w-md flex-col items-center justify-center p-6 text-center space-y-6">
        <div className="flex h-24 w-24 items-center justify-center rounded-full bg-amber-100 text-amber-500">
          <Sparkles className="h-12 w-12" />
        </div>
        <h1 className="text-3xl font-black text-slate-800">Modul Selesai!</h1>
        <p className="text-slate-600">
          Kamu meraih <strong>+{lesson.xpReward} XP</strong> dengan akurasi <strong>{pct}%</strong>.
        </p>
        <button
          onClick={() => router.push("/")}
          className="w-full rounded-2xl border-b-4 border-emerald-700 bg-emerald-500 py-4 font-extrabold text-white hover:bg-emerald-400"
        >
          KEMBALI KE ALUR BELAJAR
        </button>
      </div>
    );
  }

  // MODE 3: KUIS INTERAKTIF (PILIHAN GANDA A-E)
  const currentQ = lesson.questions[qIdx];
  const quizProgress = Math.round(((qIdx + (status !== "idle" ? 1 : 0)) / lesson.questions.length) * 100);

  const handleCheck = () => {
    if (selectedIdx === null) return;
    if (selectedIdx === currentQ.answerIndex) {
      setStatus("correct");
      setScore((s) => s + 1);
    } else {
      setStatus("wrong");
      setHearts((h) => Math.max(0, h - 1));
    }
  };

  const handleNext = () => {
    setStatus("idle");
    setSelectedIdx(null);
    if (qIdx + 1 < lesson.questions.length) {
      setQIdx(qIdx + 1);
    } else {
      finishLesson();
    }
  };

  return (
    <div className="flex min-h-screen flex-col justify-between">
      {/* TOP BAR */}
      <div className="mx-auto flex w-full max-w-3xl items-center gap-4 p-6">
        <button onClick={() => router.push("/")} className="rounded-xl p-2 hover:bg-slate-200">
          <X className="h-6 w-6 text-slate-400" />
        </button>
        <div className="h-4 flex-1 overflow-hidden rounded-full bg-slate-200">
          <div
            className="h-full bg-emerald-500 transition-all duration-300"
            style={{ width: `${quizProgress}%` }}
          />
        </div>
        <div className="flex items-center gap-1 font-extrabold text-rose-500">
          <Heart className="h-6 w-6 fill-rose-500" />
          <span>{hearts}</span>
        </div>
      </div>

      {/* SOAL */}
      <div className="mx-auto w-full max-w-2xl flex-1 px-6 py-4">
        <div className="flex items-center justify-between">
          <span className="text-xs font-extrabold uppercase tracking-wider text-violet-600">
            SOAL {qIdx + 1} DARI {lesson.questions.length} • {lesson.title}
          </span>
          {hasSlides && (
            <button
              onClick={() => setMode("slides")}
              className="text-xs font-bold text-sky-600 hover:underline"
            >
              Baca Materi
            </button>
          )}
        </div>

        <h2 className="mt-3 text-lg md:text-xl font-extrabold text-slate-800 leading-snug">
          {currentQ.prompt}
        </h2>

        <div className="mt-6 space-y-3">
          {currentQ.options.map((opt, idx) => {
            const isSelected = selectedIdx === idx;
            const isCorrectOpt = status !== "idle" && idx === currentQ.answerIndex;
            const isWrongPicked = status === "wrong" && isSelected;

            return (
              <button
                key={idx}
                disabled={status !== "idle"}
                onClick={() => setSelectedIdx(idx)}
                className={`flex w-full items-center gap-4 rounded-2xl border-2 border-b-4 p-4 text-left font-bold transition ${
                  isCorrectOpt
                    ? "border-emerald-500 bg-emerald-50 text-emerald-900"
                    : isWrongPicked
                    ? "border-rose-500 bg-rose-50 text-rose-900"
                    : isSelected
                    ? "border-sky-500 bg-sky-50 text-sky-800"
                    : "border-slate-200 bg-white hover:bg-slate-50"
                }`}
              >
                <span className="flex h-8 w-8 shrink-0 items-center justify-center rounded-xl border text-xs font-extrabold">
                  {String.fromCharCode(65 + idx)}
                </span>
                <span className="text-sm md:text-base">{opt}</span>
              </button>
            );
          })}
        </div>
      </div>

      {/* BOTTOM FEEDBACK DRAWER */}
      <div
        className={`border-t p-6 transition-colors ${
          status === "correct"
            ? "bg-emerald-100 border-emerald-300"
            : status === "wrong"
            ? "bg-rose-100 border-rose-300"
            : "bg-white"
        }`}
      >
        <div className="mx-auto flex max-w-3xl flex-col justify-between gap-4 sm:flex-row sm:items-center">
          {status === "idle" ? (
            <div />
          ) : (
            <div className="space-y-1">
              <div className="flex items-center gap-2 font-black text-lg">
                {status === "correct" ? (
                  <span className="flex items-center gap-2 text-emerald-700">
                    <CheckCircle2 className="h-6 w-6" /> Tepat Sekali!
                  </span>
                ) : (
                  <span className="flex items-center gap-2 text-rose-700">
                    <AlertCircle className="h-6 w-6" /> Jawaban Kurang Tepat
                  </span>
                )}
              </div>
              <p className="text-sm font-semibold text-slate-700">{currentQ.explanation}</p>
            </div>
          )}

          {status === "idle" ? (
            <button
              disabled={selectedIdx === null}
              onClick={handleCheck}
              className="rounded-2xl border-b-4 border-emerald-700 bg-emerald-500 px-8 py-3.5 font-extrabold text-white disabled:opacity-40 hover:bg-emerald-400"
            >
              PERIKSA JAWABAN
            </button>
          ) : (
            <button
              onClick={handleNext}
              className={`rounded-2xl border-b-4 px-8 py-3.5 font-extrabold text-white ${
                status === "correct"
                  ? "border-emerald-700 bg-emerald-600"
                  : "border-rose-700 bg-rose-600"
              }`}
            >
              LANJUTKAN
            </button>
          )}
        </div>
      </div>
    </div>
  );
}
