import { Router } from "express";
import { createProduct, getProduct, getProducts, updateProduct, updateProductState } from "../controllers/products.controllers.js";
import { authenticateUser, authorizeRole } from "../middleware/authMiddleware.js";

const router = Router();

router.get("/productos", authenticateUser, authorizeRole(["Administrador", "Operador", "Cliente"]), getProducts);
router.get("/productos/:id", authenticateUser, authorizeRole(["Administrador", "Operador", "Cliente"]), getProduct);
router.post("/productos", authenticateUser, authorizeRole(["Administrador", "Operador"]), createProduct);
router.put("/productos/:id", authenticateUser, authorizeRole(["Administrador", "Operador"]), updateProduct);
router.patch("/productos/:id/estado", authenticateUser, authorizeRole(["Administrador", "Operador"]), updateProductState);

export default router;