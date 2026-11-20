import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Sjawatdh Learn — Gamified Medical Academy",
  description: "Platform belajar kedokteran interaktif berbasis catatan dr. Lazuardi",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="id">
      <body className="min-h-screen bg-slate-50 font-sans antialiased">{children}</body>
    </html>
  );
}
