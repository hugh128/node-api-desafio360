import app from "./app.js";
import { DB_PORT } from "./config.js";

app.listen(DB_PORT);
console.log("Servidor corriendo en el puerto", DB_PORT);
