export const getStates = (req, res) => {
  res.send("Obteniendo estados");
};

export const getState = (req, res) => {
  res.send("Obteniendo un estado");
};

export const createState = (req, res) => {
  res.send("Agregando un estado");
};

export const updateState = (req, res) => {
  res.send("Actualizando un estado");
};

export const deleteState = (req, res) => {
  res.send("Eliminado un estado");
};
