"use client";

import React, { useState, useEffect } from "react";
import Link from "next/link";
import {
  Flame, Zap, Heart, Trophy, BookOpen, CheckCircle2,
  Play, GraduationCap, Award, RefreshCw, FileQuestion
} from "lucide-react";
import type { SystemUnit } from "@/lib/vault-parser";

export default function LearningApp({ units }: { units: SystemUnit[] }) {
  const [xp, setXp] = useState(120);
  const [streak, setStreak] = useState(5);
  const [hearts, setHearts] = useState(5);
  const [completedIds, setCompletedIds] = useState<string[]>([]);
  const [activeTab, setActiveTab] = useState<"learn" | "practice" | "leaderboard" | "teacher">("learn");
  const [selectedSystem, setSelectedSystem] = useState<string>("all");

  useEffect(() => {
    const saved = localStorage.getItem("sjawatdh_progress");
    if (saved) {
      const parsed = JSON.parse(saved);
      setXp(parsed.xp ?? 120);
      setStreak(parsed.streak ?? 5);
      setHearts(parsed.hearts ?? 5);
      setCompletedIds(parsed.completedIds ?? []);
    }
  }, []);

  const refillHearts = () => {
    setHearts(5);
    localStorage.setItem(
      "sjawatdh_progress",
      JSON.stringify({ xp, streak, hearts: 5, completedIds })
    );
  };

  const visibleUnits =
    selectedSystem === "all" ? units : units.filter((u) => u.id === selectedSystem);

  return (
    <div className="flex min-h-screen flex-col md:flex-row">
      {/* SIDEBAR NAVIGASI */}
      <aside className="w-full border-b bg-white p-4 md:w-64 md:border-b-0 md:border-r md:p-6 flex flex-col justify-between">
        <div>
          <div className="mb-8 flex items-center gap-3">
            <div className="flex h-10 w-10 items-center justify-center rounded-2xl bg-emerald-500 text-white font-black text-xl shadow-sm">
              S
            </div>
            <div>
              <h1 className="text-xl font-extrabold tracking-tight text-emerald-600">Sjawatdh</h1>
              <p className="text-xs font-semibold text-slate-400">MEDICAL ACADEMY</p>
            </div>
          </div>

          <nav className="flex gap-2 overflow-x-auto md:flex-col">
            {[
              { id: "learn", label: "Alur Belajar", icon: BookOpen },
              { id: "practice", label: "Isi Ulang Hati", icon: Heart },
              { id: "leaderboard", label: "Peringkat", icon: Trophy },
              { id: "teacher", label: "Indeks Materi Vault", icon: GraduationCap },
            ].map((item) => {
              const Icon = item.icon;
              const active = activeTab === item.id;
              return (
                <button
                  key={item.id}
                  onClick={() => setActiveTab(item.id as any)}
                  className={`flex items-center gap-3 rounded-2xl px-4 py-3 text-sm font-bold transition whitespace-nowrap ${
                    active
                      ? "bg-sky-50 text-sky-600 border-2 border-sky-200"
                      : "text-slate-600 hover:bg-slate-100"
                  }`}
                >
                  <Icon className="h-5 w-5" />
                  <span>{item.label}</span>
                </button>
              );
            })}
          </nav>
        </div>

        <div className="hidden md:block rounded-2xl bg-slate-100 p-4 text-xs text-slate-500">
          <p className="font-bold text-slate-700">dr. Lazuardi Vault</p>
          <p className="mt-1">
            {units.length} sistem organ • {units.reduce((acc, u) => acc + u.lessons.length, 0)} modul siap belajar.
          </p>
        </div>
      </aside>

      {/* KONTEN UTAMA */}
      <main className="flex-1 p-4 md:p-8 max-w-4xl mx-auto w-full">
        {/* TOP HUD */}
        <header className="mb-6 flex flex-wrap items-center justify-between gap-4 rounded-2xl border bg-white p-4 shadow-sm">
          <div>
            <p className="text-xs font-bold uppercase tracking-wider text-slate-400">Selamat belajar</p>
            <h2 className="text-lg font-extrabold text-slate-800">dr. Lazuardi</h2>
          </div>

          <div className="flex items-center gap-5">
            <div className="flex items-center gap-1.5 font-extrabold text-orange-500">
              <Flame className="h-6 w-6 fill-orange-500" />
              <span>{streak} Hari</span>
            </div>
            <div className="flex items-center gap-1.5 font-extrabold text-amber-500">
              <Zap className="h-6 w-6 fill-amber-500" />
              <span>{xp} XP</span>
            </div>
            <div className="flex items-center gap-1.5 font-extrabold text-rose-500">
              <Heart className="h-6 w-6 fill-rose-500" />
              <span>{hearts}</span>
            </div>
          </div>
        </header>

        {/* FILTER SISTEM ORGAN */}
        {activeTab === "learn" && (
          <>
            <div className="mb-6 flex gap-2 overflow-x-auto pb-2">
              <button
                onClick={() => setSelectedSystem("all")}
                className={`rounded-xl px-3.5 py-1.5 text-xs font-extrabold border transition ${
                  selectedSystem === "all"
                    ? "bg-slate-800 text-white border-slate-800"
                    : "bg-white text-slate-600 hover:bg-slate-100"
                }`}
              >
                Semua Sistem ({units.length})
              </button>
              {units.map((u) => (
                <button
                  key={u.id}
                  onClick={() => setSelectedSystem(u.id)}
                  className={`rounded-xl px-3.5 py-1.5 text-xs font-extrabold border transition whitespace-nowrap ${
                    selectedSystem === u.id
                      ? "bg-emerald-600 text-white border-emerald-600"
                      : "bg-white text-slate-600 hover:bg-slate-100"
                  }`}
                >
                  {u.name}
                </button>
              ))}
            </div>

            {/* WINDING LEARNING PATH */}
            <div className="space-y-10">
              {visibleUnits.map((unit, uIdx) => (
                <section key={unit.id} className="space-y-6">
                  <div className={`rounded-2xl border-b-4 p-5 text-white shadow-sm ${unit.color}`}>
                    <div className="flex items-center justify-between">
                      <div>
                        <span className="text-xs font-extrabold uppercase tracking-wider opacity-85">
                          SISTEM ORGAN {uIdx + 1}
                        </span>
                        <h3 className="text-2xl font-black">{unit.name}</h3>
                        <p className="text-sm opacity-90 mt-1">{unit.description}</p>
                      </div>
                      <Award className="h-10 w-10 opacity-80" />
                    </div>
                  </div>

                  <div className="flex flex-col items-center space-y-6 py-2">
                    {unit.lessons.map((lesson, lIdx) => {
                      const isCompleted = completedIds.includes(lesson.id);
                      const isTest = lesson.category === "Pre/Post-Test";
                      const offsetClass =
                        lIdx % 3 === 1 ? "translate-x-10" : lIdx % 3 === 2 ? "-translate-x-10" : "";

                      return (
                        <div key={lesson.id} className={`flex flex-col items-center ${offsetClass}`}>
                          <Link
                            href={`/lesson/${encodeURIComponent(lesson.id)}`}
                            className={`group relative flex h-20 w-20 items-center justify-center rounded-full border-b-4 text-white shadow-md transition active:translate-y-1 ${
                              isCompleted
                                ? "bg-amber-400 border-amber-600"
                                : isTest
                                ? "bg-violet-500 border-violet-700 hover:bg-violet-400"
                                : "bg-emerald-500 border-emerald-700 hover:bg-emerald-400"
                            }`}
                          >
                            {isCompleted ? (
                              <CheckCircle2 className="h-9 w-9" />
                            ) : isTest ? (
                              <FileQuestion className="h-8 w-8" />
                            ) : (
                              <Play className="h-8 w-8 fill-white ml-1" />
                            )}
                            <span className="absolute -top-3 rounded-xl bg-white px-2.5 py-0.5 text-[11px] font-extrabold text-slate-700 shadow border">
                              +{lesson.xpReward} XP
                            </span>
                          </Link>
                          <span className="mt-2 max-w-[220px] text-center text-xs font-extrabold text-slate-800">
                            {lesson.title}
                          </span>
                          <span className="text-[11px] font-semibold text-slate-400">
                            {isTest
                              ? `Pre/Post-Test • ${lesson.questions.length} soal`
                              : `${lesson.category} • ${lesson.slides.length} slide`}
                          </span>
                        </div>
                      );
                    })}
                  </div>
                </section>
              ))}
            </div>
          </>
        )}

        {/* TAB LATIHAN & HATI */}
        {activeTab === "practice" && (
          <div className="rounded-3xl border bg-white p-8 text-center shadow-sm space-y-4">
            <Heart className="mx-auto h-16 w-16 text-rose-500 fill-rose-500" />
            <h3 className="text-2xl font-black">Isi Ulang Hati</h3>
            <p className="text-slate-600 max-w-md mx-auto">
              Hati kamu saat ini: <strong>{hearts}/5</strong>. Pulihkan hati untuk melanjutkan latihan soal klinis.
            </p>
            <button
              onClick={refillHearts}
              className="rounded-2xl border-b-4 border-rose-700 bg-rose-500 px-6 py-3 font-extrabold text-white hover:bg-rose-400"
            >
              Pulihkan 5 Hati Sekarang
            </button>
          </div>
        )}

        {/* TAB PERINGKAT */}
        {activeTab === "leaderboard" && (
          <div className="rounded-3xl border bg-white p-6 shadow-sm space-y-4">
            <div className="flex items-center gap-3 border-b pb-4">
              <Trophy className="h-8 w-8 text-amber-500" />
              <div>
                <h3 className="text-xl font-black">Liga Klinis Mingguan</h3>
                <p className="text-xs text-slate-500">Peringkat belajar berdasarkan perolehan XP</p>
              </div>
            </div>
            {[
              { name: "dr. Lazuardi (Anda)", xp, you: true },
              { name: "dr. Aisyah Putri", xp: 340, you: false },
              { name: "dr. Bima Prakoso", xp: 290, you: false },
              { name: "dr. Clara Wijaya", xp: 185, you: false },
            ]
              .sort((a, b) => b.xp - a.xp)
              .map((user, idx) => (
                <div
                  key={user.name}
                  className={`flex items-center justify-between rounded-2xl p-4 font-bold ${
                    user.you ? "bg-emerald-50 border-2 border-emerald-300 text-emerald-900" : "bg-slate-50"
                  }`}
                >
                  <div className="flex items-center gap-4">
                    <span className="w-6 text-center font-black text-slate-400">#{idx + 1}</span>
                    <span>{user.name}</span>
                  </div>
                  <span className="text-amber-600">{user.xp} XP</span>
                </div>
              ))}
          </div>
        )}

        {/* TAB INDEKS MATERI VAULT */}
        {activeTab === "teacher" && (
          <div className="rounded-3xl border bg-white p-6 shadow-sm space-y-6">
            <div className="flex items-center justify-between border-b pb-4">
              <div>
                <h3 className="text-xl font-black">Indeks Materi Vault (E:\sayabacalagi\Webpage)</h3>
                <p className="text-sm text-slate-500">
                  Seluruh file .md dibaca langsung dan dirapikan otomatis ke dalam slide & kuis.
                </p>
              </div>
              <button
                onClick={() => window.location.reload()}
                className="flex items-center gap-2 rounded-xl bg-emerald-50 px-3 py-2 text-xs font-extrabold text-emerald-700 hover:bg-emerald-100"
              >
                <RefreshCw className="h-4 w-4" /> Refresh Vault
              </button>
            </div>

            <div className="grid gap-4 sm:grid-cols-2">
              {units.map((u) => (
                <div key={u.id} className="rounded-2xl border p-4">
                  <h4 className="font-extrabold text-slate-800">{u.name}</h4>
                  <ul className="mt-2 space-y-1 text-xs text-slate-600">
                    {u.lessons.map((l) => (
                      <li key={l.id} className="truncate">
                        • [{l.category}] {l.title} ({l.slides.length} slide, {l.questions.length} soal)
                      </li>
                    ))}
                  </ul>
                </div>
              ))}
            </div>
          </div>
        )}
      </main>
    </div>
  );
}
