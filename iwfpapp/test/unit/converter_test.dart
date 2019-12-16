import 'package:iwfpapp/services/utilities/converters/str2date_of_current_year.dart';
import 'package:test/test.dart';

void main() {
  group('converter tests', () {
    test('date of current year', () {
      DateTime resultDateOfCurrentYear = str2dateOfCurrentYear('09/03',
          useCurrentTime: DateTime.utc(1995, 1, 1));
      expect(resultDateOfCurrentYear.year, 1995);
      expect(resultDateOfCurrentYear.month, 9);
      expect(resultDateOfCurrentYear.day, 3);
    });
  });
}
