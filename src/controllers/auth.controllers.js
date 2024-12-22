import { getConnection } from "../database/connection.js";
import sql from "mssql";
import { encrypt, compare } from "../helpers/handleBcrypt.js";

// Iniciar sesion
export const loginUser = async (req, res) => {
  const { email, password } = req.body;

  if ([email, password].some((field) => !field)) {
    res.status(400).json({ message: "Por favor, ingresa email y contraseña" });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("correoElectronico", sql.VarChar, email)
      .execute("p_obtenerUsuarioPorCorreo");

    const user = result.recordset[0];

    const isMatch = await compare(password, user.password);

    if (!isMatch) {
      return res.status(400).json({ message: "Contraseña incorrecta" });
    }

    console.log(user);
    res
      .status(200)
      .json({
        message: "Inicio de sesion exitoso",
        user: { id: user.idUsuarios, name: user.nombreCompleto },
      });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al iniciar sesion", error: error.message });
  }
};

// Registrar usuario
export const createUser = async (req, res) => {
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
    const result = await pool
      .request()
      .input("rol_nombre", sql.VarChar, rol)
      .input("estados_nombre", sql.VarChar, state)
      .input("correoElectronico", sql.VarChar, email)
      .input("nombreCompleto", sql.VarChar, fullName)
      .input("password", sql.VarChar, hashedPassword)
      .input("telefono", sql.VarChar, phone)
      .input("fechaNacimiento", sql.Date, dateOfBirth)
      .input("clientes_idClientes", sql.Int, customerId)
      .execute("p_insertarUsuario");

    res.status(200).json({
      message: "Usuario creado correctamente",
      data: { id: result.recordset[0].ID, name: fullName, rol },
    });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al crear usuario", error: error.message });
  }
};
