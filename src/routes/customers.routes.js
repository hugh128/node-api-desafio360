import { Router } from "express";
import {
  createCustomer,
  getCustomer,
  getCustomers,
  updateCustomer,
} from "../controllers/customers.controllers.js";

const router = Router();

router.get("/clientes", getCustomers);
router.get("/clientes/:id", getCustomer);
router.post("/clientes", createCustomer);
router.put("/clientes/:id", updateCustomer);

export default router;
