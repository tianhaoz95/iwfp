import 'package:iwfpapp/services/cashback_promo.dart';

bool isInValidTimeRange(CashbackPromo promo, {DateTime useCurrentTime}) {
  bool valid = false;
  switch (promo.repeat) {
    case 'const':
      {
        valid = true;
      }
      break;

    case 'annual':
      {
        DateTime currentTime = new DateTime.now();
        if (useCurrentTime != null) {
          currentTime = useCurrentTime;
        }
        int currentYear = currentTime.year;
        int startMonth = int.parse(promo.start.split('/')[0]);
        int startDay = int.parse(promo.start.split('/')[1]);
        int endMonth = int.parse(promo.end.split('/')[0]);
        int endDay = int.parse(promo.end.split('/')[1]);
        DateTime startTime =
            new DateTime.utc(currentYear, startMonth, startDay);
        DateTime endTime = new DateTime.utc(currentYear, endMonth, endDay);
        if (currentTime.isAfter(startTime) && currentTime.isBefore(endTime)) {
          valid = true;
        } else {
          valid = false;
        }
      }
      break;

    default:
      {
        valid = false;
      }
      break;
  }
  return valid;
}
