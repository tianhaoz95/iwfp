import 'package:flutter/material.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/services/utilities/card_templates/template_getter.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class AddFromTemplateCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListViewItem(
            child: Center(
              child: Text('Add from Template'),
            ),
          ),
          Divider(),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                  child: Text('Pending'),
                  onPressed: () {
                    Provider.of<DataBackend>(
                      context,
                      listen: false,
                    ).status = DataBackendStatus.AVAILABLE;
                    Provider.of<DataBackend>(
                      context,
                      listen: false,
                    ).creditCardTemplates = getLocalCreditCardTemplates();
                    Navigator.pushNamed(context, '/add_card_from_template');
                  }),
            ),
          ),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                  child: Text('Error'),
                  onPressed: () {
                    Provider.of<DataBackend>(
                      context,
                      listen: false,
                    ).status = DataBackendStatus.ERROR;
                    Navigator.pushNamed(context, '/add_card_from_template');
                  }),
            ),
          ),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                  child: Text('Completed'),
                  onPressed: () {
                    Provider.of<DataBackend>(
                      context,
                      listen: false,
                    ).status = DataBackendStatus.OUTDATED;
                    Navigator.pushNamed(context, '/add_card_from_template');
                  }),
            ),
          ),
          ListViewItem(
            child: Material(
              child: RaisedButton(
                  child: Text('Loading'),
                  onPressed: () {
                    Provider.of<DataBackend>(
                      context,
                      listen: false,
                    ).status = DataBackendStatus.LOADING;
                    Navigator.pushNamed(context, '/add_card_from_template');
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
