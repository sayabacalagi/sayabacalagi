import fs from "fs";
import path from "path";

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
}

export interface LessonNode {
  id: string;
  unitId: string;
  title: string;
  category: "Dasar" | "Patofisiologi" | "Pre/Post-Test";
  xpReward: number;
  slides: StudySlide[];
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
  "bg-teal-500 border-teal-700",
];

function fixMojibakeAndClean(raw: string): string {
  return raw
    .replace(/\r\n/g, "\n")
    .replace(/^==NILAI PRETEST[^\n]*\n*/i, "") // Hapus header internal
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
    .replace(/\[\[([^|\]]+)|([^\]]+)\]\]/g, "$2")
    .replace(/\[\[([^\]]+)\]\]/g, "$1")
    .replace(/---+\s*\[?← Back to[^\n]*/gi, "")
    .replace(/\*\*([^*]+)\*\*/g, "$1")
    .trim();
}

function splitChapterIntoSlides(cleaned: string, fallbackTitle: string): StudySlide[] {
  // Potong bagian Further Reading / daftar pustaka ber-encoding rusak di akhir
  const mainBody = cleaned.split(/■\s*FURTHER READING/i)[0].trim();

  // Pecah berdasarkan simbol ■ atau heading Markdown # / ##
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

    // Rapikan spasi terputus hasil PDF (mis. "under standing" -> biarkan terbaca, pecah per 3-4 kalimat jadi paragraf nyaman)
    const sentences = content
      .replace(/\s+/g, " ")
      .split(/(?<=[.!?])\s+(?=[A-Z0-9■(])/)
      .filter(Boolean);

    const paragraphs: string[] = [];
    for (let i = 0; i < sentences.length; i += 4) {
      paragraphs.push(sentences.slice(i, i + 4).join(" "));
    }

    // Jika satu bagian terlalu panjang (> 4 paragraf), bagi menjadi beberapa slide
    for (let p = 0; p < paragraphs.length; p += 3) {
      const partNum = Math.floor(p / 3) + 1;
      const totalParts = Math.ceil(paragraphs.length / 3);
      slides.push({
        heading: totalParts > 1 ? `${heading} (${partNum}/${totalParts})` : heading,
        paragraphs: paragraphs.slice(p, p + 3),
      });
    }
  });

  return slides.length > 0
    ? slides
    : [{ heading: fallbackTitle, paragraphs: [mainBody.slice(0, 1200)] }];
}

function parsePrePostTestQuestions(cleaned: string, lessonId: string): Question[] {
  // Pisahkan bagian soal dan bagian **Kunci Jawaban:**
  const parts = cleaned.split(/Kunci Jawaban\s*:/i);
  const questionSection = parts[0] || "";
  const answerSection = parts[1] || "";

  // Peta nomor soal -> indeks opsi (A=0, B=1, C=2, D=3, E=4)
  const answerMap: Record<number, number> = {};
  const ansMatches = answerSection.matchAll(/(\d+)\.\s*([A-E])\b/gi);
  for (const m of ansMatches) {
    const qNum = parseInt(m[1], 10);
    const letter = m[2].toUpperCase();
    answerMap[qNum] = letter.charCodeAt(0) - 65;
  }

  // Pecah per blok nomor soal "1. ...", "2. ..."
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
        explanation: `Kunci jawaban soal #${qNum} adalah ${ansLetter}. ${options[ansIdx]}`,
      });
    }
  });

  return questions;
}

export function loadVaultUnits(): SystemUnit[] {
  const webpagePath = "E:\\sayabacalagi\\Webpage";
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

      // Pasangkan file materi dengan file Pre-postest di folder yang sama
      const testFiles = mdFiles.filter((f) => f.toLowerCase().includes("pre-postest"));
      const materialFiles = mdFiles.filter((f) => !f.toLowerCase().includes("pre-postest"));

      // Buat node materi terlebih dahulu, lalu node Pre/Post-Test setelahnya
      materialFiles.forEach((file, mIdx) => {
        const raw = fs.readFileSync(path.join(targetDir, file), "utf-8");
        const cleaned = fixMojibakeAndClean(raw);
        const title = file.replace(/\.md$/i, "");
        const lessonId = `${sysName.toLowerCase()}-${sub || "core"}-mat-${mIdx + 1}`;

        // Cari file Pre-postest yang sesuai nomornya (mis. Endokrin 1 -> Endokrin Pre-postest 1)
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
          xpReward: 20,
          slides: splitChapterIntoSlides(cleaned, title),
          questions: linkedQuestions.slice(0, 5), // 5 soal cepat setelah baca slide materi
        });
      });

      // Tambahkan juga node khusus Pre/Post-Test penuh (15 soal lengkap)
      testFiles.forEach((file, tIdx) => {
        const raw = fs.readFileSync(path.join(targetDir, file), "utf-8");
        const cleaned = fixMojibakeAndClean(raw);
        const title = file.replace(/\.md$/i, "");
        const lessonId = `${sysName.toLowerCase()}-${sub || "core"}-test-${tIdx + 1}`;
        const questions = parsePrePostTestQuestions(cleaned, lessonId);

        if (questions.length > 0) {
          lessons.push({
            id: lessonId,
            unitId: sysName.toLowerCase(),
            title,
            category: "Pre/Post-Test",
            xpReward: 35,
            slides: [],
            questions,
          });
        }
      });
    });

    if (lessons.length > 0) {
      units.push({
        id: sysName.toLowerCase(),
        name: sysName,
        description: `${lessons.length} modul belajar & kuis klinis sistem ${sysName}`,
        color: COLORS[idx % COLORS.length],
        lessons,
      });
    }
  });

  return units;
}
