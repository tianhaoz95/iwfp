// Next.js API route support:
// https://nextjs.org/docs/api-routes/introduction
import { NowRequest, NowResponse } from "@vercel/node";
import { processRequest } from "iwfp-server-core";
import { HttpBasedRequest, HttpBasedResponse } from "./interfaces";
import winston from "winston";

export const allowCors = (
    fn: (request: NowRequest, response: NowResponse) => Promise<void>
) => async (req: NowRequest, res: NowResponse) => {
    res.setHeader('Access-Control-Allow-Credentials', 'true')
    res.setHeader('Access-Control-Allow-Origin', '*')
    res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS,PATCH,DELETE,POST,PUT')
    res.setHeader(
        'Access-Control-Allow-Headers',
        'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version'
    )
    return await fn(req, res);
};

export const handler = async (
    request: NowRequest,
    response: NowResponse
): Promise<void> => {
    const logger = winston.createLogger({
        transports: [
            new winston.transports.Console(),
        ]
    });
    const buffer: Buffer = Buffer.from(request.body['proto']);
    logger.info(`Request received: ${buffer.toString('binary')}`);
    try {
        logger.info('Parse HttpBasedRequest from the buffer.');
        const req: HttpBasedRequest = HttpBasedRequest.decode(buffer);
        logger.info(`HttpBasedRequest created: ${JSON.stringify(req.toJSON())}`);
        const res: HttpBasedResponse = await processRequest(req, (msg: string, type: "info" | "error") => {
            if (type === "info") {
                logger.info(msg);
            } else if (type === "error") {
                logger.error(msg);
            } else {
                throw Error("Logging type unknown.")
            }
        });
        logger.info(`HttpBasedRequest processed and returned HttpBasedResponse: ${JSON.stringify(res)}`);
        response.statusCode = 200;
        response.json(res.toJSON());
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
            }
        });
        response.json(res.toJSON());
    }
};