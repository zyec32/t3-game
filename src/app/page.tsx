import Link from "next/link";

import StartGameButton from "@/app/_components/StartGameButton";
import { getServerAuthSession } from "@/server/auth";
import { api } from "@/trpc/server";

export default async function Home() {
  const hello = await api.post.hello({ text: "from tRPC" });
  const session = await getServerAuthSession();

  return (
    <div className="flex flex-col items-center gap-2">
      <p className="text-2xl text-white">
        {hello ? hello.greeting : "Loading tRPC query..."}
      </p>

      <div className="flex flex-col items-center justify-center gap-4">
        <p className="text-center text-2xl text-white">
          {session && <span>{session.user?.name}</span>}
        </p>
        <Link
          href={session ? "/api/auth/signout" : "/api/auth/signin"}
          className="rounded-full bg-white/10 px-10 py-3 font-semibold no-underline transition hover:bg-white/20"
        >
          {session ? "Выйти" : "Войти"}
        </Link>
      </div>


      <div className="flex flex-col items-center justify-center gap-4">
        <StartGameButton />
      </div>
    </div>
  );
}
