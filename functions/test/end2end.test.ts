import * as firebase from "firebase";
import * as admin from "firebase-admin";
import clearDatabase from "./utilities/clear_database";
import "firebase/functions";
import {
  EmulatedAppConfig,
  DatabaseSettings,
  CloudFunctionEmulatorAddress,
  EmulatedAdminAppConfig,
} from "./config/const";
import {
  BasicPromoInDatabase,
  BasicPromoAlternativeInDatabase,
  createBasicPromotion,
} from "./fixture/promos";
import { backdoorCardExist } from "./utilities/validators/card_existence";
import { backdoorPromoExist } from "./utilities/validators/promo_existence";
import { backdoorGetPromo } from "./utilities/getters/promo";
import { backdoorGetCardData } from "./utilities/getters/card";
import { backdoorUserExist } from "./utilities/validators/user_existence";
import { backdoorCardPromoCnt } from "./utilities/validators/promo_count";
import {
  CreditCardCreationRequest,
  CreditCardUpdateRequest,
  CreditCard,
  PromotionAdditionRequest,
  PromotionRemovalRequest,
  CreditCardRemovalRequest,
  Promotion,
  GetCreditCardResponse,
} from "../src/interfaces/interfaces";
import {
  createTestCreditCard,
  createTestCreditCardTemplate,
} from "./fixture/cards";
import { populateWalletWithCreditCard } from "./utilities/initializers/populate_cards";
import { testUserId } from "./fixture/users";
jest.setTimeout(20000);

describe("end 2 end tests", () => {
  let app: firebase.app.App;
  let adminApp: admin.app.App;
  let db: firebase.firestore.Firestore;
  let adminDb: admin.firestore.Firestore;
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
    adminApp = admin.initializeApp(EmulatedAdminAppConfig);
    db = app.firestore();
    db.settings(DatabaseSettings);
    adminDb = adminApp.firestore();
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
    await adminDb.terminate();
    await app.delete();
    await adminApp.delete();
    console.log("All services terminated.");
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
    await adminDb.collection("test_clear").doc("test0").set({ wow: "wtf" });
    await adminDb.collection("test_clear").doc("test1").set({ wow: "wtf" });
    await adminDb.collection("test_clear").doc("test2").set({ wow: "wtf" });
    const testDocsResponse = await db.collection("test_clear").get();
    console.log(testDocsResponse.docs);
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
    await addCreditCardCallable(
      CreditCardCreationRequest.create({
        cardData: CreditCard.create({
          id: "test_card_0",
          displayName: "test_card_name_0",
        }),
      })
    );
    await addCreditCardCallable(
      CreditCardCreationRequest.create({
        cardData: CreditCard.create({
          id: "test_card_1",
          displayName: "test_card_name_1",
        }),
      })
    );
    await addCreditCardCallable(
      CreditCardCreationRequest.create({
        cardData: CreditCard.create({
          id: "test_card_2",
          displayName: "test_card_name_2",
        }),
      })
    );
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

  test("edit card should work", async () => {
    const testCard: CreditCard = createTestCreditCardTemplate();
    const addResponse = await populateWalletWithCreditCard(
      addCreditCardCallable,
      testCard
    );
    expect(addResponse).toBeNull;
    const cardAfterAdding = await backdoorGetCardData(
      db,
      testUserId,
      testCard.id
    );
    expect(cardAfterAdding).toBeDefined;
    expect(cardAfterAdding).toMatchObject({
      displayName: testCard.displayName,
    });
    const updatedTestCard = createTestCreditCardTemplate();
    updatedTestCard.displayName = "edited_test_card_name";
    const editResponse = await editCreditCardsCallable(
      CreditCardUpdateRequest.create({
        updatedCardData: updatedTestCard,
      }).toJSON()
    );
    expect(editResponse).toBeNull;
    const cardAfterEditing = await backdoorGetCardData(
      db,
      testUserId,
      testCard.id
    );
    expect(cardAfterEditing).toBeDefined;
    expect(cardAfterEditing).toMatchObject({
      id: "test_card_id",
      displayName: "edited_test_card_name",
    });
  });

  test("add card should succeed", async () => {
    const testCard: CreditCard = createTestCreditCard();
    const response = await populateWalletWithCreditCard(
      addCreditCardCallable,
      testCard
    );
    expect(response).toBeNull;
    const cardExist = await backdoorCardExist(db, testUserId, testCard.id);
    expect(cardExist).toBeTruthy;
  });

  test("add card with template should succeed", async () => {
    const testCard: CreditCard = createTestCreditCardTemplate();
    const response = await populateWalletWithCreditCard(
      addCreditCardCallable,
      testCard
    );
    expect(response).toBeNull;
    const cardExist = await backdoorCardExist(db, testUserId, testCard.id);
    expect(cardExist).toBeTruthy;
    const cardPromoCnt: number = await backdoorCardPromoCnt(
      db,
      testUserId,
      testCard.id
    );
    expect(cardPromoCnt).toBe(2);
    const promoAfterAdding = await backdoorGetPromo(
      db,
      testUserId,
      testCard.id,
      testCard.promotions[0].id ? testCard.promotions[0].id : "wtf"
    );
    expect(promoAfterAdding).toBeDefined;
    expect(promoAfterAdding).not.toBeNull;
    expect(promoAfterAdding).toMatchObject(BasicPromoInDatabase);
    const promoAlternativeAfterAdding = await backdoorGetPromo(
      db,
      testUserId,
      testCard.id,
      testCard.promotions[1].id ? testCard.promotions[1].id : "wtf"
    );
    expect(promoAlternativeAfterAdding).toBeDefined;
    expect(promoAlternativeAfterAdding).not.toBeNull;
    expect(promoAlternativeAfterAdding).toMatchObject(
      BasicPromoAlternativeInDatabase
    );
  });

  test("add promo should not crash", async () => {
    const testCard: CreditCard = createTestCreditCard();
    const addCardResponse = await populateWalletWithCreditCard(
      addCreditCardCallable,
      testCard
    );
    expect(addCardResponse).toBeNull;
    const addPromoResponse = await addPromoCallable(
      PromotionAdditionRequest.create({
        targetCardId: testCard.id,
        promotionData: createBasicPromotion(),
      }).toJSON()
    );
    expect(addPromoResponse).toBeNull;
  });

  test("add promo content should match", async () => {
    const testCard: CreditCard = createTestCreditCard();
    const testPromo: Promotion = createBasicPromotion();
    const addCardResponse = await populateWalletWithCreditCard(
      addCreditCardCallable,
      testCard
    );
    expect(addCardResponse).toBeNull;
    const addPromoResponse = await addPromoCallable(
      PromotionAdditionRequest.create({
        targetCardId: testCard.id,
        promotionData: testPromo,
      }).toJSON()
    );
    expect(addPromoResponse).toBeNull;
    const promoExist: boolean = await backdoorPromoExist(
      db,
      testUserId,
      testCard.id,
      testPromo.id
    );
    expect(promoExist).toBeTruthy;
    const promoData = await backdoorGetPromo(
      db,
      testUserId,
      testCard.id,
      testPromo.id
    );
    expect(promoData).toBeDefined;
    expect(promoData).toMatchObject(BasicPromoInDatabase);
  });

  test("remove promo should clear data", async () => {
    const testCard: CreditCard = createTestCreditCard();
    const testPromo: Promotion = createBasicPromotion();
    const addCardResponse = await populateWalletWithCreditCard(
      addCreditCardCallable,
      testCard
    );
    expect(addCardResponse).toBeNull;
    const addPromoResponse = await addPromoCallable(
      PromotionAdditionRequest.create({
        targetCardId: testCard.id,
        promotionData: testPromo,
      }).toJSON()
    );
    expect(addPromoResponse).toBeNull;
    const promoSnap = await db
      .collection("channel")
      .doc("production-v1")
      .collection("users")
      .doc(testUserId)
      .collection("cards")
      .doc(testCard.id)
      .collection("promos")
      .doc(testPromo.id)
      .get();
    expect(promoSnap.exists).toBeTruthy;
    const removePromoResponse = await removePromoCallable(
      PromotionRemovalRequest.create({
        targetCardId: testCard.id,
        targetPromotionId: testPromo.id,
      }).toJSON()
    );
    expect(removePromoResponse).toBeNull;
    const promoSnapAfterRemoval = await db
      .collection("channel")
      .doc("production-v1")
      .collection("users")
      .doc(testUserId)
      .collection("cards")
      .doc(testCard.id)
      .collection("promos")
      .doc(testPromo.id)
      .get();
    expect(promoSnapAfterRemoval.exists).toBeFalsy;
  });

  test("remove card should not crash", async () => {
    const testCard: CreditCard = createTestCreditCard();
    const addCardResponse = await populateWalletWithCreditCard(
      addCreditCardCallable,
      testCard
    );
    expect(addCardResponse).toBeNull;
    const cardExistAfterAdd: boolean = await backdoorCardExist(
      db,
      testUserId,
      testCard.id
    );
    expect(cardExistAfterAdd).toBeTruthy;
    try {
      await removeCreditCardCallable(
        CreditCardRemovalRequest.create({
          cardId: "test_card_wtf",
        })
      );
    } catch (err) {
      expect(err.code).toBe("not-found");
    }
    const cardExistAfterInvalidRemove: boolean = await backdoorCardExist(
      db,
      testUserId,
      testCard.id
    );
    expect(cardExistAfterInvalidRemove).toBeTruthy;
    const removeResponse = await removeCreditCardCallable(
      CreditCardRemovalRequest.create({
        cardId: testCard.id,
      })
    );
    expect(removeResponse).toBeNull;
    const cardExistAfterRemove: boolean = await backdoorCardExist(
      db,
      testUserId,
      testCard.id
    );
    expect(cardExistAfterRemove).toBeFalsy;
  });

  test("add card backdoor validation", async () => {
    const testCard: CreditCard = createTestCreditCard();
    const addCardResponse = await populateWalletWithCreditCard(
      addCreditCardCallable,
      testCard
    );
    expect(addCardResponse).toBeNull;
    const cardSnap = await db
      .collection("channel")
      .doc("production-v1")
      .collection("users")
      .doc(testUserId)
      .collection("cards")
      .doc(testCard.id)
      .get();
    expect(cardSnap.exists).toBeTruthy;
    expect(cardSnap.id).toBe(testCard.id);
    expect(cardSnap.data()).toMatchObject({
      displayName: testCard.displayName,
    });
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
    const testCard: CreditCard = createTestCreditCard();
    const addCardResponse = await populateWalletWithCreditCard(
      addCreditCardCallable,
      testCard
    );
    expect(addCardResponse).toBeNull;
    const cardsAfterAdding = await getCreditCardsCallable();
    const getCreditCardsResponse: GetCreditCardResponse = GetCreditCardResponse.decode(
      cardsAfterAdding["data"]["serialized"]
    );
    expect(getCreditCardsResponse.cards[0].displayName).toMatch(
      "test_card_name"
    );
  });

  test("remove user should not crash", async () => {
    const response = await removeUserCallable();
    expect(response).toBeNull;
  });

  test("remove user should remove user data", async () => {
    const testCard: CreditCard = createTestCreditCard();
    const addCardResponse = await populateWalletWithCreditCard(
      addCreditCardCallable,
      testCard
    );
    expect(addCardResponse).toBeNull;
    const cardExistAfterAdd: boolean = await backdoorCardExist(
      db,
      testUserId,
      testCard.id
    );
    expect(cardExistAfterAdd).toBeTruthy;
    const removeUserresponse = await removeUserCallable();
    expect(removeUserresponse).toBeNull;
    const userExistAfterRemove = backdoorUserExist(db, testUserId);
    expect(userExistAfterRemove).toBeFalsy;
    const cardExistAfterRemove: boolean = await backdoorCardExist(
      db,
      testUserId,
      testCard.id
    );
    expect(cardExistAfterRemove).toBeFalsy;
  });
});
