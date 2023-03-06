import { Router } from "express";
import { signIn, signUp } from "../controllers/auth.controller.js";
import { validateSchema } from "../middlewares/validate.middleware.js";
import loginSchema from "../schemas/login.schema.js";
import newUserSchema from "../schemas/newUser.schema.js"; 
const authRoutes =  Router();

authRoutes.post('/signin', validateSchema(loginSchema) , signIn);
authRoutes.post('/signup', validateSchema(newUserSchema) , signUp);


export default authRoutes;