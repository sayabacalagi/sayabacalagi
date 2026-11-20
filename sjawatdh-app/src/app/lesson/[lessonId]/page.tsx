import { loadVaultUnits } from "@/lib/vault-parser";
import LessonPlayer from "@/components/LessonPlayer";
import { notFound } from "next/navigation";

export const dynamic = "force-dynamic";

export default function LessonPage({ params }: { params: { lessonId: string } }) {
  const decodedId = decodeURIComponent(params.lessonId);
  const units = loadVaultUnits();
  const lesson = units.flatMap((u) => u.lessons).find((l) => l.id === decodedId);

  if (!lesson) return notFound();
  return <LessonPlayer lesson={lesson} />;
}
