import { HttpBasedRequest, HttpBasedResponse } from "./interfaces";

export const processRequest = (req: HttpBasedRequest): HttpBasedResponse => {
  const response: HttpBasedResponse = HttpBasedResponse.create({});
  return response;
};
