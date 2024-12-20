import { Router } from "express";
import {
  createRol,
  getRol,
  getRoles,
  updateRol,
} from "../controllers/roles.controllers.js";

const router = Router();

router.get("/roles", getRoles);
router.get("/roles/:id", getRol);
router.post("/roles", createRol);
router.put("/roles/:id", updateRol);

export default router;
