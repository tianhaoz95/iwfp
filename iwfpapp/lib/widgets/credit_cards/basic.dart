import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/services/config/typedefs/cashback_promo.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/config/typedefs/shop_category.dart';
import 'package:iwfpapp/services/utilities/rankers/card_reward_ranker.dart';
import 'package:iwfpapp/services/utilities/rankers/time_range_promo_ranker.dart';
import 'package:iwfpapp/widgets/promos/chip.dart';

class BasicCreditCard extends StatelessWidget {
  final CreditCard cardMetaData;
  final ShopCategory targetCategory;
  final MaterialColor color;
  final bool edit;
  final Widget actions;
  const BasicCreditCard(this.cardMetaData, this.color, this.edit,
      {this.actions, this.targetCategory});

  String renderCardName() {
    String showCardName = 'Unknown';
    if (cardMetaData.name != null) {
      showCardName = cardMetaData.name;
      if (targetCategory != null) {
        double maxRate = getMaxRate(cardMetaData, targetCategory);
        showCardName = showCardName + ' w/ rate @ ' + maxRate.toString() + '%';
      }
    }
    return showCardName;
  }

  List<Widget> getCardContent(BuildContext context) {
    List<Widget> content = <Widget>[
      Container(
          padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 5.0),
          child: Text(renderCardName())),
      Container(
        height: 45.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: rankPromotionsWithTimeRange(cardMetaData.promos)
              .reversed
              .map((CashbackPromo promo) {
            return PromotionChip(promo);
          }).toList(),
        ),
      ),
    ];
    Widget editContent = getEditContent(context);
    if (editContent != null) {
      content.add(editContent);
    }
    if (actions != null) {
      content.add(actions);
    }
    return content;
  }

  Widget getEditContent(BuildContext context) {
    if (edit == true) {
      return Row(
        children: <Widget>[
          Material(
            color: Colors.white,
            child: FlatButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/edit_card',
                    arguments: cardMetaData);
              },
              child: Text('Edit'),
            ),
          ),
          Material(
            color: Colors.white,
            child: FlatButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/remove_card',
                    arguments: cardMetaData);
              },
              child: Text('Remove'),
            ),
          )
        ],
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Card(child: Column(children: getCardContent(context))));
  }
}
