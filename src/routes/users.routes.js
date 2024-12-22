import { Router } from "express";
import { authenticateUser, authorizeRole } from "../middleware/authMiddleware.js";
import {
  getUsers,
  getUser,
  updateUser,
  updateUserState,
} from "../controllers/users.controllers.js";

const router = Router();

router.get("/usuarios", authenticateUser, authorizeRole(["Administrador", "Operador"]), getUsers);
router.get("/usuarios/:id", authenticateUser, authorizeRole(["Administrador", "Operador"]), getUser);
router.put("/usuarios/:id", authenticateUser, authorizeRole(["Administrador", "Operador"]), updateUser);
router.patch("/usuarios/:id/estado", authenticateUser, authorizeRole(["Administrador", "Operador"]), updateUserState);

export default router;
