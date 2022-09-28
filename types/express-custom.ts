import { Request, Response } from "express";

export interface GraphqlContext {
  res: Response;
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
}
