import Link from "next/link";

import StartGameButton from "@/app/_components/StartGameButton";
import { getServerAuthSession } from "@/server/auth";
import { api } from "@/trpc/server";
import { useMemo, useState } from "react";

interface CardComponentType {
  name: string | null,
  backgroundColor: string | null,
  pattern: string | null,
  patternColor: string | null,
  secondaryColor: string | null,
  tertiaryColor: string | null,
}

function CardComponent(
  {
    name,
    backgroundColor,
    pattern,
    patternColor,
    secondaryColor,
    tertiaryColor,
  }: CardComponentType
) {
  if (
    !name ||
    !backgroundColor ||
    !pattern ||
    !patternColor ||
    !secondaryColor ||
    !tertiaryColor
  ) {
    return <div>
      указаны неверные данные
    </div>
  }
  return <>карточка</>

}

export default async function CreateCard() {
  // const createCard = api.card.create
  const session = await getServerAuthSession();

  const [name, setName] = useState<string | null>(null)
  const [backgroundColor, setBackgroundColor] = useState<string | null>(null)
  const [pattern, setPattern] = useState<string | null>(null)
  const [patternColor, setPatternColor] = useState<string | null>(null)
  const [secondaryColor, setSecondaryColor] = useState<string | null>(null)
  const [tertiaryColor, setTertiaryColor] = useState<string | null>(null)

  const createCardApi = async ({
    name,
    backgroundColor,
    pattern,
    patternColor,
    secondaryColor,
    tertiaryColor,
  }: CardComponentType) => {
    if (
      !name ||
      !backgroundColor ||
      !pattern ||
      !patternColor ||
      !secondaryColor ||
      !tertiaryColor
    ) {
      console.error('invalid card data')
      return
    }

    return await api.card.create({
      name,
      backgroundColor,
      pattern,
      patternColor,
      secondaryColor,
      tertiaryColor,
    })
  }

  return (
    <div>
      <CardComponent
        name={name}
        backgroundColor={backgroundColor}
        pattern={pattern}
        patternColor={patternColor}
        secondaryColor={secondaryColor}
        tertiaryColor={tertiaryColor}
      />
    </div>
  );
}
