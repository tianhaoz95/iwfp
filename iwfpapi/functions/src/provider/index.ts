import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

class Provider {
  db: FirebaseFirestore.Firestore;
  root: FirebaseFirestore.DocumentReference;
  constructor() {
    admin.initializeApp(functions.config().firebase);
    this.db = admin.firestore();
    this.root = this.db.collection("channel").doc("production-v1");
  }

  getUserRef(uid: string) {
    const ref = this.root.collection("users").doc(uid);
    return ref;
  }
}

const provider = new Provider();

export default provider;
