import { Router } from "express";
import { createUser, loginUser } from "../controllers/auth.controllers.js";

const router = Router();

router.get("/login", loginUser);
router.post("/register", createUser);

export default router;