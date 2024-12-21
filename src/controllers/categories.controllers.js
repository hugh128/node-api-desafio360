import { getConnection } from "../database/connection.js";
import sql from "mssql";

// Obtener categorias
export const getCategories = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .query("SELECT * FROM CategoriaProductos ORDER BY idCategoriaProductos");

    res.status(200).json(result.recordset);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener categorias", error: error.message });
  }
};

// Obtener una categoria
export const getCategory = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("id", sql.Int, req.params.id)
      .query(
        "SELECT * FROM CategoriaProductos WHERE idCategoriaProductos = @id"
      );

    if (result.rowsAffected[0] === 0) {
      return res.status(400).json({ message: "Categoria no encontrada" });
    }

    res.status(200).json(result.recordset);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener categoria", error: error.message });
  }
};

// Crear una categoria
export const createCategory = async (req, res) => {
  const { userId, name, state } = req.body;

  if ([userId, name, state].some((field) => !field)) {
    return res
      .status(400)
      .json({ message: "Por favor, completa todos los campos" });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("usuarios_idUsuarios", sql.Int, userId)
      .input("nombre", sql.VarChar, name)
      .input("estados_nombre", sql.VarChar, state)
      .execute("p_insertarCategoriaProductos");

    res.status(200).json({
      message: "Categoria creada correctamente",
      data: { id: result.recordset[0].ID, name },
    });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al crear categoria", error: error.message });
  }
};

// Actualizar categoria
export const updateCategory = async (req, res) => {
  const { name, state } = req.body;
  const { id } = req.params;

  if ([name, state].some((field) => !field)) {
    return res
      .status(400)
      .json({ message: "Por favor, completa todos los campos" });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idCategoriaProductos", sql.Int, id)
      .input("nuevoNombre", sql.VarChar, name)
      .input("nuevoEstado", sql.VarChar, state)
      .execute("p_actualizarCategoriaProductos");

    res
      .status(200)
      .json({
        message: "Categoria actualizada correctamente",
        data: { id, name },
      });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al actulizar categoria", error: error.message });
  }
};

// Actualizar estado de categoria
export const updateCategoryState = async (req, res) => {
  const { newState } = req.body;
  const { id } = req.params;

  if (!newState) {
    return res.status(400).json({ message: "Por favor, ingresa un estado" });
  }

  try {
    const pool = await getConnection();
    const resul = await pool
      .request()
      .input("idCategoriaProductos", sql.Int, id)
      .input("nuevoEstado", sql.VarChar, newState)
      .execute("p_actualizarEstadoCategoriaProductos");

    res.status(200).json({
      message: `Estado cambiado a ${newState} correctamente`,
      data: { id, newState },
    });
  } catch (error) {
    res.status(500).json({
      message: "Error al cambiar estado de categoria",
      error: error.message,
    });
  }
};
