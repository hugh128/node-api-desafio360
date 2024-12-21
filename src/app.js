import expres, { urlencoded } from "express";
import cors from "cors";
import morgan from "morgan";
import statesRoutes from "./routes/states.routes.js";
import rolesRoutes from "./routes/roles.routes.js";
import customersRoutes from "./routes/customers.routes.js";
import usersRoutes from "./routes/users.routes.js";
import categoryRoutes from "./routes/categories.routes.js";
import productsRoutes from "./routes/products.routes.js";
import ordersRoutes from "./routes/orders.routes.js";

const app = expres();

app.use(cors());
app.use(morgan("dev"));
app.use(urlencoded({ extended: false }));
app.use(expres.json());

//Rutas version 1
app.use("/api/v1", statesRoutes);
app.use("/api/v1", rolesRoutes);
app.use("/api/v1", customersRoutes);
app.use("/api/v1", usersRoutes);
app.use("/api/v1", categoryRoutes);
app.use("/api/v1", productsRoutes);
app.use("/api/v1", ordersRoutes);

export default app;