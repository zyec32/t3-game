import Link from "next/link";

import StartGameButton from "@/app/_components/StartGameButton";
import { getServerAuthSession } from "@/server/auth";
import { api } from "@/trpc/server";

export default async function Home() {
  const hello = await api.post.hello({ text: "from tRPC" });
  const session = await getServerAuthSession();

  return (
    <div>
      hello
    </div>
  );
}
