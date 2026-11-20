import { loadVaultUnits } from "@/lib/vault-parser";
import LessonPlayer from "@/components/LessonPlayer";
import { notFound } from "next/navigation";

export function generateStaticParams() {
  const units = loadVaultUnits();
  return units.flatMap((u) => u.lessons).map((l) => ({
    lessonId: l.id,
  }));
}

export default function LessonPage({ params }: { params: { lessonId: string } }) {
  const decodedId = decodeURIComponent(params.lessonId);
  const units = loadVaultUnits();
  const lesson = units.flatMap((u) => u.lessons).find((l) => l.id === decodedId);

  if (!lesson) return notFound();
  return <LessonPlayer lesson={lesson} />;
}