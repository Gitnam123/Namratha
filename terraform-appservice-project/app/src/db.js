const sql = require("mssql");
const { DefaultAzureCredential } = require("@azure/identity");

const credential = new DefaultAzureCredential();

let pool;

async function getPool() {
  if (pool) {
    return pool;
  }

  const token = await credential.getToken(
    "https://database.windows.net/.default"
  );

  pool = await sql.connect({
    server: process.env.SQL_SERVER,
    database: process.env.SQL_DATABASE,
    options: {
      encrypt: true
    },
    authentication: {
      type: "azure-active-directory-access-token",
      options: {
        token: token.token
      }
    }
  });

  return pool;
}

module.exports = {
  sql,
  getPool
};