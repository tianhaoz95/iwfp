import * as firebase from "firebase";
import clearDatabase from "./utilities/clear_database";
import "firebase/functions";
import {
  EmulatedAppConfig,
  DatabaseSettings,
  CloudFunctionEmulatorAddress
} from "./config/const";
import { BasicPromo } from "./fixture/promos";
jest.setTimeout(20000);

describe("end 2 end tests", () => {
  let app: firebase.app.App;
  let db: firebase.firestore.Firestore;
  let cloudFunctions: firebase.functions.Functions;
  let addCreditCardCallable: firebase.functions.HttpsCallable;
  let getCreditCardsCallable: firebase.functions.HttpsCallable;
  let removeCreditCardCallable: firebase.functions.HttpsCallable;
  let addPromoCallable: firebase.functions.HttpsCallable;
  let removePromoCallable: firebase.functions.HttpsCallable;

  beforeAll(() => {
    app = firebase.initializeApp(EmulatedAppConfig);
    db = app.firestore();
    db.settings(DatabaseSettings);
    cloudFunctions = firebase.functions();
    cloudFunctions.useFunctionsEmulator(CloudFunctionEmulatorAddress);
    addCreditCardCallable = cloudFunctions.httpsCallable("addCreditCard");
    getCreditCardsCallable = cloudFunctions.httpsCallable("getCreditCards");
    removeCreditCardCallable = cloudFunctions.httpsCallable("removeCreditCard");
    addPromoCallable = cloudFunctions.httpsCallable("addPromo");
    removePromoCallable = cloudFunctions.httpsCallable("removePromo");
  });

  afterAll(async () => {
    await db.terminate();
    await db.clearPersistence();
    await app.delete();
  });

  beforeEach(async () => {
    const clearStatus = await clearDatabase();
    expect(clearStatus).toEqual(200);
  });

  afterEach(async () => {
    const clearStatus = await clearDatabase();
    expect(clearStatus).toEqual(200);
  });

  test("clear data should delete all docs", async () => {
    await db
      .collection("test_clear")
      .doc("test0")
      .set({ wow: "wtf" });
    await db
      .collection("test_clear")
      .doc("test1")
      .set({ wow: "wtf" });
    await db
      .collection("test_clear")
      .doc("test2")
      .set({ wow: "wtf" });
    const testDocsResponse = await db.collection("test_clear").get();
    expect(testDocsResponse.size).toEqual(3);
    const clearStatus = await clearDatabase();
    expect(clearStatus).toEqual(200);
    const testDocsResponseAfterClear = await db.collection("test_clear").get();
    expect(testDocsResponseAfterClear.size).toEqual(0);
  });

  test("test clear data should remove cards", async () => {
    try {
      await getCreditCardsCallable();
    } catch (err) {
      expect(err.code).toBe("not-found");
    }
    await addCreditCardCallable({
      cardData: "test_card_name_0",
      cardUid: "test_card_0"
    });
    await addCreditCardCallable({
      cardData: "test_card_name_1",
      cardUid: "test_card_1"
    });
    await addCreditCardCallable({
      cardData: "test_card_name_2",
      cardUid: "test_card_2"
    });
    const cardsAfterAdding = await getCreditCardsCallable();
    expect(cardsAfterAdding.data["test_card_0"]).toBeDefined;
    expect(cardsAfterAdding.data["test_card_1"]).toBeDefined;
    expect(cardsAfterAdding.data["test_card_2"]).toBeDefined;
    const clearStatus = await clearDatabase();
    expect(clearStatus).toEqual(200);
    try {
      await getCreditCardsCallable();
    } catch (err) {
      expect(err.code).toBe("not-found");
    }
  });

  test("add card should not crash", async () => {
    const response = await addCreditCardCallable({
      cardData: "test_card_name",
      cardUid: "test_card_uid"
    });
    expect(response).toBeNull;
  });

  test("add promo should not crash", async () => {
    const addCardResponse = await addCreditCardCallable({
      cardData: "test_card_name",
      cardUid: "test_card_uid"
    });
    expect(addCardResponse).toBeNull;
    const addPromoResponse = await addPromoCallable(BasicPromo);
    expect(addPromoResponse).toBeNull;
  });

  test("add promo content should match", async () => {
    const addCardResponse = await addCreditCardCallable({
      cardData: "test_card_name",
      cardUid: "test_card_uid"
    });
    expect(addCardResponse).toBeNull;
    const addPromoResponse = await addPromoCallable(BasicPromo);
    expect(addPromoResponse).toBeNull;
    const promoSnap = await db
      .collection("channel")
      .doc("production-v1")
      .collection("users")
      .doc("test_user")
      .collection("cards")
      .doc("test_card_uid")
      .collection("promos")
      .doc("test_promo")
      .get();
    expect(promoSnap.exists).toBeTruthy;
    expect(promoSnap.data()).toMatchObject({
      "promo_category_id": "best_buy",
      "promo_category_name": "Best Buy",
      "promo_end": "06/01",
      "promo_id": "test_promo",
      "promo_name": "Test Promo",
      "promo_rate": "5",
      "promo_repeat_pattern": "annual",
      "promo_start": "03/01",
      "promo_type": "brand",
    });
  });

  test("remove promo should clear data", async () => {
    const addCardResponse = await addCreditCardCallable({
      cardData: "test_card_name",
      cardUid: "test_card_uid"
    });
    expect(addCardResponse).toBeNull;
    const addPromoResponse = await addPromoCallable(BasicPromo);
    expect(addPromoResponse).toBeNull;
    const promoSnap = await db
      .collection("channel")
      .doc("production-v1")
      .collection("users")
      .doc("test_user")
      .collection("cards")
      .doc("test_card_uid")
      .collection("promos")
      .doc("test_promo")
      .get();
    expect(promoSnap.exists).toBeTruthy;
    const removePromoResponse = await removePromoCallable({
      promoId: "test_promo",
      cardUid: "test_card_uid"
    });
    expect(removePromoResponse).toBeNull;
    const promoSnapAfterRemoval = await db
      .collection("channel")
      .doc("production-v1")
      .collection("users")
      .doc("test_user")
      .collection("cards")
      .doc("test_card_uid")
      .collection("promos")
      .doc("test_promo")
      .get();
    expect(promoSnapAfterRemoval.exists).toBeFalsy;
  });

  test("remove card should not crash", async () => {
    const addResponse = await addCreditCardCallable({
      cardData: "test_card_name",
      cardUid: "test_card_uid"
    });
    expect(addResponse).toBeNull;
    const cardSnapAfterAdd = await db
      .collection("channel")
      .doc("production-v1")
      .collection("users")
      .doc("test_user")
      .collection("cards")
      .doc("test_card_uid")
      .get();
    expect(cardSnapAfterAdd.exists).toBeTruthy;
    const removeResponse = await removeCreditCardCallable({
      cardUid: "test_card_uid"
    });
    expect(removeResponse).toBeNull;
    const cardSnapAfterRemove = await db
      .collection("channel")
      .doc("production-v1")
      .collection("users")
      .doc("test_user")
      .collection("cards")
      .doc("test_card_uid")
      .get();
    expect(cardSnapAfterRemove.exists).toBeFalsy;
  });

  test("add card backdoor validation", async () => {
    const response = await addCreditCardCallable({
      cardData: "test_card_name",
      cardUid: "test_card_uid"
    });
    expect(response).toBeNull;
    const cardSnap = await db
      .collection("channel")
      .doc("production-v1")
      .collection("users")
      .doc("test_user")
      .collection("cards")
      .doc("test_card_uid")
      .get();
    expect(cardSnap.exists).toBeTruthy;
    expect(cardSnap.id).toBe("test_card_uid");
    expect(cardSnap.data()).toMatchObject({ card_name: "test_card_name" });
  });

  test("get cards from empty wallet should fail", async () => {
    try {
      await getCreditCardsCallable();
    } catch (err) {
      expect(err.code).toBe("not-found");
    }
  });

  test("add card get cards should match", async () => {
    try {
      await getCreditCardsCallable();
    } catch (err) {
      expect(err.code).toBe("not-found");
    }
    const response = await addCreditCardCallable({
      cardData: "test_card_name",
      cardUid: "test_card_uid"
    });
    expect(response).toBeNull;
    const cardsAfterAdding = await getCreditCardsCallable();
    expect(cardsAfterAdding.data["test_card_uid"]).not.toBeNull;
    expect(cardsAfterAdding.data["test_card_uid"]["card_name"]).toBe(
      "test_card_name"
    );
  });
});
