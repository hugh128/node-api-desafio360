import { Router } from "express";
import {
  getUsers,
  getUser,
  createUser,
  updateUser,
  updateUserStatus,
} from "../controllers/users.controllers.js";

const router = Router();

router.get("/usuarios", getUsers);
router.get("/usuarios/:id", getUser);
router.post("/usuarios", createUser);
router.put("/usuarios/:id", updateUser);
router.patch("/usuarios/:id/estado", updateUserStatus);

export default router;
