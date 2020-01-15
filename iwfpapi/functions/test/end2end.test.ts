import * as firebase from "firebase";
import clearDatabase from "./utilities/clear_database";
import "firebase/functions";
import axios, { AxiosResponse } from "axios";
import {
  EmulatedAppConfig,
  DatabaseSettings,
  CloudFunctionEmulatorAddress,
  HttpAddCreditCardEndpoint,
  HttpRemoveCreditCardEndpoint,
  HttpEditCreditCardEndpoint,
  HttpAddPromoEndpoint,
  HttpRemoveUserEndpoint,
  HttpRemovePromoEndpoint,
  HttpGetCreditCardsEndpoint
} from "./config/const";
import {
  BasicPromo,
  BasicPromoInDatabase,
  HttpSimpleAddPromoRequest
} from "./fixture/promos";
import { backdoorCardExist } from "./utilities/validators/card_existence";
import { backdoorPromoExist } from "./utilities/validators/promo_existence";
import { backdoorGetPromo } from "./utilities/getters/promo";
import { backdoorGetCardData } from "./utilities/getters/card";
import { backdoorUserExist } from "./utilities/validators/user_existence";
jest.setTimeout(20000);

describe("end 2 end tests", () => {
  let app: firebase.app.App;
  let db: firebase.firestore.Firestore;
  let cloudFunctions: firebase.functions.Functions;
  let addCreditCardCallable: firebase.functions.HttpsCallable;
  let getCreditCardsCallable: firebase.functions.HttpsCallable;
  let editCreditCardsCallable: firebase.functions.HttpsCallable;
  let removeCreditCardCallable: firebase.functions.HttpsCallable;
  let addPromoCallable: firebase.functions.HttpsCallable;
  let removePromoCallable: firebase.functions.HttpsCallable;
  let removeUserCallable: firebase.functions.HttpsCallable;

  beforeAll(() => {
    app = firebase.initializeApp(EmulatedAppConfig);
    db = app.firestore();
    db.settings(DatabaseSettings);
    cloudFunctions = firebase.functions();
    cloudFunctions.useFunctionsEmulator(CloudFunctionEmulatorAddress);
    addCreditCardCallable = cloudFunctions.httpsCallable("addCreditCard");
    getCreditCardsCallable = cloudFunctions.httpsCallable("getCreditCards");
    editCreditCardsCallable = cloudFunctions.httpsCallable("editCreditCard");
    removeCreditCardCallable = cloudFunctions.httpsCallable("removeCreditCard");
    addPromoCallable = cloudFunctions.httpsCallable("addPromo");
    removePromoCallable = cloudFunctions.httpsCallable("removePromo");
    removeUserCallable = cloudFunctions.httpsCallable("removeUser");
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
      name: "test_card_name_0",
      id: "test_card_0"
    });
    await addCreditCardCallable({
      name: "test_card_name_1",
      id: "test_card_1"
    });
    await addCreditCardCallable({
      name: "test_card_name_2",
      id: "test_card_2"
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

  test("http edit card should work", async () => {
    const addResponse = await addCreditCardCallable({
      name: "test_card_name",
      id: "test_card_id"
    });
    expect(addResponse).toBeNull;
    const cardAfterAdding = await backdoorGetCardData(
      db,
      "test_user",
      "test_card_id"
    );
    expect(cardAfterAdding).toBeDefined;
    expect(cardAfterAdding).toMatchObject({
      card_name: "test_card_name"
    });
    const httpEditResponse = await axios.post(HttpEditCreditCardEndpoint, {
      token: "test_token",
      cardUid: "test_card_id",
      cardData: "edited_test_card_name"
    });
    expect(httpEditResponse.status).toEqual(200);
    const cardAfterEditing = await backdoorGetCardData(
      db,
      "test_user",
      "test_card_id"
    );
    expect(cardAfterEditing).toBeDefined;
    expect(cardAfterEditing).toMatchObject({
      card_name: "edited_test_card_name"
    });
  });

  test("edit card should work", async () => {
    const addResponse = await addCreditCardCallable({
      name: "test_card_name",
      id: "test_card_id"
    });
    expect(addResponse).toBeNull;
    const cardAfterAdding = await backdoorGetCardData(
      db,
      "test_user",
      "test_card_id"
    );
    expect(cardAfterAdding).toBeDefined;
    expect(cardAfterAdding).toMatchObject({
      card_name: "test_card_name"
    });
    const editResponse = await editCreditCardsCallable({
      cardUid: "test_card_id",
      cardData: "edited_test_card_name"
    });
    expect(editResponse).toBeNull;
    const cardAfterEditing = await backdoorGetCardData(
      db,
      "test_user",
      "test_card_id"
    );
    expect(cardAfterEditing).toBeDefined;
    expect(cardAfterEditing).toMatchObject({
      card_name: "edited_test_card_name"
    });
  });

  test("add card should succeed", async () => {
    const response = await addCreditCardCallable({
      name: "test_card_name",
      id: "test_card_uid"
    });
    expect(response).toBeNull;
    const cardExist = await backdoorCardExist(db, "test_user", "test_card_uid");
    expect(cardExist).toBeTruthy;
  });

  test("http add card should succeed", async () => {
    const res: AxiosResponse = await axios.post(HttpAddCreditCardEndpoint, {
      token: "test_token",
      name: "test_card_name",
      id: "test_card_uid"
    });
    expect(res.status).toEqual(200);
    const cardExist = await backdoorCardExist(db, "test_user", "test_card_uid");
    expect(cardExist).toBeTruthy;
  });

  test("add promo should not crash", async () => {
    const addCardResponse = await addCreditCardCallable({
      name: "test_card_name",
      id: "test_card_uid"
    });
    expect(addCardResponse).toBeNull;
    const addPromoResponse = await addPromoCallable(BasicPromo);
    expect(addPromoResponse).toBeNull;
  });

  test("http add promo should work", async () => {
    const addCardResponse = await addCreditCardCallable({
      name: "test_card_name",
      id: "test_card_uid"
    });
    expect(addCardResponse).toBeNull;
    const httpAddPromoResponse = await axios.post(
      HttpAddPromoEndpoint,
      HttpSimpleAddPromoRequest
    );
    expect(httpAddPromoResponse.status).toEqual(200);
    const promoAfterAdding = await backdoorGetPromo(
      db,
      "test_user",
      "test_card_uid",
      "test_promo"
    );
    expect(promoAfterAdding).toBeDefined;
    expect(promoAfterAdding).not.toBeNull;
    expect(promoAfterAdding).toMatchObject(BasicPromoInDatabase);
  });

  test("add promo content should match", async () => {
    const addCardResponse = await addCreditCardCallable({
      name: "test_card_name",
      id: "test_card_uid"
    });
    expect(addCardResponse).toBeNull;
    const addPromoResponse = await addPromoCallable(BasicPromo);
    expect(addPromoResponse).toBeNull;
    const promoExist: boolean = await backdoorPromoExist(
      db,
      "test_user",
      "test_card_uid",
      "test_promo"
    );
    expect(promoExist).toBeTruthy;
    const promoData = await backdoorGetPromo(
      db,
      "test_user",
      "test_card_uid",
      "test_promo"
    );
    expect(promoData).toBeDefined;
    expect(promoData).toMatchObject(BasicPromoInDatabase);
  });

  test("http remove promo should work", async () => {
    const addCardResponse = await addCreditCardCallable({
      name: "test_card_name",
      id: "test_card_uid"
    });
    const addPromoResponse = await addPromoCallable(BasicPromo);
    expect(addPromoResponse).toBeNull;
    expect(addCardResponse).toBeNull;
    const httpRemovePromoResponse = await axios.post(HttpRemovePromoEndpoint, {
      token: "test_token",
      promoId: "test_promo",
      cardUid: "test_card_uid"
    });
    expect(httpRemovePromoResponse.status).toEqual(200);
    const promoExistAfterRemove = await backdoorPromoExist(db, "test_user", "test_card_uid", "test_promo");
    expect(promoExistAfterRemove).toBeFalsy;
  });

  test("remove promo should clear data", async () => {
    const addCardResponse = await addCreditCardCallable({
      name: "test_card_name",
      id: "test_card_uid"
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
      name: "test_card_name",
      id: "test_card_uid"
    });
    expect(addResponse).toBeNull;
    const cardExistAfterAdd: boolean = await backdoorCardExist(
      db,
      "test_user",
      "test_card_uid"
    );
    expect(cardExistAfterAdd).toBeTruthy;
    try {
      await removeCreditCardCallable({
        id: "test_card_wtf"
      });
    } catch (err) {
      expect(err.code).toBe("not-found");
    }
    const cardExistAfterInvalidRemove: boolean = await backdoorCardExist(
      db,
      "test_user",
      "test_card_uid"
    );
    expect(cardExistAfterInvalidRemove).toBeTruthy;
    const removeResponse = await removeCreditCardCallable({
      id: "test_card_uid"
    });
    expect(removeResponse).toBeNull;
    const cardExistAfterRemove: boolean = await backdoorCardExist(
      db,
      "test_user",
      "test_card_uid"
    );
    expect(cardExistAfterRemove).toBeFalsy;
  });

  test("remove card through http should remove card data", async () => {
    const response = await addCreditCardCallable({
      name: "test_card_name",
      id: "test_card_uid"
    });
    expect(response).toBeNull;
    const cardExistAfterAdd: boolean = await backdoorCardExist(
      db,
      "test_user",
      "test_card_uid"
    );
    expect(cardExistAfterAdd).toBeTruthy;
    const res: AxiosResponse = await axios.post(HttpRemoveCreditCardEndpoint, {
      name: "test_card_name",
      id: "test_card_uid"
    });
    expect(res.status).toEqual(200);
    const cardExistAfterRemove: boolean = await backdoorCardExist(
      db,
      "test_user",
      "test_card_uid"
    );
    expect(cardExistAfterRemove).toBeTruthy;
  });

  test("add card backdoor validation", async () => {
    const response = await addCreditCardCallable({
      name: "test_card_name",
      id: "test_card_uid"
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
      name: "test_card_name",
      id: "test_card_uid"
    });
    expect(response).toBeNull;
    const cardsAfterAdding = await getCreditCardsCallable();
    expect(cardsAfterAdding.data["test_card_uid"]).not.toBeNull;
    expect(cardsAfterAdding.data["test_card_uid"]["card_name"]).toBe(
      "test_card_name"
    );
  });

  test("http get cards from empty wallet should fail", async () => {
    try {
      await axios.get(HttpGetCreditCardsEndpoint + "?token=test_user");
    } catch (err) {
      expect(err).toBeDefined;
    }
  });

  test("http get cards should word", async () => {
    const responseFirstCard = await addCreditCardCallable({
      name: "test_card_name_1",
      id: "test_card_uid_1"
    });
    expect(responseFirstCard).toBeNull;
    const responseSecondCard = await addCreditCardCallable({
      name: "test_card_name_2",
      id: "test_card_uid_2"
    });
    expect(responseSecondCard).toBeNull;
    const httpGetCardsResponse = await axios.get(HttpGetCreditCardsEndpoint + "?token=test_user");
    expect(httpGetCardsResponse.status).toEqual(200);
    expect(httpGetCardsResponse.data).toMatchObject({
      "test_card_uid_1": {
        "card_name": "test_card_name_1"
      }, 
      "test_card_uid_2": {
        "card_name": "test_card_name_2"
      }
    });
  });

  test("remove user should not crash", async () => {
    const response = await removeUserCallable();
    expect(response).toBeNull;
  });

  test("http remove user should work", async () => {
    const addCardResponse = await addCreditCardCallable({
      name: "test_card_name",
      id: "test_card_uid"
    });
    expect(addCardResponse).toBeNull;
    const cardExistAfterAdd: boolean = await backdoorCardExist(
      db,
      "test_user",
      "test_card_uid"
    );
    expect(cardExistAfterAdd).toBeTruthy;
    const removeUserResponse = await axios.post(HttpRemoveUserEndpoint, {
      token: "test_token"
    });
    expect(removeUserResponse.status).toEqual(200);
    const userExistAfterRemove = backdoorUserExist(db, "test_user");
    expect(userExistAfterRemove).toBeFalsy;
    const cardExistAfterRemove: boolean = await backdoorCardExist(
      db,
      "test_user",
      "test_card_uid"
    );
    expect(cardExistAfterRemove).toBeFalsy;
  });

  test("remove user should remove user data", async () => {
    const addCardResponse = await addCreditCardCallable({
      name: "test_card_name",
      id: "test_card_uid"
    });
    expect(addCardResponse).toBeNull;
    const cardExistAfterAdd: boolean = await backdoorCardExist(
      db,
      "test_user",
      "test_card_uid"
    );
    expect(cardExistAfterAdd).toBeTruthy;
    const removeUserresponse = await removeUserCallable();
    expect(removeUserresponse).toBeNull;
    const userExistAfterRemove = backdoorUserExist(db, "test_user");
    expect(userExistAfterRemove).toBeFalsy;
    const cardExistAfterRemove: boolean = await backdoorCardExist(
      db,
      "test_user",
      "test_card_uid"
    );
    expect(cardExistAfterRemove).toBeFalsy;
  });
});
