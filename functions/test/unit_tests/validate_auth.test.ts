import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import { mock, instance } from "ts-mockito";
import isValidAuth from "../../src/util/validate_auth";

describe("auth validator tests", () => {
  const sampleContext: functions.https.CallableContext = mock<
    functions.https.CallableContext
  >();
  const sampleToken: admin.auth.DecodedIdToken = mock<
    admin.auth.DecodedIdToken
  >();

  test("real user should pass", () => {
    const context = instance(sampleContext);
    const token = instance(sampleToken);
    context.auth = {
      uid: "test_user_uid",
      token: token,
    };
    expect(isValidAuth(context, undefined)).toBe(true);
  });

  test("emulator should pass", () => {
    const context = instance(sampleContext);
    context.auth = undefined;
    expect(isValidAuth(context, "true")).toBe(true);
  });

  test("no user should fail", () => {
    const context = instance(sampleContext);
    context.auth = undefined;
    expect(isValidAuth(context, undefined)).toBe(false);
  });
});
