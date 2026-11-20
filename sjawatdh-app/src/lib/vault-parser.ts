import fs from "fs";
import path from "path";

export type QuestionType = "mcq" | "true_false" | "fill_blank" | "ordering";

export interface Question {
  id: string;
  type: QuestionType;
  prompt: string;
  options?: string[];
  answer: string;
  explanation: string;
  sequence?: string[];
}

export interface LessonNode {
  id: string;
  unitId: string;
  title: string;
  type: "concept" | "quiz";
  xpReward: number;
  summaryMarkdown: string;
  questions: Question[];
}

export interface SystemUnit {
  id: string;
  name: string;
  description: string;
  color: string;
  lessons: LessonNode[];
}

const COLORS = [
  "bg-emerald-500 border-emerald-700",
  "bg-sky-500 border-sky-700",
  "bg-violet-500 border-violet-700",
  "bg-amber-500 border-amber-700",
  "bg-rose-500 border-rose-700",
  "bg-teal-500 border-teal-700"
];

const QUESTIONS_DB: Record<string, Question[]> = {
  Endokrin: [
    {
      id: "endo-1",
      type: "mcq",
      prompt: "Pasien datang dengan takikardia, penurunan berat badan, dan intoleransi panas. Hormon apa yang meningkat pada hipertiroidisme primer?",
      options: ["TSH", "Free T4", "Kalsitonin", "Hormon Paratiroid"],
      answer: "Free T4",
      explanation: "Pada hipertiroidisme primer, produksi T3/T4 meningkat sehingga Free T4 tinggi dan TSH tertekan."
    },
    {
      id: "endo-2",
      type: "true_false",
      prompt: "Ketoasidosis Diabetikum (KAD) ditandai dengan hiperglikemia, ketonemia, dan asidosis metabolik anion gap tinggi.",
      options: ["Benar", "Salah"],
      answer: "Benar",
      explanation: "Defisiensi insulin memicu lipolisis masif dan ketogenesis sehingga terjadi asidosis metabolik anion gap tinggi."
    },
    {
      id: "endo-3",
      type: "fill_blank",
      prompt: "Target HbA1c umum untuk sebagian besar pasien dewasa DM Tipe 2 adalah kurang dari ___ %.",
      answer: "7",
      explanation: "Target HbA1c < 7% menurunkan risiko komplikasi mikrovaskular."
    },
    {
      id: "endo-4",
      type: "ordering",
      prompt: "Urutkan langkah awal tatalaksana Ketoasidosis Diabetikum (KAD):",
      sequence: [
        "Resusitasi cairan NaCl 0.9%",
        "Evaluasi kalium serum sebelum insulin",
        "Mulai infus insulin reguler IV",
        "Tambahkan dekstrosa saat GD < 200 mg/dL"
      ],
      answer: "Resusitasi cairan NaCl 0.9%|Evaluasi kalium serum sebelum insulin|Mulai infus insulin reguler IV|Tambahkan dekstrosa saat GD < 200 mg/dL",
      explanation: "Rehidrasi selalu didahulukan, lalu cek kalium untuk mencegah hipokalemia fatal akibat insulin."
    }
  ],
  Kardiovaskular: [
    {
      id: "cardio-1",
      type: "mcq",
      prompt: "Obat yang DIKONTRAINDIKASIKAN pada gagal jantung fraksi ejeksi menurun (HFrEF) adalah:",
      options: ["ARNI / ACEi", "Beta-blocker", "SGLT2 Inhibitor", "Verapamil / Diltiazem"],
      answer: "Verapamil / Diltiazem",
      explanation: "CCB non-dihidropiridin bersifat inotropik negatif dan memperburuk HFrEF."
    }
  ]
};

export function loadVaultUnits(): SystemUnit[] {
  const webpagePath = path.resolve(process.cwd(), "..", "Webpage");
  const units: SystemUnit[] = [];

  if (fs.existsSync(webpagePath)) {
    const folders = fs.readdirSync(webpagePath, { withFileTypes: true })
      .filter((e) => e.isDirectory() && !e.name.startsWith("."));

    folders.forEach((folder, idx) => {
      const sysName = folder.name;
      const sysDir = path.join(webpagePath, sysName);
      const lessons: LessonNode[] = [];

      ["Dasar", "Pato", ""].forEach((sub) => {
        const targetDir = sub ? path.join(sysDir, sub) : sysDir;
        if (!fs.existsSync(targetDir)) return;

        const mdFiles = fs.readdirSync(targetDir)
          .filter((f) => f.endsWith(".md") && !f.toLowerCase().includes("landing"));

        mdFiles.slice(0, 6).forEach((file, fIdx) => {
          const raw = fs.readFileSync(path.join(targetDir, file), "utf-8");
          const title = file.replace(/\.md$/i, "");
          const isQuiz = title.toLowerCase().includes("pre-postest");

          lessons.push({
            id: `${sysName.toLowerCase()}-${sub || "core"}-${fIdx + 1}`,
            unitId: sysName.toLowerCase(),
            title,
            type: isQuiz ? "quiz" : "concept",
            xpReward: isQuiz ? 25 : 15,
            summaryMarkdown: raw.slice(0, 2000),
            questions: QUESTIONS_DB[sysName] || QUESTIONS_DB["Endokrin"]
          });
        });
      });

      if (lessons.length > 0) {
        units.push({
          id: sysName.toLowerCase(),
          name: sysName,
          description: `Modul Sistem ${sysName} (Harrison's & Pre/Post-Test)`,
          color: COLORS[idx % COLORS.length],
          lessons
        });
      }
    });
  }

  return units;
}
