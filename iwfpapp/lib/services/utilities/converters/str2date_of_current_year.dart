import 'package:iwfpapp/services/utilities/validators/promo_info_validator.dart';

DateTime str2dateOfCurrentYear(String dateStr, {DateTime useCurrentTime}) {
  DateTime currentTime = new DateTime.now();
  if (!isValidMonthDateFormat(dateStr)) {
    return currentTime;
  }
  if (useCurrentTime != null) {
    currentTime = useCurrentTime;
  }
  int currentYear = currentTime.year;
  int targetMonth = int.parse(dateStr.split('/')[0]);
  int targetDay = int.parse(dateStr.split('/')[1]);
  DateTime targetTime = new DateTime.utc(currentYear, targetMonth, targetDay);
  return targetTime;
}
