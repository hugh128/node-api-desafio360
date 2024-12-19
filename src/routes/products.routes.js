import { Router } from "express";
import {
  createProduct,
  deleteProduct,
  getProduct,
  getProducts,
  updateProduct,
} from "../controllers/products.controllers.js";

const router = Router(); //Permite crear rutas

router.get("/productos", getProducts);

router.get("/productos/:id", getProduct);

router.post("/productos", createProduct);

router.put("/productos/:id", updateProduct);

router.delete("/productos/:id", deleteProduct);

export default router;