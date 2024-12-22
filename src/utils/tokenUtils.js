import jwt from "jsonwebtoken";

export const generateToken = async (userId, rol) => {
  const payload = { id: userId, rol };
  const secret = process.env.JWT_SECRET;
  const options = { expiresIn: '24h' };

  return jwt.sign(payload, secret, options);
};

export const verifyToken = async (token) => {
  return jwt.verify(token, process.env.JWT_SECRET);
};

export const decodeToken = (token) => {
  return jwt.decode(token, null);
};
