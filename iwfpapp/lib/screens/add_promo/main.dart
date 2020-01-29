import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/data_store/base.dart';
import 'package:iwfpapp/services/utilities/validators/promo_info_validator.dart';

class AddPromoScreen extends StatefulWidget {
  final DataBackend dataBackend;
  final CreditCard defaultCard;
  const AddPromoScreen(this.dataBackend, {Key key, this.defaultCard})
      : super(key: key);
  @override
  _AddPromoScreen createState() {
    return _AddPromoScreen();
  }
}

class _AddPromoScreen extends State<AddPromoScreen> {
  CreditCard card;
  SubmitScreenStatus status = SubmitScreenStatus.PENDING;
  TextEditingController promoNameCtrl = TextEditingController();
  TextEditingController promoIdCtrl = TextEditingController();
  TextEditingController promoTypeCtrl = TextEditingController();
  TextEditingController promoStartCtrl = TextEditingController();
  TextEditingController promoEndCtrl = TextEditingController();
  TextEditingController promoRepeatCtrl = TextEditingController();
  TextEditingController promoRateCtrl = TextEditingController();
  TextEditingController promoCategoryNameCtrl = TextEditingController();
  TextEditingController promoCategoryIdCtrl = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.arguments != null) {
      card = ModalRoute.of(context).settings.arguments;
    } else {
      if (widget.defaultCard != null) {
        card = widget.defaultCard;
      }
    }
  }

  Future<void> promptWarning(
      BuildContext context, List<String> messages) async {
    List<Widget> content = messages.map((String message) {
      return Text(message);
    }).toList();
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: content,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Back'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> handleAddPromo() async {
    String promoName = promoNameCtrl.text;
    String promoId = promoIdCtrl.text;
    String promoType = promoTypeCtrl.text;
    String promoStart = promoStartCtrl.text;
    String promoEnd = promoEndCtrl.text;
    String promoRepeat = promoRepeatCtrl.text;
    String promoRateStr = promoRateCtrl.text;
    String promoCategoryName = promoCategoryNameCtrl.text;
    String promoCategoryId = promoCategoryIdCtrl.text;
    ValidationResponse validationResponse = isValidPromoInfo(
        promoName,
        promoId,
        promoType,
        promoStart,
        promoEnd,
        promoRepeat,
        promoRateStr,
        promoCategoryName,
        promoCategoryId);
    if (!validationResponse.valid) {
      await promptWarning(context, validationResponse.messages);
      return;
    }
    setState(() {
      status = SubmitScreenStatus.LOADING;
    });
    int promoRate = int.parse(promoRateStr);
    CashbackPromo promo = CashbackPromo(
        promoName,
        promoId,
        promoType,
        promoStart,
        promoEnd,
        promoRepeat,
        promoRate,
        ShopCategory(promoCategoryName, promoCategoryId));
    BackendResponse response = await widget.dataBackend
        .addPromotion(PromotionAdditionRequest(card.id, promo));
    if (response.status == ResponseStatus.SUCCEESS) {
      setState(() {
        status = SubmitScreenStatus.DONE;
      });
    } else if (response.status == ResponseStatus.FAILURE) {
      setState(() {
        status = SubmitScreenStatus.ERROR;
      });
    } else {
      setState(() {
        status = SubmitScreenStatus.UNKNOWN;
      });
    }
  }

  Widget renderPendingContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          Text('Adding Promotion for ${card.name}...'),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: promoNameCtrl,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Promotion Name'),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: promoIdCtrl,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Promotion ID (unique)'),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: promoTypeCtrl,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Promotion Type'),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: promoStartCtrl,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Start Date (MM/DD)'),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: promoEndCtrl,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'End Date (MM/DD)'),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: promoRepeatCtrl,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Repeat Pattern'),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: promoRateCtrl,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Cashback Rate'),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: promoCategoryNameCtrl,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Category Name'),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: promoCategoryIdCtrl,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Category ID (unique)'),
          ),
          SizedBox(
            height: 5.0,
          ),
          Material(
            child: RaisedButton(
              color: Colors.green,
              onPressed: () {
                handleAddPromo();
              },
              child: Text(
                'Add Promotion',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Material(
            child: RaisedButton(
              color: Colors.redAccent,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/edit_card',
                    arguments: card);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget renderDoneContent(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Material(
            child: Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Text('Promotion Added'),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: RaisedButton(
              color: Colors.green,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/edit_card',
                    arguments: widget.dataBackend.renewCreditCardInfo(card));
              },
              child: Text(
                'Back to Card Editing',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderErrorContent(BuildContext context) {
    return Container(
      child: Text('error'),
    );
  }

  Widget renderLoadingContent(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget renderUnknownContent(BuildContext context) {
    return Container(
      child: Text('unknown'),
    );
  }

  Widget renderContent(BuildContext context) {
    Widget content = renderUnknownContent(context);
    switch (status) {
      case SubmitScreenStatus.DONE:
        content = renderDoneContent(context);
        break;
      case SubmitScreenStatus.PENDING:
        content = renderPendingContent(context);
        break;
      case SubmitScreenStatus.ERROR:
        content = renderErrorContent(context);
        break;
      case SubmitScreenStatus.LOADING:
        content = renderLoadingContent(context);
        break;
      default:
        content = renderUnknownContent(context);
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Promotion'),
      ),
      body: renderContent(context),
    );
  }
}
