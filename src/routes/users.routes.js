import { Router } from "express";
import {
  getUsers,
  getUser,
  updateUser,
  updateUserState,
} from "../controllers/users.controllers.js";

const router = Router();

router.get("/usuarios", getUsers);
router.get("/usuarios/:id", getUser);
router.put("/usuarios/:id", updateUser);
router.patch("/usuarios/:id/estado", updateUserState);

export default router;
