import { Router } from "express";
import { shortenUrl, getUrl, openUrl, deleteShortenUrl} from "../controllers/urls.controller.js";
import { tokenValidation } from "../middlewares/authorization.middleware.js";

const urlRoutes =  Router();

urlRoutes.post('/urls/shorten', tokenValidation, shortenUrl);
urlRoutes.get('/urls/:id', getUrl);
urlRoutes.get('/urls/open/:shortUrl', openUrl);
urlRoutes.delete('/urls/:id', tokenValidation, deleteShortenUrl);



export default urlRoutes;