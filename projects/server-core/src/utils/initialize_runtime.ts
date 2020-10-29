import { fetchFirebaseAdminCredentials } from "./fetch_credentials";
import { Logger } from "tslog";

export const initializeRuntime = async (): Promise<void> => {
  const logger = new Logger();
  try {
    await fetchFirebaseAdminCredentials(logger);
  } catch (err) {
    logger.error(`Clone repository failed with error: ${JSON.stringify(err)}`);
  }
};
