import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/utilities/validators/email_validator.dart';
import 'package:iwfpapp/services/utilities/validators/password_validator.dart';
import 'package:iwfpapp/services/utilities/validators/promo_info_validator.dart';
import 'package:iwfpapp/services/utilities/validators/register_validator.dart';
import 'package:test/test.dart';

void main() {
  group('validator tests', () {
    test('annual promo start end should pass', () {
      ValidationResponse response =
          isValidAnnualRepeatStartEnd('01/02', '03/05');
      expect(response.valid, true);
    });

    test('annual promo start exceed length should fail', () {
      ValidationResponse response =
          isValidAnnualRepeatStartEnd('001/02', '003/05');
      expect(response.valid, false);
      response = isValidAnnualRepeatStartEnd('01/002', '03/005');
      expect(response.valid, false);
      response = isValidAnnualRepeatStartEnd('001/002', '003/005');
      expect(response.valid, false);
    });

    test('annual promo start no separator should fail', () {
      ValidationResponse response = isValidAnnualRepeatStartEnd('0102', '0305');
      expect(response.valid, false);
    });

    test('annual promo start as const should fail', () {
      ValidationResponse response = isValidAnnualRepeatStartEnd('na', 'na');
      expect(response.valid, false);
    });

    test('annual promo start multiple separators should fail', () {
      ValidationResponse response =
          isValidAnnualRepeatStartEnd('01/01/01', '03/05/01');
      expect(response.valid, false);
    });

    test('annual promo back date should fail', () {
      ValidationResponse response =
          isValidAnnualRepeatStartEnd('05/01', '03/01');
      expect(response.valid, false);
    });

    test('correct email should pass', () {
      expect(isValidEmail('tianhaoz@umich.edu').valid, true);
      expect(isValidEmail('jacksonzhou666@gmail.com').valid, true);
    });

    test('empty email should fail', () {
      ValidationResponse response = isValidEmail('');
      expect(response.valid, false);
    });

    test('email with space should fail', () {
      ValidationResponse response = isValidEmail('jackson zhou666@gmail');
      expect(response.valid, false);
    });

    test('malformed email should fail', () {
      expect(isValidEmail('jacksonzhou666@gmail').valid, false);
      expect(isValidEmail('jacksonzhou666gmail.com').valid, false);
      expect(isValidEmail('jacksonzhou666gmailcom').valid, false);
    });

    test('well formed password should pass', () {
      ValidationResponse response = isValidPassword('250250abc');
      expect(response.valid, true);
    });

    test('empty password should fail', () {
      ValidationResponse response = isValidPassword('');
      expect(response.valid, false);
    });

    test('password contain space should fail', () {
      ValidationResponse response = isValidPassword('250250 abc');
      expect(response.valid, false);
    });

    test('short password should fail', () {
      ValidationResponse response = isValidPassword('250');
      expect(response.valid, false);
    });

    test('password confirmation not match should fail', () {
      ValidationResponse response =
          isValidRegisterInfo('tianhaoz@umich.edu', '250250abc', '250250xyz');
      expect(response.valid, false);
    });
  });
}
