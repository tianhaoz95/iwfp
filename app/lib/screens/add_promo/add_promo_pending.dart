import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/add_promo/promo_type_selector.dart';
import 'package:iwfpapp/screens/add_promo/repeat_pattern_selector.dart';
import 'package:iwfpapp/screens/auth/prompt_warning.dart';
import 'package:iwfpapp/services/config/consts/promo_type_lookup.dart';
import 'package:iwfpapp/services/config/consts/repeat_pattern_lookup.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/promo_types.dart';
import 'package:iwfpapp/services/config/typedefs/repeat_pattern.dart';
import 'package:iwfpapp/services/config/typedefs/validation_response.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/interfaces/promotion.pbserver.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_creator.dart';
import 'package:iwfpapp/services/utilities/validators/promo_info_validator.dart';
import 'package:provider/provider.dart';

class AddPromoPending extends StatefulWidget {
  final CreditCard card;
  const AddPromoPending({@required this.card});
  @override
  State<StatefulWidget> createState() {
    return _AddPromoPending();
  }
}

class _AddPromoPending extends State<AddPromoPending> {
  TextEditingController promoNameCtrl;
  TextEditingController promoIdCtrl;
  TextEditingController promoTypeCtrl;
  TextEditingController promoStartCtrl;
  TextEditingController promoEndCtrl;
  TextEditingController promoRepeatCtrl;
  TextEditingController promoRateCtrl;
  TextEditingController promoCategoryNameCtrl;
  TextEditingController promoCategoryIdCtrl;
  String promotionType;
  String promoRepeatPattern;
  bool editRepeatDetails;

  @override
  void initState() {
    super.initState();
    this.promotionType = 'brand';
    this.editRepeatDetails = true;
    promoNameCtrl = TextEditingController();
    promoIdCtrl = TextEditingController();
    promoTypeCtrl = TextEditingController();
    promoStartCtrl = TextEditingController();
    promoEndCtrl = TextEditingController();
    promoRepeatCtrl = TextEditingController();
    promoRateCtrl = TextEditingController();
    promoCategoryNameCtrl = TextEditingController();
    promoCategoryIdCtrl = TextEditingController();
  }

  Future<void> handleAddPromo() async {
    String promoName = promoNameCtrl.text;
    String promoId = promoIdCtrl.text;
    String promoType = this.promotionType;
    String promoStart = promoStartCtrl.text;
    String promoEnd = promoEndCtrl.text;
    String promoRepeat = this.promoRepeatPattern;
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
    double promoRate = double.parse(promoRateStr);
    Promotion promo = createPromotion(
        promoName,
        promoId,
        promoType,
        promoStart,
        promoEnd,
        promoRepeat,
        promoRate,
        createShoppingCategory(promoCategoryName, promoCategoryId));
    Provider.of<DataBackend>(context, listen: false)
        .addPromotion(PromotionAdditionRequest(widget.card.id, promo));
  }

  void onPromotionTypeChange(CashbackPromoType type) {
    setState(() {
      this.promotionType = promoIdLookup[type];
    });
  }

  void onRepeatPatternChange(CashbackPromoRepeatPattern pattern) {
    this.promoRepeatPattern = repeatPatternIdLookup[pattern];
    if (pattern == CashbackPromoRepeatPattern.CONST) {
      this.promoStartCtrl.text = 'Not Applicable';
      this.promoEndCtrl.text = 'Not Applicable';
      setState(() {
        this.editRepeatDetails = false;
      });
    }
    if (pattern == CashbackPromoRepeatPattern.ANNUAL) {
      this.promoStartCtrl.text = '';
      this.promoEndCtrl.text = '';
      setState(() {
        this.editRepeatDetails = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          Container(
            child: Center(
              child: Text('Repeat Pattern of Promotion'),
            ),
          ),
          Divider(),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: this.promoNameCtrl,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Promotion Name'),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: this.promoIdCtrl,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Promotion ID (unique)'),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: this.promoRateCtrl,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Cashback Rate'),
          ),
          SizedBox(
            height: 5.0,
          ),
          PromotionTypeSelector(this.onPromotionTypeChange),
          SizedBox(
            height: 5.0,
          ),
          Container(
            child: Center(
              child: Text('Promotion Repeat Pattern'),
            ),
          ),
          Divider(),
          RepeatPatternSelector(this.onRepeatPatternChange),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: this.promoStartCtrl,
            enabled: this.editRepeatDetails,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Start Date (MM/DD)'),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: this.promoEndCtrl,
            enabled: this.editRepeatDetails,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'End Date (MM/DD)'),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            child: Center(
              child: Text('Promotion Target'),
            ),
          ),
          Divider(),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: this.promoCategoryNameCtrl,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Category Name'),
          ),
          SizedBox(
            height: 5.0,
          ),
          TextField(
            controller: this.promoCategoryIdCtrl,
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
                this.handleAddPromo();
              },
              child: Text(
                'Add Promotion',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
