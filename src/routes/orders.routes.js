import { Router } from "express";
import { createOrder, getOrder, getOrders, updateOrder, updateOrderState, getOrderDetail } from "../controllers/orders.controllers.js";

const router = Router();

router.get("/ordenes", getOrders);
router.get("/ordenes/:id", getOrder);
router.get("/ordenes/:id/detalle", getOrderDetail)
router.post("/ordenes", createOrder);
router.put("/ordenes/:id", updateOrder);
router.patch("/ordenes/:id/estado", updateOrderState);

export default router;