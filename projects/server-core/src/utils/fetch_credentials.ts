import Git from "nodegit";
import { Logger } from "tslog";
import fs from "fs";
import { targetCredDir } from "./config";

export const fetchCredentialRepository = async (
  logger: Logger
): Promise<void> => {
  logger.info("Clone repository.");
  const token = process.env["GITHUB_TOKEN"];
  if (token === undefined) {
    throw Error("GITHUB_TOKEN not found.");
  }
  const fetchOptions: Git.FetchOptions = {
    callbacks: {
      certificateCheck: function () {
        return 0;
      },
      credentials: function () {
        return Git.Cred.userpassPlaintextNew(token, "x-oauth-basic");
      },
    },
  };
  const cloneOptions: Git.CloneOptions = {
    fetchOpts: fetchOptions,
  };
  const repoUrl = "https://github.com/tianhaoz95/iwfp-credentials";
  let repo: Git.Repository;
  if (fs.existsSync(targetCredDir)) {
    logger.info(`Target repository ${targetCredDir} exist.`);
    repo = await Git.Repository.open(targetCredDir);
  } else {
    logger.info(`Target repository ${targetCredDir} not exist. Clone.`);
    repo = await Git.Clone.clone(repoUrl, targetCredDir, cloneOptions);
  }
  logger.info("Check out to master branch.");
  await repo.checkoutBranch("master");
  logger.info("Fetch all branches.");
  await repo.fetchAll(fetchOptions);
  logger.info("Done");
};
