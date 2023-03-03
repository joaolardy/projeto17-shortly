import db from "../database/db.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";


export default async function signUp(req, res){
    const {name, email, password} = req.body

    const passwordHash = await bcrypt.hash(password, 10);

    try {
        await db.query(`
        INSERT INTO users (name, email, password)
        VALUES ($1, $2, $3)
        `, [name, email, password]);

        res.status(201).json({message: "User created successfully"});

    } catch (error) {
        res.status(500).json({message: "Something went wrong", error})
    }
    

}


export default async function signIn(req, res){
    const user = req.user;
    const token = uuid();

    try {
        await db.query(`
        INSERT INTO sessions ("userId", token)
        VALUES ($1, $2)
        `, [user.id, token]);

        res.status(200).json({message: "User logged in successfully", token});

    }catch(error){
        res.status(500).json({message: "Something went wrong", error})
    }

}