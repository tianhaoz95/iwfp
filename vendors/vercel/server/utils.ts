// Next.js API route support:
// https://nextjs.org/docs/api-routes/introduction
import { NowRequest, NowResponse } from "@vercel/node";
import { RequestProcessor } from "iwfp-server-core";
import {
  HttpBasedRequest,
  HttpBasedResponse,
  HttpBasedVersionInfo,
} from "./interfaces";
import winston from "winston";

const logger = winston.createLogger({
  transports: [new winston.transports.Console()],
});

const versionInfo: HttpBasedVersionInfo = HttpBasedVersionInfo.create({
  serviceType: HttpBasedVersionInfo.ServiceType.FIREBASE,
});

const requestProcessor: RequestProcessor = new RequestProcessor(
  (msg: string, type: "info" | "error") => {
    if (type === "info") {
      logger.info(msg);
    } else if (type === "error") {
      logger.error(msg);
    } else {
      throw Error("Logging type unknown.");
    }
  },
  versionInfo
);

export const allowCors = (
  fn: (request: NowRequest, response: NowResponse) => Promise<void>
) => async (req: NowRequest, res: NowResponse) => {
  res.setHeader("Access-Control-Allow-Credentials", "true");
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader(
    "Access-Control-Allow-Methods",
    "GET,OPTIONS,PATCH,DELETE,POST,PUT"
  );
  res.setHeader(
    "Access-Control-Allow-Headers",
    "X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version"
  );
  return await fn(req, res);
};

export const handler = async (
  request: NowRequest,
  response: NowResponse
): Promise<void> => {
  const buffer: Buffer = Buffer.from(
    JSON.parse(request.body["proto"]) as number[]
  );
  logger.info(`Request received: ${buffer.toString("binary")}`);
  try {
    logger.info("Parse HttpBasedRequest from the buffer.");
    const req: HttpBasedRequest = HttpBasedRequest.decode(buffer);
    logger.info(`HttpBasedRequest created: ${JSON.stringify(req.toJSON())}`);
    const res: HttpBasedResponse = await requestProcessor.process(req);
    logger.info(
      `HttpBasedRequest processed and returned HttpBasedResponse: ${JSON.stringify(
        res
      )}`
    );
    response.statusCode = 200;
    const resBuffer = Array.from(HttpBasedResponse.encode(res).finish());
    response.json({ proto: resBuffer });
  } catch (err) {
    response.statusCode = 500;
    logger.info(`Unknown error: ${JSON.stringify(err)}`);
    const res: HttpBasedResponse = HttpBasedResponse.create({
      status: HttpBasedResponse.Status.UNKNOWN,
      statusCode: 500,
      error: {
        title: "Unknown Error",
        detail: JSON.stringify(err),
      },
      genericResponse: {
        msg: "N/A",
      },
    });
    response.json(res.toJSON());
  }
};
