import { Router } from "express";
import { authenticateUser, authorizeRole } from "../middleware/authMiddleware.js";
import {
  createRol,
  getRol,
  getRoles,
  updateRol,
} from "../controllers/roles.controllers.js";

const router = Router();

router.get("/roles", authenticateUser, authorizeRole(["Administrador", "Operador"]), getRoles);
router.get("/roles/:id", authenticateUser, authorizeRole(["Administrador", "Operador"]), getRol);
router.post("/roles", authenticateUser, authorizeRole(["Administrador", "Operador"]), createRol);
router.put("/roles/:id", authenticateUser, authorizeRole(["Administrador", "Operador"]), updateRol);

export default router;
