import { getConnection } from "../database/connection.js";
import sql from "mssql";
import { encrypt } from "../utils/handleBcrypt.js";

// Obtener usuarios
export const getUsers = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .query("SELECT * FROM Usuarios ORDER BY idUsuarios");

    res.status(200).json(result.recordset);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener usuarios", error: error.message });
  }
};

// Obtener usuario
export const getUser = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("id", sql.Int, req.params.id)
      .query("SELECT * FROM Usuarios WHERE idUsuarios = @id");

    if (result.rowsAffected[0] === 0) {
      return res.status(400).json({ message: "Usuario no encontrado" });
    }

    res.status(200).json(result.recordset);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener usuario", error: error.message });
  }
};

// Actualizar usuario
export const updateUser = async (req, res) => {
  const { id } = req.params;
  const {
    rol,
    state,
    email,
    fullName,
    password,
    phone,
    dateOfBirth,
    customerId,
  } = req.body;

  if (
    [rol, state, email, fullName, password, phone, dateOfBirth].some(
      (field) => !field
    )
  ) {
    return res
      .status(400)
      .json({ message: "Por favor, completa todos los campos" });
  }

  try {
    const hashedPassword = await encrypt(password);
    const pool = await getConnection();
    const result = pool
      .request()
      .input("idUsuarios", sql.Int, id)
      .input("rol_nombre", sql.VarChar, rol)
      .input("estados_nombre", sql.VarChar, state)
      .input("correoElectronico", sql.VarChar, email)
      .input("nombreCompleto", sql.VarChar, fullName)
      .input("password", sql.VarChar, hashedPassword)
      .input("telefono", sql.VarChar, phone)
      .input("fechaNacimiento", sql.Date, dateOfBirth)
      .input("clientes_idClientes", sql.Int, customerId)
      .execute("p_actualizarUsuario");

    res.status(200).json({
      message: "Usuario actualizado correctamente",
      data: { userID: id, rol, fullName },
    });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al actualizar usuario", error: error.message });
  }
};

// Actualizar estado de usuario
export const updateUserState = async (req, res) => {
  const { id } = req.params;
  const { newState } = req.body;

  if (!newState || (newState !== "Activo" && newState !== "Inactivo")) {
    return res
      .status(400)
      .json({ message: "El estado debe ser 'Activo' o 'Inactivo'" });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idUsuarios", sql.Int, id)
      .input("nuevoEstado", sql.VarChar, newState)
      .execute("p_actualizarEstadoUsuario");

    res.status(200).json({
      message: `Estado cambiado a ${newState} correctamente`,
      data: { userId: id, newState },
    });
  } catch (error) {
    res.status(500).json({
      message: "Error al cambiar estado",
      error: error.message,
    });
  }
};
