import 'package:logger/logger.dart';

class CustomLoggingFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
