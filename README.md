# api-enquete
# projeto17-shortly

sudo su -c "pg_dump shortly --inserts --no-owner" postgres > dump.sql

ALTER TABLE sessions
ADD CONSTRAINT nome_restricao UNIQUE ("u"serId");

CREATE TABLE "sessions" (
        "id" serial PRIMARY KEY NOT NULL ,
        "userId" integer UNIQUE NOT NULL REFERENCES "users"("id"),
        "token" TEXT NOT NULL UNIQUE,
        "expired" BOOLEAN NOT NULL DEFAULT 'false',
        "createdAt" TIMESTAMP NOT NULL DEFAULT 'NOW()'
);

ALTER TABLE "sessions" DROP CONSTRAINT user_email_key;

SELECT sum("shortedUrls"."accessNumber")
        FROM "shortedUrls"
        WHERE "userId" = 4;