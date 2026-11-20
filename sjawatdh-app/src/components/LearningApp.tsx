"use client";

import React, { useState, useEffect } from "react";
import Link from "next/link";
import { BookOpen, CheckCircle2, CircleDot, ArrowRight, Sparkles } from "lucide-react";
import type { SystemUnit } from "@/lib/vault-parser";
import { Broty } from "@/components/broty/Broty";

export interface SavedModuleProgress {
  pretestScore?: number;
  posttestScore?: number;
  totalQuestions?: number;
  completed?: boolean;
}

export default function LearningApp({ units }: { units: SystemUnit[] }) {
  const [progressMap, setProgressMap] = useState<Record<string, SavedModuleProgress>>({});
  const [selectedSystem, setSelectedSystem] = useState<string>("all");

  useEffect(() => {
    const saved = localStorage.getItem("sjawatdh_lms_progress");
    if (saved) {
      setProgressMap(JSON.parse(saved));
    }
  }, []);

  const visibleUnits =
    selectedSystem === "all" ? units : units.filter((u) => u.id === selectedSystem);

  return (
    <div className="min-h-screen bg-slate-50/80 text-slate-800">
      {/* HEADER TENANG & WELCOMING */}
      <header className="border-b border-slate-200/80 bg-white/90 backdrop-blur sticky top-0 z-10">
        <div className="mx-auto flex max-w-4xl items-center justify-between px-4 py-4 md:px-6">
          <div className="flex items-center gap-3">
            <div className="flex h-10 w-10 items-center justify-center rounded-2xl bg-teal-600 text-white font-bold text-lg shadow-sm">
              S
            </div>
            <div>
              <h1 className="text-lg font-extrabold tracking-tight text-slate-800">
                Sjawatdh <span className="text-teal-600 font-semibold">Study Space</span>
              </h1>
              <p className="text-xs text-slate-500">Pretest → Materi → Posttest • Tanpa buru-buru</p>
            </div>
          </div>

          <div className="flex items-center gap-2 rounded-2xl bg-pink-50 border border-pink-200/70 px-3 py-1.5">
            <Broty size={32} mood="calm" />
            <span className="hidden sm:inline text-xs font-medium text-slate-600">
              Alir aja pelan-pelan
            </span>
          </div>
        </div>
      </header>

      <main className="mx-auto max-w-4xl px-4 py-8 md:px-6 space-y-8">
        {/* WELCOME BANNER */}
        <section className="flex flex-col sm:flex-row items-center gap-5 rounded-3xl border border-teal-100 bg-white p-6 shadow-sm">
          <Broty size={80} mood="curious" className="shrink-0" />
          <div className="space-y-1.5 text-center sm:text-left">
            <h2 className="text-xl font-extrabold text-slate-800">
              Halo, Sjawatdh. Mau mulai dari bagian mana hari ini?
            </h2>
            <p className="text-sm text-slate-600 leading-relaxed">
              Setiap modul dimulai dari <strong>Pretest</strong> biar otak tahu bagian mana yang masih kosong, lanjut baca <strong>Materi Harrison&apos;s</strong> bareng Broty, lalu ditutup <strong>Posttest</strong> yang bisa diulang kapan aja.
            </p>
          </div>
        </section>

        {/* FILTER SISTEM ORGAN */}
        <div className="flex gap-2 overflow-x-auto pb-1">
          <button
            onClick={() => setSelectedSystem("all")}
            className={`rounded-2xl px-4 py-2 text-xs font-bold transition whitespace-nowrap ${
              selectedSystem === "all"
                ? "bg-teal-600 text-white shadow-sm"
                : "bg-white border border-slate-200 text-slate-600 hover:bg-slate-100"
            }`}
          >
            Semua Sistem ({units.length})
          </button>
          {units.map((u) => (
            <button
              key={u.id}
              onClick={() => setSelectedSystem(u.id)}
              className={`rounded-2xl px-4 py-2 text-xs font-bold transition whitespace-nowrap ${
                selectedSystem === u.id
                  ? "bg-teal-600 text-white shadow-sm"
                  : "bg-white border border-slate-200 text-slate-600 hover:bg-slate-100"
              }`}
            >
              {u.name}
            </button>
          ))}
        </div>

        {/* DAFTAR MODUL PER SISTEM ORGAN */}
        <div className="space-y-8">
          {visibleUnits.map((unit) => (
            <section
              key={unit.id}
              className="rounded-3xl border border-slate-200/80 bg-white p-6 shadow-sm space-y-5"
            >
              <div className={`rounded-2xl border-l-4 p-4 ${unit.accentColor}`}>
                <h3 className="text-lg font-extrabold">{unit.name}</h3>
                <p className="text-xs opacity-80 mt-0.5">{unit.description}</p>
              </div>

              <div className="divide-y divide-slate-100">
                {unit.lessons.map((lesson, idx) => {
                  const prog = progressMap[lesson.id];
                  const isDone = prog?.completed;

                  return (
                    <div
                      key={lesson.id}
                      className="flex flex-col sm:flex-row sm:items-center justify-between gap-4 py-4 first:pt-1 last:pb-1"
                    >
                      <div className="flex items-start gap-3.5">
                        <div className="mt-0.5">
                          {isDone ? (
                            <CheckCircle2 className="h-6 w-6 text-teal-600" />
                          ) : (
                            <CircleDot className="h-6 w-6 text-slate-300" />
                          )}
                        </div>
                        <div>
                          <div className="flex flex-wrap items-center gap-2">
                            <span className="text-xs font-bold text-slate-400">#{idx + 1}</span>
                            <h4 className="font-bold text-slate-800">{lesson.title}</h4>
                            <span className="rounded-lg bg-slate-100 px-2 py-0.5 text-[11px] font-semibold text-slate-600">
                              {lesson.category}
                            </span>
                          </div>

                          <div className="mt-1.5 flex flex-wrap items-center gap-3 text-xs text-slate-500">
                            <span className="flex items-center gap-1">
                              <BookOpen className="h-3.5 w-3.5" /> {lesson.slides.length} bagian bacaan
                            </span>
                            {lesson.questions.length > 0 && (
                              <span>• {lesson.questions.length} soal Pre/Posttest</span>
                            )}
                            {prog?.pretestScore !== undefined && prog?.totalQuestions ? (
                              <span className="rounded-md bg-teal-50 px-2 py-0.5 font-medium text-teal-700">
                                Pre: {prog.pretestScore}/{prog.totalQuestions}
                                {prog.posttestScore !== undefined &&
                                  ` → Post: ${prog.posttestScore}/${prog.totalQuestions}`}
                              </span>
                            ) : null}
                          </div>
                        </div>
                      </div>

                      <Link
                        href={`/lesson/${encodeURIComponent(lesson.id)}`}
                        className="inline-flex items-center justify-center gap-2 rounded-2xl bg-teal-600 px-5 py-2.5 text-xs font-bold text-white shadow-sm hover:bg-teal-500 transition shrink-0"
                      >
                        {isDone ? (
                          <>
                            <Sparkles className="h-3.5 w-3.5" /> Buka Ulang
                          </>
                        ) : (
                          <>
                            Mulai Belajar <ArrowRight className="h-3.5 w-3.5" />
                          </>
                        )}
                      </Link>
                    </div>
                  );
                })}
              </div>
            </section>
          ))}
        </div>
      </main>
    </div>
  );
}