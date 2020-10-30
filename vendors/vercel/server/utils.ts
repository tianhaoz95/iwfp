// Next.js API route support:
// https://nextjs.org/docs/api-routes/introduction
import { NowRequest, NowResponse } from "@vercel/node";
import { processRequest } from "iwfp-server-core";
import { HttpBasedRequest, HttpBasedResponse } from "./interfaces";

export const allowCors = (
    fn: (request: NowRequest, response: NowResponse) => Promise<void>
) => async (req: NowRequest, res: NowResponse) => {
    res.setHeader("Access-Control-Allow-Credentials", "true");
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Access-Control-Allow-Methods", "GET,DELETE,POST,PUT");
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
    try {
        const req: HttpBasedRequest = HttpBasedRequest.create({});
        const res: HttpBasedResponse = await processRequest(req);
        response.statusCode = 200;
        response.json(res.toJSON());
    } catch (err) {
        response.statusCode = 500;
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