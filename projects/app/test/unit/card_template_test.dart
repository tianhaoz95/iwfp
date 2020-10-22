import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_getter.dart';
import 'package:test/test.dart';

void main() {
  group('card template tests', () {
    test('templates should not contain duplicated id', () async {
      List<CreditCard> templates = await getLocalCreditCardTemplates();
      Map<String, int> templateIdCntDict = {};
      for (CreditCard template in templates) {
        if (templateIdCntDict.containsKey(template.id)) {
          templateIdCntDict[template.id] = templateIdCntDict[template.id] + 1;
        } else {
          templateIdCntDict[template.id] = 1;
        }
      }
      for (int templateIdCnt in templateIdCntDict.values) {
        expect(templateIdCnt, 1);
      }
    });
  });
}
