import sql from "mssql";
import { DB_DATABASE, DB_ENCRYPT, DB_PASSWORD, DB_SEVER, DB_USER } from "../config.js";

const dbSettings = {
  user: DB_USER,
  password: DB_PASSWORD,
  server: DB_SEVER,
  database: DB_DATABASE,
  options: {
    encrypt: DB_ENCRYPT,
    trustServerCertificate: true
  },
};

export const getConnection = async () => {
  try {
    const pool = await sql.connect(dbSettings);
    return pool;
  } catch (error) {
    console.error(error);
  }
};
