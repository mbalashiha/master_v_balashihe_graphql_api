import { getMysqlDbWrapper } from "./execute-query";

export const db = getMysqlDbWrapper();
export default db;