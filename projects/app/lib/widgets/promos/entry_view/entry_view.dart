import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';
import 'package:iwfpapp/services/interfaces/credit_card.pb.dart';
import 'package:iwfpapp/services/interfaces/promotion.pbserver.dart';
import 'package:iwfpapp/widgets/promos/entry_view/edit_actions.dart';
import 'package:iwfpapp/widgets/promos/entry_view/entry_row_elt.dart';

class PromoEntries extends StatefulWidget {
  final CreditCard card;
  const PromoEntries(this.card);
  @override
  State<StatefulWidget> createState() {
    return _PromoEntries();
  }
}

class _PromoEntries extends State<PromoEntries> {
  List<bool> expandCtrl;

  @override
  void initState() {
    super.initState();
    expandCtrl = List.filled(this.widget.card.promotions.length, false);
  }

  List<ExpansionPanel> getPromoList() {
    List<ExpansionPanel> list = [];
    for (int index = 0; index < this.widget.card.promotions.length; ++index) {
      Promotion promo = this.widget.card.promotions[index];
      list.add(ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: this.expandCtrl[index],
          body: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PromoEntryRowElement(text: 'Name: ${promo.displayName}'),
              PromoEntryRowElement(text: 'ID: ${promo.id}'),
              PromoEntryRowElement(text: 'Type: ${promo.type}'),
              PromoEntryRowElement(text: 'Pattern: ${promo.repeatPattern}'),
              PromoEntryRowElement(
                  text: 'Period: ${promo.startDate}~${promo.endDate}'),
              PromoEntryRowElement(text: 'Rate: ${promo.rate.toString()}%'),
              PromoEntryRowElement(
                  text: 'Category Name: ${promo.category.displayName}'),
              PromoEntryRowElement(text: 'Category ID: ${promo.category.id}'),
              PromoEntryEditActions(
                onDeleteTappedHandler: () {
                  Navigator.pushNamed(context, '/remove_promo',
                      arguments: RemovePromoMeta(this.widget.card, promo));
                },
                onEditTappedHandler: () {
                  Navigator.pushNamed(context, '/placeholder');
                },
              )
            ],
          )),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              child: Center(child: Text('${promo.displayName}')),
            );
          }));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              this.expandCtrl[index] = !this.expandCtrl[index];
            });
          },
          children: getPromoList(),
        ));
  }
}
