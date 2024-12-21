import { Router } from "express";
import { createProduct, getProduct, getProducts, updateProduct, updateProductState } from "../controllers/products.controllers.js";

const router = Router();

router.get("/productos", getProducts);
router.get("/productos/:id", getProduct);
router.post("/productos", createProduct);
router.put("/productos/:id", updateProduct);
router.patch("/productos/:id/estado", updateProductState);

export default router;