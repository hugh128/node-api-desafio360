export const getProducts = (req, res) => {
  res.send("Obteniendo productos");
};

export const getProduct = (req, res) => {
  res.send("Obteniendo un solo producto");
};

export const createProduct = (req, res) => {
  res.send("Creando un producto");
};

export const updateProduct = (req, res) => {
  res.send("Actualizando un producto");
};

export const deleteProduct = (req, res) => {
  res.send("Eliminando un producto");
};