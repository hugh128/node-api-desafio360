import { Router } from "express";
import { authenticateUser, authorizeRole } from "../middleware/authMiddleware.js";
import {
  createCategory,
  getCategories,
  getCategory,
  updateCategory,
  updateCategoryState,
} from "../controllers/categories.controllers.js";

const router = Router();

router.get("/categorias", authenticateUser, authorizeRole(["Administrador", "Operador", "Cliente"]), getCategories);
router.get("/categorias/:id", authenticateUser, authorizeRole(["Administrador", "Operador", "Cliente"]), getCategory);
router.post("/categorias/", authenticateUser, authorizeRole(["Administrador", "Operador"]), createCategory);
router.put("/categorias/:id", authenticateUser, authorizeRole(["Administrador", "Operador"]), updateCategory);
router.patch("/categorias/:id/estado", authenticateUser, authorizeRole(["Administrador", "Operador"]), updateCategoryState);

export default router;
