import bcrypt from 'bcrypt';
import { db } from '../database/db.js';

export async function getMyUser(req, res) {
    const { user } = res.locals;

    try {
        const accessNumber = await db.query(`
        SELECT sum("shortedUrls"."accessNumber")
        FROM "shortedUrls"
        WHERE "userId" = $1
        `, [user.id]);
        console.log(accessNumber);


        const userUrls = await db.query(`
        SELECT *
        FROM "shortedUrls"
        WHERE "userId" = $1
        `, [user.id]);
        console.log(userUrls);
        const userUrlsList = userUrls.rows.map((row) => {
            return {
                id: row.id,
                shortedUrl: row.shortedUrl,
                url: row.originalUrl,
                visitCount: row.access,
            }
        })
        res.status(200).json({
            "id": user.id,
            "name": user.name,
            "visitCount": accessNumber.rows[0].sum,
            "shortenedUrls": userUrlsList
        })

    } catch (error) {
        return res.status(500).json({ message: "Something went wrong", error });
    }
}

export async function getRanking(req, res) {

    try {

        const rankingUrls = await db.query(`
            SELECT users.id, users.name, 
            COUNT("shortedUrls".id) as "linksCount",
            SUM(CASE WHEN "shortedUrls"."accessNumber" IS NULL THEN 0 ELSE "shortedUrls"."accessNumber" END) as "visitCount"
            FROM users
            LEFT JOIN "shortedUrls" ON "shortedUrls"."userId" = users.id
            GROUP BY users.id
            ORDER BY "visitCount" DESC
            LIMIT 10
        `);
        console.log(rankingUrls.rows);
        res.send(rankingUrls.rows);

    } catch (error) {
        console.log(error)
        res.status(500).send(error.message)
    }

}