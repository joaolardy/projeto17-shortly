import urlRoutes from "./urls.routes.js";
import authRoutes from "./auth.routes.js";
import usersRoutes from "./users.routes.js";
import { Router } from "express";

const routes = Router();

routes.use(urlRoutes);
routes.use(authRoutes);
routes.use(usersRoutes);

export default routes;
