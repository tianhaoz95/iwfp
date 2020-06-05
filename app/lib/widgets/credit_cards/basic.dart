import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iwfpapp/services/config/typedefs/credit_card.dart';
import 'package:iwfpapp/services/interfaces/promotion.pbserver.dart';
import 'package:iwfpapp/services/interfaces/shopping_category.pb.dart';
import 'package:iwfpapp/services/utilities/rankers/card_reward_ranker.dart';
import 'package:iwfpapp/services/utilities/rankers/time_range_promo_ranker.dart';
import 'package:iwfpapp/widgets/promos/chip.dart';

class BasicCreditCard extends StatelessWidget {
  final CreditCard cardMetaData;
  final ShoppingCategory targetCategory;
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
        height: 70.0,
        padding: EdgeInsets.fromLTRB(4.0, 12.0, 4.0, 4.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: rankPromotionsWithTimeRange(cardMetaData.promos)
              .reversed
              .map((Promotion promo) {
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              color: Colors.green,
              key: Key(this.cardMetaData.id + '_edit_btn'),
              onPressed: () {
                Navigator.pushNamed(context, '/edit_card',
                    arguments: cardMetaData);
              }),
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.redAccent,
            key: Key(this.cardMetaData.id + '_delete_btn'),
            onPressed: () {
              Navigator.pushNamed(context, '/remove_card',
                  arguments: cardMetaData);
            },
          ),
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
