// On Windows Only...
import { spawn, SpawnOptionsWithoutStdio } from "node:child_process";
import path from "path";
import fs from "fs";
import fsa from "fs/promises";
import fse from "fs-extra";
const mysqldumpExePathes = [
  "/usr/bin/mysqldump",
  `C:\\Program Files\\MariaDB 10.10\\bin\\mysqldump.exe`,
  `D:\\Program Files\\MariaDB 10.10\\bin\\mysqldump.exe`,
];
const mysqlExePathes = [
  "/usr/bin/mysql",
  `C:\\Program Files\\MariaDB 10.10\\bin\\mysql.exe`,
  `D:\\Program Files\\MariaDB 10.10\\bin\\mysql.exe`,
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
    } catch (e) { }
  }
  throw new Error('No one file path exists from array: ' + JSON.stringify(pathes, null, 2));
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
    if (writeStream) {
      bat.stdout.pipe(writeStream);
    } else {
      bat.stdout.on("data", (data) => {
        stdout += data.toString();
      });
    }
    bat.stderr.on("data", (data) => {
      stderr += data.toString();
    });

    bat.on("exit", (code) => {
      // if (writeStream) {
      //   writeStream.close();
      // }
      if (stderr) {
        console.error(stderr.trim());
      }
      if (stdout) {
        console.log(stdout.trim());
      }
      if (code == 0) {
        resolve(stdout || stderr);
      } else {
        console.error(`---> Spawned child process exited with code ${code}`);
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
        console.log(
          `---> ${databaseName}. processing database: ${databaseName}`
        );
        await fse.mkdirp(path.dirname(currentDatabaseDumpFilepath));
        await spawnAsync(
          mysqldumpExePath,
          [
            "-u",
            root_user_name,
            "-p" + root_user_password,
            "--databases",
            databaseName,
            "--hex-blob",
            // "--add-drop-trigger",
            "--routines",
            "--triggers",
            "--single-transaction",
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
