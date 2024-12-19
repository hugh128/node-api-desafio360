import { getConnection } from "../database/connection.js";
import sql from "mssql";

// Lista todos los estados almacenados en la db
export const getStates = async (req, res) => {
  const pool = await getConnection();

  const result = await pool.request().query("SELECT * FROM Estados ORDER BY idEstados");

  res.json(result.recordset);
};

// Lista un estado almacenado en la db
export const getState = async (req, res) => {
  console.log(req.params.id);

  const pool = await getConnection();
  const result = await pool
    .request()
    .input("id", sql.Int, req.params.id)
    .query("SELECT * FROM Estados WHERE idEstados = @id")

  if (result.rowsAffected[0] === 0) {
    return res.status(404).json({ message: "State not found" });
  }

  return res.json(result.recordset[0]);
};

// Crea un estado que se almacena en la db
export const createState = async (req, res) => {
  console.log(req.body);

  const pool = await getConnection();
  const result = await pool
    .request()
    .input("nombre", sql.VarChar, req.body.name)
    .execute("p_insertarEstado")

  console.log(result);
  res.json({
    id: result.recordset[0].ID,
    name: req.body.name
  });
};

// Actualiza un estado en la db
export const updateState = async (req, res) => {

  const pool = await getConnection();
  const result = await pool
    .request()
    .input("id", sql.Int, req.params.id)
    .input("name", sql.VarChar, req.body.name)
    .query("UPDATE Estados SET nombre = @name WHERE idEstados = @id")

  console.log(result);

  if (result.rowsAffected[0] === 0) {
    return res.status(404).json({ message: "State not found" });
  }

  return res.json({ message: "State updated" })
  
};

// Elimina un estado de la db
export const deleteState = async (req, res) => {
  
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("id", sql.Int, req.params.id)
    .query("DELETE FROM Estados WHERE idEstados = @id");

  console.log(result);

  if (result.rowsAffected[0] === 0) {
    return res.status(404).json({ message: "State not found" });
  }

  return res.json({ message: "State deleted" });
};
