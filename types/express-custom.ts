import { Request, Response } from "express";
import { IncomingMessage, OutgoingMessage, ServerResponse } from "http";

export interface GraphqlContext {
  res: AuthRequest["responseObject"];
  manager: AuthRequest["manager"];
  client: AuthRequest["client"];
  tokens: {
    managerToken: string | null;
    clientToken: string | null;
  };
}
export interface SignedCookies {
  signedCookie: {
    manager?: {
      id: string | number;
      login: string;
      is_admin: boolean | null;
      iat: number;
    };
    client?: {
      id: string | number;
      login: string;
      iat: number;
    };
  };
}

export interface AuthRequest extends Request {
  manager?: {
    id: string | number;
    login: string;
    is_admin: boolean | null;
    iat: number;
  };
  client?: {
    id: string | number;
    login: string;
    iat: number;
  };
  responseObject: OutgoingMessage & {
    cookie: (
      arg0: string,
      arg1: string,
      arg2: { httpOnly: boolean; maxAge: number }
    ) => void;
  };
}
