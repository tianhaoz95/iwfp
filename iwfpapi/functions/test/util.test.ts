import isValidCardData from "../src/util/validate_card";

test("no id should fail", () => {
  expect(isValidCardData({ name: "test_card_name" })).toBe(false);
});

test("no name should fail", () => {
  expect(isValidCardData({ id: "test_card_id" })).toBe(false);
});

test("no crash", () => {
  expect(() => {
    isValidCardData({ name: "test_card_name", id: "test_card_id" });
  }).not.toThrow();
});
