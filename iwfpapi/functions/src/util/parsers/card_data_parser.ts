import { CardData } from "../../config/typedefs";

export function parseCardDataFromRequest(req: any): CardData {
  let cardData: CardData = {
    valid: true,
    id: 'na',
    name: 'na'
  };
  if (req.name) {
    cardData.name = req.name;
  } else {
    cardData.valid = false;
    cardData.name = 'na';
  }
  if (req.id) {
    cardData.id = req.id;
  } else {
    cardData.valid = false;
    cardData.id = 'na';
  }
  return cardData;
}
