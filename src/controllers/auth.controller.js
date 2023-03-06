import { db } from "../database/db.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";


export async function signUp(req, res){
    const {name, email, password} = req.body

    try {
        const hashedPassword = await bcrypt.hash(password, 10);
        
        const existsUser = await db.query(`
        SELECT * FROM users WHERE email = $1`, [email]);

        if(existsUser.rows.length > 0){
            return res.status(409).json({message: "User already exists"});
        }
        await db.query(`
        INSERT INTO users (name, email, password)
        VALUES ($1, $2, $3)
        `, [name, email, hashedPassword]);
        
        console.log('fez a inclusao');
        res.status(201).json({message: "User created successfully"});

    } catch (error) {
        res.status(500).json({message: "Something went wrong", error})
    }
    

}


export async function signIn(req, res){
    const user = req.body;
    const token = uuid();

    try {

        let existsUser = await db.query(`SELECT id, password FROM users WHERE email = $1`, [user.email]);
        // console.log(existsUser);
    
        if(existsUser && bcrypt.compareSync(user.password, existsUser.rows[0].password)){

            const existToken = await db.query(`
            SELECT * FROM sessions WHERE "userId" = $1`, [existsUser.rows[0].id]);

            await db.query(`
            INSERT INTO sessions ("userId", token)
            VALUES ($1, $2)
            `, [existsUser.rows[0].id, token]);
        
            return res.status(200).json({"token": token});
        }
        return res.status(401).json({message: "Invalid credentials"});

    }catch(error){
        return res.status(500).json({message: "Something went wrong", error})
    }

}