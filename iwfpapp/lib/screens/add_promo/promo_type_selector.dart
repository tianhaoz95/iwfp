import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/consts/promo_type_list.dart';
import 'package:iwfpapp/services/config/consts/promo_type_lookup.dart';
import 'package:iwfpapp/services/config/typedefs/promo_types.dart';

typedef void PromotionTypeChangeHandler(CashbackPromoType type);

class PromotionTypeSelector extends StatefulWidget {
  final PromotionTypeChangeHandler onPromotionTypeChange;
  const PromotionTypeSelector(this.onPromotionTypeChange);
  @override
  _PromotionTypeSelector createState() {
    return _PromotionTypeSelector();
  }
}

class _PromotionTypeSelector extends State<PromotionTypeSelector> {
  CashbackPromoType selected;

  @override
  void initState() {
    super.initState();
    selected = CashbackPromoType.BRAND;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1.0, style: BorderStyle.solid, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
          child: DropdownButton<CashbackPromoType>(
        hint: Text('Select the type of the promotion'),
        underline: Container(),
        icon: Icon(Icons.arrow_downward),
        value: this.selected,
        onChanged: (CashbackPromoType val) {
          setState(() {
            selected = val;
          });
        },
        items: promotionTypeList.map<DropdownMenuItem<CashbackPromoType>>(
            (CashbackPromoType promoType) {
          return DropdownMenuItem<CashbackPromoType>(
            value: promoType,
            child: Text(promoNameLookup[promoType]),
          );
        }).toList(),
      )),
    );
  }
}
