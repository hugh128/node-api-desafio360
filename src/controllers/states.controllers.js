import { getConnection } from "../database/connection.js";
import sql from "mssql";

// Lista todos los estados almacenados en la db
export const getStates = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .query("SELECT * FROM Estados ORDER BY idEstados");
    res.status(200).json(result.recordset);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener estados", error: error.message });
  }
};

// Lista un estado almacenado en la db
export const getState = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("id", sql.Int, req.params.id)
      .query("SELECT * FROM Estados WHERE idEstados = @id");

    if (result.rowsAffected[0] === 0) {
      return res.status(404).json({ message: "Estado no encontrado" });
    }
    res.status(200).json(result.recordset[0]);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener estado", error: error.message });
  }
};

// Crea un estado que se almacena en la db
export const createState = async (req, res) => {
  const { name } = req.body;

  if (!name || name == null) {
    return res
      .status(400)
      .json({ message: "Por favor, completa todos los campos" });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("nombre", sql.VarChar, req.body.name)
      .execute("p_insertarEstado");

    console.log(result);
    res.status(201).json({
      message: "Estado agregado correctamente",
      id: result.recordset[0].ID,
    });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al insertar estado", error: error.message });
  }
};

// Actualiza un estado en la db
export const updateState = async (req, res) => {
  const { name } = req.body;

  if (!name || name == null) {
    return res
      .status(400)
      .json({ message: "Por favor, completa todos los campos" });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idEstado", sql.Int, req.params.id)
      .input("nombre", sql.VarChar, name)
      .execute("p_actualizarEstado");

    res
      .status(201)
      .json({ message: "Estado agregado correctamente", name: name });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al insertar el estado", error: error.message });
  }
};
