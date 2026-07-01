-- Up
ALTER TABLE "media" ADD COLUMN "fileSize" integer NOT NULL DEFAULT(0);
ALTER TABLE "media" ADD COLUMN "fileMtimeMs" integer NOT NULL DEFAULT(0);
ALTER TABLE "media" ADD COLUMN "sidecarSize" integer NOT NULL DEFAULT(0);
ALTER TABLE "media" ADD COLUMN "sidecarMtimeMs" integer NOT NULL DEFAULT(0);

CREATE INDEX IF NOT EXISTS idxMediaPathRelPath ON "media" ("pathId" ASC, "relPath" ASC);
CREATE INDEX IF NOT EXISTS idxMediaPath ON "media" ("pathId" ASC);
CREATE INDEX IF NOT EXISTS idxSongArtistTitleNorm ON "songs" ("artistId" ASC, "titleNorm" ASC);

-- Down
DROP INDEX idxSongArtistTitleNorm;
DROP INDEX idxMediaPath;
DROP INDEX idxMediaPathRelPath;

ALTER TABLE "media" DROP COLUMN "sidecarMtimeMs";
ALTER TABLE "media" DROP COLUMN "sidecarSize";
ALTER TABLE "media" DROP COLUMN "fileMtimeMs";
ALTER TABLE "media" DROP COLUMN "fileSize";
