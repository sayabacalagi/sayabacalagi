import { loadVaultUnits } from "@/lib/vault-parser";
import LearningApp from "@/components/LearningApp";

export const dynamic = "force-dynamic";

export default function HomePage() {
  const units = loadVaultUnits();
  return <LearningApp units={units} />;
}
