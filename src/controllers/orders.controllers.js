import { getConnection } from "../database/connection.js";
import sql from "mssql";

// Obtener ordenes
export const getOrders = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .query("SELECT * FROM Orden ORDER BY idOrden");

    res.status(200).json(result.recordset);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener ordenes", error: error.message });
  }
};

// Obtener orden
export const getOrder = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("id", sql.Int, req.params.id)
      .query("SELECT * FROM Orden WHERE idOrden = @id");

    if (result.rowsAffected[0] === 0) {
      return res.status(400).json({ message: "Orden no encontrada" });
    }

    res.status(200).json(result.recordset);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener orden", error: error.message });
  }
};

// Obtener detalle de orden
export const getOrderDetail = async (req, res) => {
  const { id } = req.params;

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("id", sql.Int, id)
      .query(
        "SELECT * FROM OrdenDetalles od JOIN Orden o ON od.orden_idOrden = o.idOrden WHERE O.idOrden = @id"
      );

    if (result.rowsAffected[0] === 0) {
      return res
        .status(404)
        .json({
          message: "No se encontraron detalles para la orden especificada",
        });
    }

    res.status(200).json({
      message: `Detalles de la orden ${id} obtenidos correctamente`,
      detalles: result.recordset,
    });
  } catch (error) {
    res.status(500).json({ message: "Error al obtener detalles de la orden" });
  }
};

// Crear orden
export const createOrder = async (req, res) => {
  const { userId, details } = req.body;

  if (!userId || !details || !Array.isArray(details)) {
    return res.status(400).json({
      message: "Datos invalidos. Verificar el userId y el detalle de la orden",
    });
  }

  try {
    const detailString = JSON.stringify(details);

    const pool = await getConnection();
    const result = await pool
      .request()
      .input("usuarios_idUsuarios", sql.Int, userId)
      .input("detalles", sql.NVarChar, detailString)
      .execute("s_insertarOrdenDetalles");

    res.status(200).json({
      message: "Orden creada correctamente",
      orden: result.recordsets[0],
      detalles: result.recordsets[1],
    });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al crear orden", error: error.message });
  }
};

// Actualizar orden
export const updateOrder = async (req, res) => {
  const { id } = req.params;
  const { details } = req.body;

  if (!details || !Array.isArray(details)) {
    return res.status(200).json({
      message: "Datos invalidos. Verificar el detalle de la orden",
    });
  }

  try {
    const detailsString = JSON.stringify(details);

    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idOrden", sql.Int, id)
      .input("detalles", sql.NVarChar, detailsString)
      .execute("s_editarOrden");

    const [orden, detalles] = result.recordsets;

    res.status(200).json({
      message: "Orden actualizada correctamente",
      orden,
      detalles,
    });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al actualizar orden", error: error.message });
  }
};

// Cambiar estado de orden
export const updateOrderState = async (req, res) => {
  const { id } = req.params;
  const { newState } = req.body;

  if (!newState) {
    return res.status(400).json({ message: "Por favor, ingresa un estdo" });
  }

  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("idOrden", sql.Int, id)
      .input("nuevoEstado", sql.VarChar, newState)
      .execute("p_cambiarEstadoOrden");

    res.status(200).json({
      message: `Estado cambiado a ${newState} correctamente`,
      data: { orderId: id, newState },
    });
  } catch (error) {
    res.status(500).json({
      message: "Error al cambiar estado de orden",
      error: error.message,
    });
  }
};
