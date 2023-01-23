// On Windows Only...
import { spawn, SpawnOptionsWithoutStdio } from "node:child_process";
import path from "path";
import fs from "fs";
import fsa from "fs/promises";
import fse from "fs-extra";
const mysqldumpExePathes = [
  `D:\\Program Files\\MariaDB 10.10\\bin\\mysqldump.exe`,
  `C:\\Program Files\\MariaDB 10.10\\bin\\mysqldump.exe`,
];
const mysqlExePathes = [
  `D:\\Program Files\\MariaDB 10.10\\bin\\mysql.exe`,
  `C:\\Program Files\\MariaDB 10.10\\bin\\mysql.exe`,
];

const root_user_name = process.env["SUPER_SECRET_MYSQL_USER"] || "";
const root_user_password = process.env["SUPER_SECRET_MYSQL_PASS"] || "";

const path_to_dump_dir = path.resolve("mysql-full-dump");

const getFirstExistingPath = async (pathes: Array<string>): Promise<string> => {
  for (const tryPath of pathes) {
    try {
      if (await fse.pathExists(tryPath)) {
        return tryPath;
      }
    } catch (e) {}
  }
  return "";
};
const getMysqldumpExePath = () => {
  return getFirstExistingPath(mysqldumpExePathes);
};
const getMysqlExePath = () => {
  return getFirstExistingPath(mysqlExePathes);
};
export const spawnAsync = (
  command: string,
  args?: readonly string[] | undefined,
  writeStream?: fs.WriteStream
): Promise<string> =>
  new Promise((resolve, reject) => {
    let stdout: string = "",
      stderr: string = "";
    const bat = spawn(command, args);

    bat.stdout.on("data", (data) => {
      if (writeStream) {
        writeStream.write(data);
      } else {
        stdout += data.toString();
      }
    });

    bat.stderr.on("data", (data) => {
      stderr += data.toString();
    });

    bat.on("exit", (code) => {
      if (writeStream) {
        writeStream.close();
      }
      if (stderr) {
        console.error(stderr.trim());
      }
      if (stdout) {
        console.log(stdout.trim());
      }
      console.log(`---> Spawned child process exited with code ${code}`);
      if (code == 0) {
        resolve(stdout || stderr);
      } else {
        reject(stderr || stdout);
      }
    });
  });
export const spawnMysqldump = async () => {
  const dateString = new Date().toISOString().split("T")[0];
  const getCurrentDayDumpFile = (databaseName: string) =>
    path.join(
      path_to_dump_dir,
      dateString,
      `${dateString}-${databaseName}-full-dump.sql`
    );
  if (!root_user_password) {
    throw new Error("No root_user_password!");
  }
  const [mysqlExePath, mysqldumpExePath] = await Promise.all([
    getMysqlExePath(),
    getMysqldumpExePath(),
  ]);
  console.log(
    `\nmysqlExePath: "${mysqlExePath}", mysqldumpExePath: "${mysqldumpExePath}"`
  );
  const text = await spawnAsync(mysqlExePath, [
    "-u",
    root_user_name,
    "-p" + root_user_password,
    "-e",
    "SHOW DATABASES;",
  ]);
  const databaseList = text
    .split("\n")
    .map((el) => el.trim())
    .filter((el, ind) => el && ind > 0);
  console.log(databaseList);
  for (const databaseName of databaseList) {
    try {
      const currentDatabaseDumpFilepath = getCurrentDayDumpFile(databaseName);
      if (!(await fse.pathExists(currentDatabaseDumpFilepath))) {
        await fse.mkdirp(path.dirname(currentDatabaseDumpFilepath));
        const text2 = await spawnAsync(
          mysqldumpExePath,
          [
            "-u",
            root_user_name,
            "-p" + root_user_password,
            "--databases",
            databaseName,
            "--hex-blob",
            "--single-transaction",
            "--quick",
            // "--lock-tables=false",
          ],
          fs.createWriteStream(currentDatabaseDumpFilepath)
        );
      }
    } catch (e: any) {
      console.error(`Error dumping database: ${databaseName}\n\n`);
    }
  }
  console.log("mysql database dumping finished!");
};
