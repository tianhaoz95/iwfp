import 'package:flutter/foundation.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';

class DevNavConfig {
  final SubmitScreenStatus status;
  const DevNavConfig(this.status);
}

class ForgotPasswordNavConfig {
  SubmitScreenStatus status;
  String email;
  bool sendEmail;
  ForgotPasswordNavConfig(
      {@required this.email,
      SubmitScreenStatus statusOverride,
      bool sendEmailOverride}) {
    if (statusOverride != null) {
      status = statusOverride;
    } else {
      status = SubmitScreenStatus.LOADING;
    }
    if (sendEmailOverride != null) {
      sendEmail = sendEmailOverride;
    } else {
      sendEmail = true;
    }
  }
}
