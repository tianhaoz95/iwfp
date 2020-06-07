import { BasicPromo, BasicPromoAlternative } from "../../../fixture/promos";
import { parseCardCreationWithTemplateRequest } from "../../../../src/util/parsers/card";
import { CreditCardCreationRequest } from "../../../../src/interfaces/interfaces";

describe("card parser test", () => {
  test("should contain the correct number of promos", () => {
    const rawRequest: any = {
      name: "test_card_name",
      id: "test_card_uid",
      promos: [BasicPromo, BasicPromoAlternative],
    };
    const request: CreditCardCreationRequest = parseCardCreationWithTemplateRequest(
      rawRequest
    );
    expect(request.cardData?.promotions?.length).toBe(2);
  });

  test("should contain the correct card content", () => {
    const rawRequest: any = {
      name: "test_card_name",
      id: "test_card_uid",
      promos: [BasicPromo, BasicPromoAlternative],
    };
    const request: CreditCardCreationRequest = parseCardCreationWithTemplateRequest(
      rawRequest
    );
    expect(request.cardData?.id).toMatch("test_card_uid");
    expect(request.cardData?.displayName).toMatch("test_card_name");
  });
});
