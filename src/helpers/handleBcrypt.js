import bcrypt from "bcryptjs";

export const encrypt = async (password) => {
  return await bcrypt.hash(password, 10);
};

export const compare = async (password, hashPassword) => {
  return await bcrypt.compare(password, hashPassword);
};
