import { Router } from "express";
import {
  createState,
  deleteState,
  getState,
  getStates,
  updateState,
} from "../controllers/states.controllers.js";

const router = Router();

router.get("/estados", getStates);

router.get("/estados/:id", getState);

router.post("/estados", createState);

router.put("/estados/:id", updateState);

router.delete("/estados/:id", deleteState);

export default router;
