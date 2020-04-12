import isValidCardData from "../../src/util/validate_card";

describe("card validator tests", () => {
  test("card data validator should not crash", () => {
    expect(() => {
      isValidCardData({ name: "test_card_name", id: "test_card_id" });
    }).not.toThrow();
  });

  test("card data validator should fail if no id", () => {
    expect(isValidCardData({ name: "test_card_name" })).toBe(false);
  });

  test("card data validator should fail if no name", () => {
    expect(isValidCardData({ id: "test_card_id" })).toBe(false);
  });
});
