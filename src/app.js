import expres from 'express';
import prodcutsRoutes from './routes/products.routes.js';
import statesRoutes from './routes/states.routes.js';

const app = expres();

app.use(expres.json());

app.use(statesRoutes);
app.use(prodcutsRoutes);

export default app;