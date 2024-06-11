-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Game" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "playerCount" INTEGER NOT NULL,
    "isActibe" BOOLEAN NOT NULL DEFAULT true
);
INSERT INTO "new_Game" ("id", "playerCount") SELECT "id", "playerCount" FROM "Game";
DROP TABLE "Game";
ALTER TABLE "new_Game" RENAME TO "Game";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
