import { Router } from "express";
import { createUser, loginUser } from "../controllers/auth.controllers.js";
import { authenticateUser, authorizeRole } from "../middleware/authMiddleware.js";

const router = Router();

router.get("/login", loginUser);
router.post("/register", authenticateUser, authorizeRole(["Administrador", "Operador"]), createUser);

export default router;