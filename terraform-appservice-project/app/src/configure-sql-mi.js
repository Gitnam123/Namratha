const sql = require("mssql");
const { DefaultAzureCredential } = require("@azure/identity");

async function main() {
  const server = process.env.SQL_SERVER;
  const database = process.env.SQL_DATABASE;
  const managedIdentityObjectId = process.env.APP_SERVICE_PRINCIPAL_ID;
  const managedIdentityName = process.env.APP_SERVICE_IDENTITY_NAME;

  if (!server || !database || !managedIdentityObjectId || !managedIdentityName) {
    throw new Error(
      "SQL_SERVER, SQL_DATABASE, APP_SERVICE_PRINCIPAL_ID and APP_SERVICE_IDENTITY_NAME are required"
    );
  }

  const credential = new DefaultAzureCredential();

  const tokenResponse = await credential.getToken(
    "https://database.windows.net/.default"
  );

  const config = {
    server,
    database,
    options: {
      encrypt: true,
      trustServerCertificate: false
    },
    authentication: {
      type: "azure-active-directory-access-token",
      options: {
        token: tokenResponse.token
      }
    }
  };

  const pool = await sql.connect(config);

  console.log(`Connected to ${server}/${database}`);

  const request = pool.request();

  const escapedName = managedIdentityName.replace(/]/g, "]]");

  await request.query(`
    IF NOT EXISTS (
      SELECT 1
      FROM sys.database_principals
      WHERE name = N'${managedIdentityObjectId}'
    )
    BEGIN
      CREATE USER [${escapedName}] FROM EXTERNAL PROVIDER;
      PRINT 'Managed Identity database user created';
    END
    ELSE
    BEGIN
      PRINT 'Managed Identity database user already exists';
    END
  `);

  await request.query(`
    ALTER ROLE db_datareader ADD MEMBER [${escapedName}];
  `);

  await request.query(`
    ALTER ROLE db_datawriter ADD MEMBER [${escapedName}];
  `);

  console.log("Managed Identity granted db_datareader and db_datawriter.");

  await pool.close();
}

main().catch((error) => {
  console.error("SQL Managed Identity configuration failed:");
  console.error(error);
  process.exit(1);
});