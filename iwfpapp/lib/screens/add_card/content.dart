import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/add_card/add_card_form.dart';
import 'package:iwfpapp/screens/add_card/card_added.dart';
import 'package:iwfpapp/screens/add_card/error.dart';
import 'package:iwfpapp/screens/add_card/loading.dart';
import 'package:iwfpapp/screens/add_card/unknown.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';

class AddCardScreenContent extends StatelessWidget {
  final SubmitScreenStatus status;
  final TextEditingController cardIdInputCtrl;
  final TextEditingController cardNameInputCtrl;
  final AddCardHandler addCardHandler;
  final String errMsg;
  const AddCardScreenContent({
    @required this.status,
    @required this.addCardHandler,
    @required this.cardIdInputCtrl,
    @required this.cardNameInputCtrl,
    @required this.errMsg,
  });
  @override
  Widget build(BuildContext context) {
    switch (status) {
      case SubmitScreenStatus.PENDING:
        return AddCardScreenAddCardFormContent(
          addCardHandler: this.addCardHandler,
          cardIdInputCtrl: this.cardIdInputCtrl,
          cardNameInputCtrl: this.cardNameInputCtrl,
        );
      case SubmitScreenStatus.LOADING:
        return AddCardScreenLoadingContent();
      case SubmitScreenStatus.ERROR:
        return AddCardScreenErrorContent(
          errMsg: this.errMsg,
        );
      case SubmitScreenStatus.DONE:
        return AddCardScreenCardAddedContent();
      default:
        return AddCardScreenUnkownErrorContent();
    }
  }
}
