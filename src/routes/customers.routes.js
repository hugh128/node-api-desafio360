import { Router } from "express";
import { authenticateUser, authorizeRole } from "../middleware/authMiddleware.js";
import {
  createCustomer,
  getCustomer,
  getCustomers,
  updateCustomer,
} from "../controllers/customers.controllers.js";

const router = Router();

router.get("/clientes", authenticateUser, authorizeRole(["Administrador", "Operador"]), getCustomers);
router.get("/clientes/:id", authenticateUser, authorizeRole(["Administrador", "Operador", "Cliente"]), getCustomer);
router.post("/clientes", authenticateUser, authorizeRole(["Administrador", "Operador"]), createCustomer);
router.put("/clientes/:id", authenticateUser, authorizeRole(["Administrador", "Operador", "Cliente"]), updateCustomer);

export default router;
