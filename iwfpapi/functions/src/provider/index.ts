import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

class Provider {
  db: FirebaseFirestore.Firestore;
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
  }

  getUserRef(uid: string) {
    const ref = this.root.collection("users").doc(uid);
    return ref;
  }
}

export default Provider;
