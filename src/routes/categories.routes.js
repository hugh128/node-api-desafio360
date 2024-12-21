import { Router } from "express";
import {
  createCategory,
  getCategories,
  getCategory,
  updateCategory,
  updateCategoryState,
} from "../controllers/categories.controllers.js";

const router = Router();

router.get("/categorias", getCategories);
router.get("/categorias/:id", getCategory);
router.post("/categorias/", createCategory);
router.put("/categorias/:id", updateCategory);
router.patch("/categorias/:id/estado", updateCategoryState);

export default router;
