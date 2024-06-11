-- CreateTable
CREATE TABLE "Card" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "backgroundColor" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Game" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "playerCount" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "Player" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userId" TEXT NOT NULL,
    "gameId" INTEGER NOT NULL,
    "revealedCardsCount" INTEGER NOT NULL DEFAULT 0,
    "timesRevealed" INTEGER NOT NULL DEFAULT 0,
    CONSTRAINT "Player_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Player_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "GameCard" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "gameId" INTEGER NOT NULL,
    "cardId" INTEGER NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'FREE',
    "playerId" INTEGER,
    "revealerId" INTEGER,
    "xCoordinate" INTEGER,
    "yCoordinate" INTEGER,
    CONSTRAINT "GameCard_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "GameCard_cardId_fkey" FOREIGN KEY ("cardId") REFERENCES "Card" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "GameCard_playerId_fkey" FOREIGN KEY ("playerId") REFERENCES "Player" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "GameCard_revealerId_fkey" FOREIGN KEY ("revealerId") REFERENCES "Player" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Player_userId_gameId_key" ON "Player"("userId", "gameId");

-- CreateIndex
CREATE UNIQUE INDEX "GameCard_gameId_cardId_key" ON "GameCard"("gameId", "cardId");
