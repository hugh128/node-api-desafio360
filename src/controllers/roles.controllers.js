import { getConnection } from "../database/connection.js";
import sql from "mssql";

//Listar todos los roles
export const getRoles = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .query("SELECT * FROM Rol ORDER BY idRol");
    res.status(200).json(result.recordset);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener roles", error: error.message });
  }
};

//Obtener un rol
export const getRol = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("id", sql.Int, req.params.id)
      .query("SELECT * FROM Rol WHERE idRol = @id");

    if (result.rowsAffected[0] === 0) {
      return res.status(404).json({ message: "Rol no encontrado" });
    }

    res.status(200).json(result.recordset[0]);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener rol", error: error.message });
  }
};

//Crear un rol
export const createRol = async (req, res) => {
  const { name } = req.body;

  if (!name || name === null) {
    return res
      .status(400)
      .json({ message: "Por favor, completa todos los campos" });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("nombre", sql.VarChar, name)
      .execute("p_insertarRol");

    res.status(200).json({
      message: "Rol agregado correctamente",
      id: result.recordset[0].ID,
      name,
    });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al agregar estado", error: error.message });
  }
};

//Actalizar un rol
export const updateRol = async (req, res) => {
  const { name } = req.body;

  if (!name || name === null) {
    return res
      .status(400)
      .json({ message: "Por favor, completa todos los campos" });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idRol", sql.Int, req.params.id)
      .input("nombre", sql.VarChar, name)
      .execute("p_actualizarRol");

    res.status(200).json({
      message: "Rol actualizad correctamente",
      id: req.params.id,
      name,
    });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al actualizar rol", error: error.message });
  }
};
