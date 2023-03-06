import { db } from "../database/db.js"

export async function tokenValidation(req, res, next){
    const authorization = req.headers.authorization;
    const cleanToken = authorization?.replace('Bearer ', '');

    if(!cleanToken){
        return res.status(401).json({message: "Token not provided"});
    }

    try {
        const existsToken = await db.query(`SELECT * FROM sessions WHERE token = $1`, [cleanToken]);
        if(existsToken.rowCount === 0){
            return res.status(401).json({message: "Invalid token"});
        }
        const userOfToken = await db.query(`SELECT * FROM users WHERE id = $1`, [existsToken.rows[0].userId]);
        if(userOfToken.rowCount === 0){
            return res.status(401).json({message: "Invalid token"});
        }
        // console.log(userOfToken.rows[0]);
        res.locals.user = userOfToken.rows[0]
        next()

    } catch (error) {
        return res.status(500).json({message: "Something went wrong", error});
    }
}