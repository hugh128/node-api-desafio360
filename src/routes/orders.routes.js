import { Router } from "express";
import { createOrder, getOrder, getOrders, updateOrder, updateOrderState, getOrderDetail } from "../controllers/orders.controllers.js";
import { authenticateUser, authenticateUser } from "../middleware/authMiddleware.js";

const router = Router();

router.get("/ordenes", authenticateUser, authorizeRole(["Administrador", "Operador", "Cliente"]), getOrders);
router.get("/ordenes/:id", authenticateUser, authorizeRole(["Administrador", "Operador", "Cliente"]), getOrder);
router.get("/ordenes/:id/detalle", authenticateUser, authorizeRole(["Administrador", "Operador", "Cliente"]), getOrderDetail)
router.post("/ordenes", authenticateUser, authorizeRole(["Administrador", "Operador", "Cliente"]), createOrder);
router.put("/ordenes/:id", authenticateUser, authorizeRole(["Administrador", "Operador", "Cliente"]), updateOrder);
router.patch("/ordenes/:id/estado", authenticateUser, authorizeRole(["Administrador", "Operador"]), updateOrderState);

export default router;