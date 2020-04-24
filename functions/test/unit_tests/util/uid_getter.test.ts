import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import { mock, instance } from "ts-mockito";
import getUserUid from "../../../src/util/uid_getter";

describe("uid getter tests", () => {
  const sampleContext: functions.https.CallableContext = mock<
    functions.https.CallableContext
  >();
  const sampleToken: admin.auth.DecodedIdToken = mock<
    admin.auth.DecodedIdToken
  >();

  test("real user should match uid", () => {
    const context = instance(sampleContext);
    const token = instance(sampleToken);
    context.auth = {
      uid: "non_emulated_uid",
      token: token,
    };
    expect(getUserUid(context, undefined)).toMatch("non_emulated_uid");
  });

  test("emulated user should match uid", () => {
    const context = instance(sampleContext);
    const token = instance(sampleToken);
    context.auth = {
      uid: "non_emulated_uid",
      token: token,
    };
    expect(getUserUid(context, "true")).toMatch("test_user");
  });

  test("unknown user should fail", () => {
    const context = instance(sampleContext);
    context.auth = undefined;
    expect(() => {
      getUserUid(context, undefined);
    }).toThrow();
  });
});
