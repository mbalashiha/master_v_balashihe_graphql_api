// sql database query
import mysql from "serverless-mysql";
import SqlString from "sqlstring";

const db: mysql.ServerlessMysql =
  process.env.MYSQL_PASS &&
  (mysql({
    config: {
      host: process.env.MYSQL_HOST,
      port: parseInt(process.env.MYSQL_PORT as any || 3306),
      database: process.env.MYSQL_DB,
      user: process.env.MYSQL_USER,
      password: process.env.MYSQL_PASS,
    },
  }) as any);
const database_env_unavailable_error = {
  error: {
    stack:
      "ServerlessMysql: function excuteQuery: No credential enviroment variables!!",
    message:
      "ServerlessMysql: function excuteQuery: No credential enviroment variables!!",
  },
};
interface QueryProps {
  query: string;
  variables?: undefined | null | Array<any> | { [key: string]: any };
}
export default async function excuteQuery({ query, variables }: QueryProps) {
  if (!db) {
    return database_env_unavailable_error;
  }
  try {
    if (typeof query !== "string" || !query) {
      throw new Error("Sql query variable must be set as string.");
    }
    variables = variables || [];
    const formattedStatement = SqlString.format(query, variables);
    const results = await db.query(formattedStatement);
    await db.end();
    return results;
  } catch (error) {
    return { error };
  }
}
