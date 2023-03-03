import { Router } from "express";
import { signIn, signUp } from "../controllers/auth.controller";

const urlRoutes =  Router();

urlRoutes.post('/urls/shorten"', );
urlRoutes.get('/urls/:id', );
urlRoutes.get('/urls/open/:shortUrl', );
urlRoutes.delete('/urls/:id', );



export default urlRoutes;