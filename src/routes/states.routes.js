import { Router } from "express";
import {
  createState,
  getState,
  getStates,
  updateState,
} from "../controllers/states.controllers.js";

const router = Router();

router.get("/estados", getStates);

router.get("/estados/:id", getState);

router.post("/estados", createState);

router.put("/estados/:id", updateState);

export default router;
