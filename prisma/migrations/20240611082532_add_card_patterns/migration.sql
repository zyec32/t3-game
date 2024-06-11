/*
  Warnings:

  - Added the required column `pattern` to the `Card` table without a default value. This is not possible if the table is not empty.
  - Added the required column `patternColor` to the `Card` table without a default value. This is not possible if the table is not empty.
  - Added the required column `secondaryColor` to the `Card` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tertiaryColor` to the `Card` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Card" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "backgroundColor" TEXT NOT NULL,
    "pattern" TEXT NOT NULL,
    "patternColor" TEXT NOT NULL,
    "secondaryColor" TEXT NOT NULL,
    "tertiaryColor" TEXT NOT NULL
);
INSERT INTO "new_Card" ("backgroundColor", "id", "image", "name") SELECT "backgroundColor", "id", "image", "name" FROM "Card";
DROP TABLE "Card";
ALTER TABLE "new_Card" RENAME TO "Card";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
