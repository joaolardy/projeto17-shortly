import { Router } from "express";
import { signIn, signUp } from "../controllers/auth.controller";

const authRoutes =  Router();

authRoutes.post('/signin', validateSignIn);
authRoutes.post('/signup', validateSignUp);


export default authRoutes;