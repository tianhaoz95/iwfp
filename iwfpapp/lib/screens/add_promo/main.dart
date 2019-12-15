import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iwfpapp/services/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/credit_card.dart';
import 'package:iwfpapp/services/data_store.dart';
import 'package:iwfpapp/services/shop_category.dart';
import 'package:iwfpapp/services/status.dart';
import 'package:iwfpapp/services/utilities/validators/promo_info_validator.dart';

class AddPromoScreen extends StatefulWidget {
  final DataStore dataStore;
  final CreditCard defaultCard;
  const AddPromoScreen(this.dataStore, {Key key, this.defaultCard})
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
    CloudFuncResponse response = await widget.dataStore.addPromo(card, promo);
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
            color: Colors.cyan[100],
            child: RaisedButton(
              color: Colors.cyan,
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
            color: Colors.cyan[100],
            child: RaisedButton(
              color: Colors.cyan,
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
            color: Colors.cyan[100],
            child: Card(
              color: Colors.cyan,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Text('Promotion Added',
                      style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 15.0,
                  ),
                  RaisedButton(
                    color: Colors.amber[900],
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/edit_card',
                          arguments: widget.dataStore.renewCard(card));
                    },
                    child: Text(
                      'Back to Card Editing',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
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
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Add Promotion for ' + card.name),
      ),
      body: renderContent(context),
    );
  }
}
