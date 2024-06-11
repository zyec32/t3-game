-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Card" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "image" TEXT,
    "backgroundColor" TEXT NOT NULL,
    "pattern" TEXT NOT NULL,
    "patternColor" TEXT NOT NULL,
    "secondaryColor" TEXT NOT NULL,
    "tertiaryColor" TEXT NOT NULL
);
INSERT INTO "new_Card" ("backgroundColor", "id", "image", "name", "pattern", "patternColor", "secondaryColor", "tertiaryColor") SELECT "backgroundColor", "id", "image", "name", "pattern", "patternColor", "secondaryColor", "tertiaryColor" FROM "Card";
DROP TABLE "Card";
ALTER TABLE "new_Card" RENAME TO "Card";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
