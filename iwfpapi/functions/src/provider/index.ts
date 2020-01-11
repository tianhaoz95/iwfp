import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import { TestUserUid } from "../config/consts";
import { AttemptDeleteNonTestUserError } from "../config/errors";
import { FunctionContext } from "../config/typedefs";

class Provider {
  db: FirebaseFirestore.Firestore;
  auth: admin.auth.Auth;
  root: FirebaseFirestore.DocumentReference;
  constructor() {
    if (process.env.FUNCTIONS_EMULATOR) {
      const firebaseConfig = {
        projectId: "iwfpapp"
      };
      admin.initializeApp(firebaseConfig);
    } else {
      admin.initializeApp(functions.config().firebase);
    }
    this.db = admin.firestore();
    if (process.env.FUNCTIONS_EMULATOR) {
      this.db.settings({
        ssl: false,
        host: "localhost:8080",
        servicePath: undefined
      });
    }
    this.root = this.db.collection("channel").doc("production-v1");
    this.auth = admin.auth();
  }

  getUserRef(uid: string) {
    const ref = this.root.collection("users").doc(uid);
    return ref;
  }

  async removeUser(uid: string) {
    if (process.env.FUNCTIONS_EMULATOR) {
      if (uid === TestUserUid) {
        return;
      } else {
        throw AttemptDeleteNonTestUserError;
      }
    } else {
      await this.auth.deleteUser(uid);
    }
  }

  async token2auth(token: string): Promise<FunctionContext> {
    const context: FunctionContext = {
      authenticated: false,
      uid: "na",
    };
    try {
      const verifyResult = await this.auth.verifyIdToken(token);
      context.authenticated = true;
      context.uid = verifyResult.uid;
    } catch (err) {
      console.log(err);
      context.authenticated = false;
      context.uid = 'na';
    }
    return context;
  }
}

export default Provider;
