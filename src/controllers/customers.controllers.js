import { getConnection } from "../database/connection.js";
import sql from "mssql";

//Listar todos los clientes
export const getCustomers = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .query("SELECT * FROM Clientes ORDER BY idClientes");

    res.status(200).json(result.recordset);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener clientes", error: error.message });
  }
};

// Obtener un cliente
export const getCustomer = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("id", sql.Int, req.params.id)
      .query("SELECT * FROM Clientes WHERE idClientes = @id");

    if (result.rowsAffected[0] === 0) {
      return res.status(400).json({ message: "Cliente no encontrado" });
    }

    res.status(200).json(result.recordset);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener cliente", error: error.message });
  }
};

// Crear un cliente
export const createCustomer = async (req, res) => {
  const { tradeName, address, phone, email } = req.body;
  let name = req.body.name;

  if ([tradeName, address, phone, email].some((field) => !field)) {
    return res
      .status(400)
      .json({ message: "Por favor, completa todos los campos" });
  }

  if (!name) name = null;

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("razonSocial", sql.VarChar, name)
      .input("nombreComercial", sql.VarChar, tradeName)
      .input("direccion", sql.VarChar, address)
      .input("telefono", sql.VarChar, phone)
      .input("email", sql.VarChar, email)
      .execute("p_insertarClientes");

    res.status(200).json({
      message: "Cliente creado correctamente",
      id: result.recordset[0].ID,
      name,
      tradeName,
      address,
      phone,
      email,
    });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al crear cliente", error: error.message });
  }
};

// Actualizar un cliente
export const updateCustomer = async (req, res) => {
  const { tradeName, address, phone, email } = req.body;
  let name = req.body.name;

  if ([tradeName, address, phone, email].some((field) => !field)) {
    return res
      .status(400)
      .json({ message: "Por favor, completa todos los campos" });
  }

  if (!name) name = null;

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idClientes", sql.Int, req.params.id)
      .input("razonSocial", sql.VarChar, name)
      .input("nombreComercial", sql.VarChar, tradeName)
      .input("direccion", sql.VarChar, address)
      .input("telefono", sql.VarChar, phone)
      .input("email", sql.VarChar, email)
      .execute("p_actualizarCliente");

    res.status(200).json({
      message: "Cliente actualizado correctamente",
      id: req.params.id,
      name,
      tradeName,
      address,
      phone,
      email,
    });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al actualizar cliente", error: error.message });
  }
};
