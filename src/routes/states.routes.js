import { Router } from "express";
import {
  createState,
  getState,
  getStates,
  updateState,
} from "../controllers/states.controllers.js";
import { authenticateUser, authorizeRole } from "../middleware/authMiddleware.js";

const router = Router();

router.get("/estados", authenticateUser, authorizeRole(["Administrador", "Operador"]), getStates);
router.get("/estados/:id", authenticateUser, authorizeRole(["Administrador", "Operador"]), getState);
router.post("/estados", authenticateUser, authorizeRole(["Administrador", "Operador"]), createState);
router.put("/estados/:id", authenticateUser, authorizeRole(["Administrador", "Operador"]), updateState);

export default router;
