import { getConnection } from "../database/connection.js";
import sql from "mssql";
import fs from "fs";

// Obtener productos
export const getProducts = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .query("SELECT * FROM Productos ORDER BY idProductos");

    res.status(200).json(result.recordset);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener productos", error: error.message });
  }
};

// Obtener producto
export const getProduct = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("id", sql.Int, req.params.id)
      .query("SELECT * FROM Productos WHERE idProductos = @id");

    if (result.rowsAffected[0] === 0) {
      return res.status(400).json({ message: "Producto no encontrado" });
    }

    res.status(200).json(result.recordset);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener producto", error: error.message });
  }
};

// Crear producto
export const createProduct = async (req, res) => {
  const { categoryId, userId, name, brand, code, stock, state, price, photo } =
    req.body;

  if (
    [categoryId, userId, name, brand, code, stock, state, price].some(
      (field) => !field
    )
  ) {
    return res
      .status(400)
      .json({ message: "Por favor, completa todos los campos" });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("categoriaProductos_idCategoriaProductos", sql.Int, categoryId)
      .input("usuarios_idUsuarios", sql.Int, userId)
      .input("nombre", sql.VarChar, name)
      .input("marca", sql.VarChar, brand)
      .input("codigo", sql.VarChar, code)
      .input("stock", sql.Float, stock)
      .input("estados_nombre", sql.VarChar, state)
      .input("precio", sql.Float, price)
      .input("foto", sql.Binary, photo)
      .execute("p_insertarProducto");

    res.status(200).json({
      message: "Producto creado correctamente",
      data: { id: result.recordset[0].ID, name },
    });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al crear producto", error: error.message });
  }
};

// Actualizar producto
export const updateProduct = async (req, res) => {
  const { id } = req.params;
  const { categoryId, userId, name, brand, code, stock, state, price, photo } =
    req.body;

  if (
    [categoryId, userId, name, brand, code, stock, state, price].some(
      (field) => !field
    )
  ) {
    return res
      .status(400)
      .json({ message: "Por favor, completa todos los campos" });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idProducto", sql.Int, id)
      .input("categoriaProductos_idCategoriaProductos", sql.Int, categoryId)
      .input("usuarios_idUsuarios", sql.Int, userId)
      .input("nombre", sql.VarChar, name)
      .input("marca", sql.VarChar, brand)
      .input("codigo", sql.VarChar, code)
      .input("stock", sql.Float, stock)
      .input("estados_nombre", sql.VarChar, state)
      .input("precio", sql.Float, price)
      .input("foto", sql.Binary, photo)
      .execute("p_actualizarProducto");

    res.status(200).json({
      message: "Producto actualizado correctamente",
      data: { id, name },
    });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al actualizar producto", error: error.message });
  }
};

// Cambiar estado producto
export const updateProductState = async (req, res) => {
  const { newState } = req.body;
  const { id } = req.params;

  if (!newState) {
    return res.status(400).json({ message: "Por favor, ingresa un estado" });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idProducto", sql.Int, id)
      .input("nuevoEstado", sql.VarChar, newState)
      .execute("p_actualizarEstadoProducto");

    res.status(200).json({
      message: `Estado cambiado a ${newState} correctamente`,
      data: { id, newState },
    });
  } catch (error) {
    res.status(500).json({
      message: "Error al cambiar estado del producto",
      error: error.message,
    });
  }
};
