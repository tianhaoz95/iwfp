import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/screens/add_card/content.dart';
import 'package:iwfpapp/screens/add_card/prompt_warning.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/nav_config.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/services/utilities/validators/card_info_validator.dart';
import 'package:iwfpapp/widgets/layouts/preferred_width.dart';

/// The screen that prompts user to input
/// information to initialize a credit card
///
/// {@category Screens}
class AddCardScreen extends StatefulWidget {
  final DataBackend dataBackend;
  const AddCardScreen(this.dataBackend, {Key key}) : super(key: key);

  @override
  _AddCardScreen createState() {
    return _AddCardScreen();
  }
}

class _AddCardScreen extends State<AddCardScreen> {
  final TextEditingController cardIdInputCtrl = TextEditingController();
  final TextEditingController cardNameInputCtrl = TextEditingController();
  SubmitScreenStatus status;
  DataBackend dataBackend;
  String msg = 'No message yet';

  @override
  void initState() {
    super.initState();
    status = SubmitScreenStatus.PENDING;
    if (widget.dataBackend == null) {
      status = SubmitScreenStatus.ERROR;
    } else {
      dataBackend = widget.dataBackend;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      DevNavConfig navConfig = ModalRoute.of(context).settings.arguments;
      status = navConfig.status;
    }
  }

  Future<void> handleAddCard() async {
    String cardId = cardIdInputCtrl.text;
    String cardName = cardNameInputCtrl.text;
    ValidationResponse validationResponse = isValidCardInfo(cardName, cardId);
    if (!validationResponse.valid) {
      await promptAddCardWarning(context, validationResponse.messages);
      return;
    }
    setState(() {
      status = SubmitScreenStatus.LOADING;
    });
    BackendResponse res = await dataBackend
        .initCreditCard(CreditCardInitRequest(CreditCard(cardName, cardId)));
    if (res == null) {
      setState(() {
        status = SubmitScreenStatus.ERROR;
        msg = 'Response is null, internal error';
      });
    }
    if (res.status == ResponseStatus.SUCCEESS) {
      setState(() {
        status = SubmitScreenStatus.DONE;
      });
    } else {
      setState(() {
        status = SubmitScreenStatus.ERROR;
        msg = res.msg;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Card',
          key: Key('add_card_title'),
        ),
      ),
      body: PreferredWidthContent(
          child: AddCardScreenContent(
        cardIdInputCtrl: this.cardIdInputCtrl,
        cardNameInputCtrl: this.cardNameInputCtrl,
        status: this.status,
        addCardHandler: this.handleAddCard,
        errMsg: this.msg,
      )),
    );
  }
}
