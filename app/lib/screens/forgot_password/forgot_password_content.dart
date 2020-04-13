import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/forgot_password/reset_email_sent.dart';
import 'package:iwfpapp/screens/forgot_password/sending_reset_email.dart';
import 'package:iwfpapp/screens/forgot_password/sending_reset_email_error.dart';
import 'package:iwfpapp/screens/forgot_password/sending_reset_email_pending.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/config/typedefs/reset_email_states.dart';
import 'package:iwfpapp/widgets/generic/unknown_error.dart';
import 'package:provider/provider.dart';

class ForgotPasswordContent extends StatelessWidget {
  final String email;
  const ForgotPasswordContent({@required this.email});
  @override
  Widget build(BuildContext context) {
    return Consumer<AppAuth>(
      builder: (BuildContext context, AppAuth auth, Widget child) {
        switch (auth.getResetEmailState()) {
          case ResetEmailState.PENDING:
            return SendingResetEmailPending(email: this.email);
          case ResetEmailState.ERROR:
            return SendingResetEmailError();
          case ResetEmailState.SENDING:
            return SendingResetEmail(
              email: this.email,
            );
          case ResetEmailState.SENT:
            return ResetEmailSent(email: this.email);
          default:
            return UnknownError();
        }
      },
    );
  }
}
