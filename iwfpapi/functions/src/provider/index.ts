import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import { TestUserUid } from "../config/consts";
import { AttemptDeleteNonTestUserError } from "../config/errors";

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
}

export default Provider;
