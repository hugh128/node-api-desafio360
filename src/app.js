import expres, { urlencoded } from "express";
import cors from "cors";
import morgan from "morgan";
import prodcutsRoutes from "./routes/products.routes.js";
import statesRoutes from "./routes/states.routes.js";
import rolesRoutes from "./routes/roles.routes.js";
import customersRoutes from "./routes/customers.routes.js";

const app = expres();

app.use(cors());
app.use(morgan("dev"));
app.use(urlencoded({ extended: false }));
app.use(expres.json());

//Rutas
app.use("/api", statesRoutes);
app.use("/api", rolesRoutes);
app.use("/api", customersRoutes);
app.use("/api", prodcutsRoutes);

export default app;