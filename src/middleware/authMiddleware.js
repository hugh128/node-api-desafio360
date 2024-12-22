import { verifyToken } from "../utils/tokenUtils.js";

export const authenticateUser = async (req, res, next) => {
  const token = req.headers["authorization"];

  if (!token) {
    return res.status(401).json({ message: "No se proporciono un token" });
  }

  try {
    const cleanToken = token.startsWith("Bearer ") ? token.slice(7) : token;
    const decoded = await verifyToken(cleanToken);
    console.log(decoded);

    req.user = decoded;
    next();
  } catch (error) {
    return res.status(403).json({ message: "Token invalido o expirado" });
  }
};

export const authorizeRole = (allowedRoles) => {
  return (req, res, next) => {
    const { rol } = req.user;

    console.log(rol);

    if (!allowedRoles.includes(rol)) {
      return res
        .status(403)
        .json({ message: "Acceso denegado. Rol no autorizado" });
    }

    next();
  };
};
