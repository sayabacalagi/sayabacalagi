import fs from "fs";
import path from "path";
import { pickBrotyMidReading, type BrotyInjection } from "./broty-copy";

export interface Question {
  id: string;
  number: number;
  prompt: string;
  options: string[];
  answerIndex: number;
  answerText: string;
  explanation: string;
}

export interface StudySlide {
  heading: string;
  paragraphs: string[];
  broty?: BrotyInjection;
}

export interface LessonNode {
  id: string;
  unitId: string;
  title: string;
  category: "Dasar" | "Patofisiologi";
  slides: StudySlide[];
  questions: Question[];
}

export interface SystemUnit {
  id: string;
  name: string;
  description: string;
  accentColor: string;
  lessons: LessonNode[];
}

const ACCENTS = [
  "border-teal-500 bg-teal-50/60 text-teal-900",
  "border-cyan-500 bg-cyan-50/60 text-cyan-900",
  "border-emerald-500 bg-emerald-50/60 text-emerald-900",
  "border-sky-500 bg-sky-50/60 text-sky-900",
  "border-indigo-500 bg-indigo-50/60 text-indigo-900",
];

function fixMojibakeAndClean(raw: string): string {
  return raw
    .replace(/\r\n/g, "\n")
    .replace(/^==NILAI PRETEST[^\n]*\n*/i, "")
    .replace(/â€”|â€“/g, "—")
    .replace(/â€™|â€˜/g, "'")
    .replace(/â€œ|â€/g, '"')
    .replace(/â€¦/g, "…")
    .replace(/â‰¥/g, "≥")
    .replace(/â‰¤/g, "≤")
    .replace(/â– /g, "■")
    .replace(/Î±/g, "α")
    .replace(/Î²/g, "β")
    .replace(/Î³/g, "γ")
    .replace(/Â/g, "")
    .replace(/!\[\[([^\]]+)\]\]/g, "")
    .replace(/\[\[([^|\]]+)\|([^\]]+)\]\]/g, "$2")
    .replace(/\[\[([^\]]+)\]\]/g, "$1")
    .replace(/---+\s*\[?← Back to[^\n]*/gi, "")
    .replace(/\*\*([^*]+)\*\*/g, "$1")
    .trim();
}

function splitChapterIntoSlides(cleaned: string, fallbackTitle: string, seedIdx: number): StudySlide[] {
  const mainBody = cleaned.split(/■\s*FURTHER READING/i)[0].trim();

  const rawSections = mainBody
    .split(/(?=■\s*[A-Z0-9][^\n]{3,80}|^#{1,3}\s+[^\n]+)/gm)
    .map((s) => s.trim())
    .filter((s) => s.length > 30);

  const slides: StudySlide[] = [];

  (rawSections.length > 0 ? rawSections : [mainBody]).forEach((sec) => {
    let heading = fallbackTitle;
    let content = sec;

    const squareMatch = sec.match(/^■\s*([A-Z0-9\s\-\/\(\),:]{4,75})(?:\s+)(.*)$/s);
    const mdHeadingMatch = sec.match(/^#{1,3}\s+([^\n]+)\n([\s\S]*)$/);

    if (mdHeadingMatch) {
      heading = mdHeadingMatch[1].trim();
      content = mdHeadingMatch[2].trim();
    } else if (squareMatch) {
      heading = squareMatch[1].trim();
      content = squareMatch[2].trim();
    }

    const sentences = content
      .replace(/\s+/g, " ")
      .split(/(?<=[.!?])\s+(?=[A-Z0-9■(])/)
      .filter(Boolean);

    const paragraphs: string[] = [];
    for (let i = 0; i < sentences.length; i += 4) {
      paragraphs.push(sentences.slice(i, i + 4).join(" "));
    }

    for (let p = 0; p < paragraphs.length; p += 3) {
      const partNum = Math.floor(p / 3) + 1;
      const totalParts = Math.ceil(paragraphs.length / 3);
      slides.push({
        heading: totalParts > 1 ? `${heading} (${partNum}/${totalParts})` : heading,
        paragraphs: paragraphs.slice(p, p + 3),
      });
    }
  });

  const finalSlides =
    slides.length > 0
      ? slides
      : [{ heading: fallbackTitle, paragraphs: [mainBody.slice(0, 1200)] }];

  // Aturan Placement Broty: max 1 bubble per chapter, di tengah (bukan slide 1 & bukan slide terakhir)
  if (finalSlides.length >= 3) {
    const midIndex = Math.floor(finalSlides.length / 2);
    finalSlides[midIndex].broty = pickBrotyMidReading(seedIdx);
  }

  return finalSlides;
}

function parsePrePostTestQuestions(cleaned: string, lessonId: string): Question[] {
  const parts = cleaned.split(/Kunci Jawaban\s*:/i);
  const questionSection = parts[0] || "";
  const answerSection = parts[1] || "";

  const answerMap: Record<number, number> = {};
  const ansMatches = answerSection.matchAll(/(\d+)\.\s*([A-E])\b/gi);
  for (const m of ansMatches) {
    const qNum = parseInt(m[1], 10);
    const letter = m[2].toUpperCase();
    answerMap[qNum] = letter.charCodeAt(0) - 65;
  }

  const qBlocks = questionSection
    .split(/\n(?=\d+\.\s+)/g)
    .map((b) => b.trim())
    .filter((b) => /^\d+\.\s+/.test(b));

  const questions: Question[] = [];

  qBlocks.forEach((blk) => {
    const lines = blk
      .split("\n")
      .map((l) => l.trim())
      .filter(Boolean);

    const firstMatch = lines[0].match(/^(\d+)\.\s+(.*)$/);
    if (!firstMatch) return;

    const qNum = parseInt(firstMatch[1], 10);
    const promptLines = [firstMatch[2]];
    const options: string[] = [];

    for (let i = 1; i < lines.length; i++) {
      const optMatch = lines[i].match(/^([A-E])[\.\)]\s+(.*)$/i);
      if (optMatch) {
        options.push(optMatch[2].trim());
      } else if (options.length === 0) {
        promptLines.push(lines[i]);
      }
    }

    if (options.length >= 2) {
      const ansIdx = answerMap[qNum] !== undefined && options[answerMap[qNum]] ? answerMap[qNum] : 0;
      const ansLetter = String.fromCharCode(65 + ansIdx);
      questions.push({
        id: `${lessonId}-q${qNum}`,
        number: qNum,
        prompt: promptLines.join(" "),
        options,
        answerIndex: ansIdx,
        answerText: options[ansIdx],
        explanation: `Jawaban tepat: ${ansLetter}. ${options[ansIdx]}`,
      });
    }
  });

  return questions;
}

export function loadVaultUnits(): SystemUnit[] {
  const webpagePath = path.resolve(process.cwd(), "..", "Webpage");
  const units: SystemUnit[] = [];

  if (!fs.existsSync(webpagePath)) return units;

  const folders = fs
    .readdirSync(webpagePath, { withFileTypes: true })
    .filter((e) => e.isDirectory() && !e.name.startsWith("."));

  folders.forEach((folder, idx) => {
    const sysName = folder.name;
    const sysDir = path.join(webpagePath, sysName);
    const lessons: LessonNode[] = [];

    (["Dasar", "Pato", ""] as const).forEach((sub) => {
      const targetDir = sub ? path.join(sysDir, sub) : sysDir;
      if (!fs.existsSync(targetDir)) return;

      const mdFiles = fs
        .readdirSync(targetDir)
        .filter((f) => f.endsWith(".md") && !f.toLowerCase().includes("landing"))
        .sort((a, b) => a.localeCompare(b, undefined, { numeric: true }));

      const testFiles = mdFiles.filter((f) => f.toLowerCase().includes("pre-postest"));
      const materialFiles = mdFiles.filter((f) => !f.toLowerCase().includes("pre-postest"));

      materialFiles.forEach((file, mIdx) => {
        const raw = fs.readFileSync(path.join(targetDir, file), "utf-8");
        const cleaned = fixMojibakeAndClean(raw);
        const title = file.replace(/\.md$/i, "");
        const lessonId = `${sysName.toLowerCase()}-${sub || "core"}-mod-${mIdx + 1}`;

        const numMatch = title.match(/(\d+)\s*$/);
        const matchingTestFile = numMatch
          ? testFiles.find((tf) => tf.includes(numMatch[1]))
          : testFiles[mIdx];

        let linkedQuestions: Question[] = [];
        if (matchingTestFile) {
          const testRaw = fs.readFileSync(path.join(targetDir, matchingTestFile), "utf-8");
          linkedQuestions = parsePrePostTestQuestions(fixMojibakeAndClean(testRaw), lessonId);
        }

        lessons.push({
          id: lessonId,
          unitId: sysName.toLowerCase(),
          title,
          category: sub === "Pato" ? "Patofisiologi" : "Dasar",
          slides: splitChapterIntoSlides(cleaned, title, idx * 10 + mIdx),
          questions: linkedQuestions,
        });
      });
    });

    if (lessons.length > 0) {
      units.push({
        id: sysName.toLowerCase(),
        name: sysName,
        description: `${lessons.length} modul terstruktur (Pretest → Materi → Posttest)`,
        accentColor: ACCENTS[idx % ACCENTS.length],
        lessons,
      });
    }
  });

  return units;
}