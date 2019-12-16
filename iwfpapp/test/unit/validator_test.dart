import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/utilities/validators/promo_info_validator.dart';
import 'package:test/test.dart';

void main() {
  group('validator tests', () {
    test('annual promo start end pass', () {
      ValidationResponse response =
          isValidAnnualRepeatStartEnd('01/02', '03/05');
      expect(response.valid, true);
    });
    test('annual promo start exceed length fail', () {
      ValidationResponse response =
          isValidAnnualRepeatStartEnd('001/02', '003/05');
      expect(response.valid, false);
      response = isValidAnnualRepeatStartEnd('01/002', '03/005');
      expect(response.valid, false);
      response = isValidAnnualRepeatStartEnd('001/002', '003/005');
      expect(response.valid, false);
    });
    test('annual promo start no separator fail', () {
      ValidationResponse response = isValidAnnualRepeatStartEnd('0102', '0305');
      expect(response.valid, false);
    });
    test('annual promo start as const fail', () {
      ValidationResponse response = isValidAnnualRepeatStartEnd('na', 'na');
      expect(response.valid, false);
    });
    test('annual promo start multiple separators fail', () {
      ValidationResponse response =
          isValidAnnualRepeatStartEnd('01/01/01', '03/05/01');
      expect(response.valid, false);
    });
    test('annual promo back date fail', () {
      ValidationResponse response =
          isValidAnnualRepeatStartEnd('05/01', '03/01');
      expect(response.valid, false);
    });
  });
}
