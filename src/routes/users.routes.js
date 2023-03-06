import { Router } from "express";
import { getRanking, getMyUser } from "../controllers/users.controller.js";
import { tokenValidation } from "../middlewares/authorization.middleware.js";
const usersRoutes = Router();

usersRoutes.get("/users/me",tokenValidation, getMyUser);
usersRoutes.get("/ranking", getRanking);

export default usersRoutes;