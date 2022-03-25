// sql database query
import { Connection, ConnectionConfig, EscapeFunctions } from "mysql";
import mysql from "serverless-mysql";
import SqlString from "sqlstring";

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
class MysqlDbWrapper {
  db: mysql.ServerlessMysql;
  constructor() {
    if (process.env.MYSQL_PASS) {
      this.db = (mysql as any)({
        config: {
          host: process.env.MYSQL_HOST,
          port: parseInt((process.env.MYSQL_PORT as any) || 3306),
          database: process.env.MYSQL_DB,
          user: process.env.MYSQL_USER,
          password: process.env.MYSQL_PASS,
        },
      }) as mysql.ServerlessMysql;
    } else {
      throw database_env_unavailable_error as any;
    }
  }
  async queryWithArray(query, ...rest) {
    const db = this.db;
    try {
      if (typeof query !== "string" || !query) {
        throw new Error("Sql query variable must be set as string.");
      }
      const formattedStatement = query.replace(
        /\$(\d+)|\$\{(\d+)\}/gim,
        (_, gr1, gr2) => {
          const tNum = parseInt(gr1 || gr2);
          if (tNum > 0) {
            const variableArray = rest[tNum - 1];
            if (Array.isArray(variableArray)) {
              return `(${variableArray.map((el) => db.escape(el)).join(", ")})`;
            } else if (typeof variableArray !== "undefined") {
              return `${db.escape(variableArray)}`;
            }
          }
          return _;
        }
      );
      const results = await db.query(formattedStatement);
      return results;
    } catch (error: any) {
      if (error.stack) {
        error.message = error.stack;
      }
      throw error;
    } finally {
      try {
        await db.end();
      } catch (e) {}
    }
  }
  async excuteQuery({ query, variables }: QueryProps) {
    const db = this.db;
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
      return results;
    } catch (error: any) {
      if (error.stack) {
        error.message = error.stack;
      }
      throw error;
    } finally {
      try {
        await db.end();
      } catch (e) {}
    }
  }
  connect(wait?: number): Promise<void> {
    return this.db.connect(wait);
  }
  config(config?: ConnectionConfig): ConnectionConfig {
    return this.db.config(config);
  }
  query<T>(...args): Promise<T> {
    return this.db.query(...args) as any as Promise<T>;
  }
  end(): Promise<void> {
    return this.db.end();
  }
  escape(str: string): EscapeFunctions {
    return this.db.escape(str);
  }
  quit(): void {
    return this.db.quit();
  }
  transaction(): mysql.Transaction {
    return this.db.transaction();
  }
  getCounter(): number {
    return this.db.getCounter();
  }
  getClient(): Connection {
    return this.db.getClient();
  }
  getConfig(): ConnectionConfig {
    return this.db.getConfig();
  }
  getErrorCount(): number {
    return this.db.getErrorCount();
  }
}
const db = new MysqlDbWrapper();
export default db;
