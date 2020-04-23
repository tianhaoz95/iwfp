import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/remove_promo.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class RemovePromoPending extends StatelessWidget {
  final RemovePromoMeta removePromoMeta;
  const RemovePromoPending({@required this.removePromoMeta});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListViewItem(
            child: Material(
              child: Card(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    Text('Deleting promotion'),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                              '${removePromoMeta.promo.name} (${removePromoMeta.promo.id})'),
                        )),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text('from'),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                              '${removePromoMeta.card.name} (${removePromoMeta.card.id})'),
                        )),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Warning: It cannot be recovered',
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListViewItem(
            child: Container(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: RaisedButton(
                color: Colors.redAccent,
                onPressed: () async {
                  Provider.of<DataBackend>(context, listen: false)
                      .removePromotion(PromotionRemovalRequest(
                          removePromoMeta.card.id, removePromoMeta.promo.id));
                },
                child: Text(
                  'Remove Promotion',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
