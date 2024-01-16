import { createModule, gql } from "graphql-modules";
import util from "util";
import expressJwt from "express-jwt";
import jwt from "jsonwebtoken";
import { db } from "@src/sql";
import { Request, Response } from "express";
import { GraphQLResolveInfo } from "graphql";
import { isPositiveInteger } from "@src/utils/type-checkers";
import { sql } from "@schema/sql-query";
import { Console } from "console";
import { normalizePriceCurrency } from "@src/utils/currency/converter";
import { FullProductInput, ProductInput } from "@schema/types/indext";
import { AuthRequest } from "@root/types/express-custom";

export const checkIfAuthenticated = async (
  req: Request,
  res: Response,
  next: Function
) => {
  try {
    const managerToken = (req.cookies && req.cookies["manager"]) || "";
    if (!managerToken) {
      return res
        .status(401)
        .json({ success: false, error: "Manager Unauthorized" });
    }
    const manager = (req as AuthRequest).manager || null;
    if (!manager || !manager.id) {
      return res
        .status(401)
        .json({ success: false, error: "Manager Unauthorized" });
    } else {
      return next();
    }
  } catch (e: any) {
    console.error(e.stack || e.message || e);
    debugger;
  }
};
