// sql database query
import {
  Connection,
  ConnectionConfig,
  EscapeFunctions,
  default as originalMysqlPackage,
} from "mysql";
import mysql from "serverless-mysql";

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
  variables?: (string | number | null)[] | { [key: string]: any };
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
  public escapeId(
    value: string,
    forbidQualified?: boolean | undefined
  ): string {
    return originalMysqlPackage.escapeId(value, forbidQualified);
  }
  public escapeValue(
    value: any,
    stringifyObjects?: boolean | undefined,
    timeZone?: string | undefined
  ): string {
    return originalMysqlPackage.escape(value, stringifyObjects, timeZone);
  }
  public valueEscape(
    value: any,
    stringifyObjects?: boolean | undefined,
    timeZone?: string | undefined
  ): string {
    return originalMysqlPackage.escape(value, stringifyObjects, timeZone);
  }
  public format(
    query: string,
    variables: Array<any> | { [key: string | number]: any }
  ): string {
    const self = this;
    if (typeof query !== "string" || !query) {
      throw new Error("Sql query variable must be set as string.");
    }
    if (!variables) {
      return query;
    }
    const chooseEscape = (oneVariable: any, matchedString: string) => {
      if (typeof oneVariable === "undefined") {
        return matchedString;
      } else if (Array.isArray(oneVariable) && oneVariable.length) {
        const variableArray = oneVariable;
        return `(${variableArray
          .map((el) => self.valueEscape(el))
          .join(", ")})`;
      } else if (Array.isArray(oneVariable) && !oneVariable.length) {
        return `(${self.valueEscape(null as any)})`;
      } else {
        return `${self.valueEscape(oneVariable)}`;
      }
    };
    if (typeof variables[0] !== "undefined") {
      let positionVar = 0;
      query = query.replace(/\?+/gim, (matched) => {
        const oneVariable = variables[positionVar];
        if (typeof oneVariable === "undefined") {
          return matched;
        }
        if (matched === "??") {
          positionVar++;
          return self.escapeId(
            typeof oneVariable === "string"
              ? oneVariable
              : oneVariable.toString()
          );
        } else if (matched === "?") {
          positionVar++;
          return chooseEscape(oneVariable, matched);
        } else {
          return matched;
        }
      });
    }
    const localReplacer = (matchedString: string, mainGroup: string) => {
      const tryNumberGroup =
        (/^\d+$/im.test(mainGroup.toString()) &&
          parseInt(mainGroup.toString())) ||
        undefined;
      const queryKey: any = tryNumberGroup ? tryNumberGroup - 1 : mainGroup;
      const oneVariable =
        typeof variables[queryKey] !== "undefined"
          ? variables[queryKey]
          : typeof variables[mainGroup as any] !== "undefined"
          ? variables[mainGroup as any]
          : undefined;
      return chooseEscape(oneVariable, matchedString);
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
    return query;
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
      // console.l//og("myPreformattedQuery:", myPreformattedQuery);
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
  query<T = Array<any>>(
    query: QueryProps["query"],
    variables?: QueryProps["variables"]
  ): Promise<T> {
    return this.excuteQuery<T>({
      query,
      variables,
    });
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
