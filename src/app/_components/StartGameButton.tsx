"use client"; // Добавьте эту директиву, чтобы указать, что это клиентский компонент

import { useRouter } from "next/navigation";

export default function StartGameButton() {
  const router = useRouter();

  return (
    <button
      onClick={() => router.push("/game")}
      className="rounded-full bg-white/10 px-10 py-3 font-semibold no-underline transition hover:bg-white/20"
    >
      Начать игру
    </button>
  );
}
