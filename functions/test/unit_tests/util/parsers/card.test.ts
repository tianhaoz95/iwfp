import { BasicPromo, BasicPromoAlternative } from "../../../fixture/promos";
import { parseCardCreationWithTemplateRequest } from "../../../../src/util/parsers/card";
import { CardCreationWithTemplateRequest } from "../../../../src/config/typedefs";

describe("card parser test", () => {
  test("should contain the correct number of promos", () => {
    const rawRequest: any = {
      name: "test_card_name",
      id: "test_card_uid",
      promos: [BasicPromo, BasicPromoAlternative],
    };
    const request: CardCreationWithTemplateRequest = parseCardCreationWithTemplateRequest(
      rawRequest
    );
    expect(request.promos.length).toBe(2);
  });

  test("should contain the correct card content", () => {
    const rawRequest: any = {
      name: "test_card_name",
      id: "test_card_uid",
      promos: [BasicPromo, BasicPromoAlternative],
    };
    const request: CardCreationWithTemplateRequest = parseCardCreationWithTemplateRequest(
      rawRequest
    );
    expect(request.id).toMatch("test_card_uid");
    expect(request.name).toMatch("test_card_name");
  });
});
