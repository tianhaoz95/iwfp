import 'package:flutter/material.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class AddCardScreenErrorContent extends StatelessWidget {
  const AddCardScreenErrorContent();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ListViewItem(
            child: Center(
              child: Text('Error Adding Card'),
            ),
          ),
          ListViewItem(
            child: RaisedButton(
                child: Text('Try again'),
                onPressed: () {
                  Provider.of<DataBackend>(context, listen: false)
                      .recoverFromError();
                }),
          ),
        ],
      ),
    );
  }
}
