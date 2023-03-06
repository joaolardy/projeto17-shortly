import { db } from "../database/db.js";
import { nanoid } from "nanoid";

export async function shortenUrl(req, res){
    const body = req.body;
    const user = res.locals.user;
    // console.log(user, body.url);
    const shortedUrl = nanoid(8);

    try {
        // console.log(body.url);
        // console.log( shortedUrl, user.id);
        const shortenUrl = await db.query(`INSERT INTO "shortedUrls" ("originalUrl", "shortedUrl", "userId") VALUES ($1, $2, $3) RETURNING id`, [body.url, shortedUrl, user.id]);
        const shortedUrlId = shortenUrl.rows[0].id;
        // console.log('passou aqui', shortedUrlId);
        res.status(201).json({"id": shortedUrlId, "url": shortedUrl});
    } catch (error) {
        return res.status(500).json({message: "Something went wrong", error});
    }

}

export async function getUrl(req, res){
    const id = req.params.id;
    try {
        const url = await db.query(`SELECT id, "originalUrl", "shortedUrl" FROM "shortedUrls" WHERE id = $1`, [id]);
        if(url.rowCount === 0){
            return res.status(404).json({message: "Url not found"});
        }
        res.status(200).json({
            "id": url.rows[0].id,
            "shortUrl": url.rows[0].shortedUrl,
            "url": url.rows[0].originalUrl,
        });
    } catch (error) {
        return res.status(500).json({message: "Something went wrong", error});
    }
}

export async function openUrl(req, res){
    const shortUrl = req.params.shortUrl;
     try {
        const url = await db.query(`SELECT * FROM "shortedUrls" WHERE "shortedUrl" = $1`, [shortUrl]);
        if(url.rowCount === 0){
            return res.status(404).json({message: "Url not found"});
        }
        const accessCount = await db.query(`UPDATE "shortedUrls" SET "accessNumber" = "accessNumber" + 1 WHERE "shortedUrl" = $1 RETURNING "accessNumber"`, [shortUrl]);
        // console.log(url);
        return res.redirect(url.rows[0].originalUrl);

     } catch (error) {
        return res.status(500).json({message: "Something went wrong", error});
     }
}

export async function deleteShortenUrl(req, res){
    const { id } = req.params;
    const { user } = res.locals;

    try {
        const existShortedUrl = await db.query(`SELECT * FROM "shortedUrls" WHERE id = $1`, [id]);
        console.log(user, existShortedUrl.rows[0].userId, ' ', user.id);
        if(existShortedUrl.rowCount === 0){
            return res.status(404).json({message: "Url not found"});
        }
        if(existShortedUrl.rows[0].userId !== user.id){
            return res.status(401).json({message: "Unauthorized"});
        }
        
        await db.query(`DELETE FROM "shortedUrls" WHERE id = $1`, [id]);

        res.status(204).json({message: "Url deleted"});

    } catch (error) {
        return res.status(500).json({message: "Something went wrong", error});
    }
}