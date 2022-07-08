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
  public readonly db: mysql.ServerlessMysql;
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
  public format(
    query: string,
    variables: Array<any> | { [key: string | number]: any }
  ): string {
    if (typeof query !== "string" || !query) {
      throw new Error("Sql query variable must be set as string.");
    }
    const localReplacer = (_, mainGroup) => {
      const tryNumberGroup =
        (/^\d+$/im.test(mainGroup) && parseInt(mainGroup)) || undefined;
      const queryKey = tryNumberGroup ? tryNumberGroup - 1 : mainGroup;
      const oneVariable =
        typeof variables[queryKey] !== "undefined"
          ? variables[queryKey]
          : typeof variables[mainGroup] !== "undefined"
          ? variables[mainGroup]
          : undefined;
      if (Array.isArray(oneVariable) && oneVariable.length) {
        const variableArray = oneVariable;
        return `(${variableArray.map((el) => db.escape(el)).join(", ")})`;
      } else if (Array.isArray(oneVariable) && !oneVariable.length) {
        return `(${db.escape(null as any)})`;
      } else if (typeof oneVariable !== "undefined") {
        return `${db.escape(oneVariable)}`;
      }
      return _;
    };
    query = query.replace(
      /\$([A-Za-zА-Яа-я_\-\d]+)|\$\[([A-Za-zА-Яа-я_\-\d]+)\]/gim,
      (_, gr1, gr2) => {
        if (gr1) {
          return localReplacer(_, gr1);
        } else if (gr2) {
          return localReplacer(_, gr2);
        } else {
          return _;
        }
      }
    );
    return SqlString.format(query, variables);
  }
  async queryWithArray<T = Array<any>>(
    query: string,
    variables: Array<any> | { [key: string]: any }
  ): Promise<T> {
    const db = this.db;
    try {
      const results = await db.query(this.format(query, variables));
      return this.rowsPostProcessing<T>(results);
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
  async excuteQuery<T = Array<any>>({
    query,
    variables,
  }: QueryProps): Promise<T> {
    const db = this.db;
    if (!db) {
      throw database_env_unavailable_error;
    }
    try {
      if (typeof query !== "string" || !query) {
        throw new Error("Sql query variable must be set as string.");
      }
      variables = typeof variables !== "undefined" ? variables : [];
      let normalizedVariables: Array<any> | { [key: string]: any };
      if (
        variables === null ||
        (!Array.isArray(variables) && typeof variables !== "object")
      ) {
        normalizedVariables = [variables];
      } else {
        normalizedVariables = variables;
      }
      const myPreformattedQuery: string = this.format(
        query,
        normalizedVariables
      );
      const results = await db.query<T>(myPreformattedQuery);
      return this.rowsPostProcessing<T>(results);
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
  public rowsPostProcessing<T>(rows: any): T {
    if (!Array.isArray(rows)) {
      rows = [rows];
    }
    for (const row of rows) {
      for (const [key, value] of Object.entries(row)) {
        if (typeof value === "string" && /^[\[\{]{1}\"/.test(value)) {
          try {
            row[key] = JSON.parse(value);
          } catch (e) {}
        }
      }
    }
    return rows;
  }
  connect(wait?: number): Promise<void> {
    return this.db.connect(wait);
  }
  config(config?: ConnectionConfig): ConnectionConfig {
    return this.db.config(config);
  }
  query<T = Array<any>>(...args): Promise<T> {
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
