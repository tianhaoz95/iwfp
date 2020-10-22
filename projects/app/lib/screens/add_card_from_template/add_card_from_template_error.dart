import 'package:flutter/material.dart';
import 'package:iwfpapp/services/data_backend/base_data_backend.dart';
import 'package:iwfpapp/widgets/layouts/listview_item.dart';
import 'package:provider/provider.dart';

class AddCardFromTemplateError extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddCardFromTemplateError();
  }
}

class _AddCardFromTemplateError extends State<AddCardFromTemplateError> {
  int count;

  @override
  void initState() {
    super.initState();
    this.count = 5;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    countDown();
  }

  Future<void> countDown() async {
    for (int i = 0; i < 5; ++i) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        ListViewItem(
          child: Material(
            child: Card(
              child: Container(
                  child: Center(
                      child: Text(
                'Error using template',
              ))),
            ),
          ),
        ),
        ListViewItem(
          child: Center(
            child: this.count == 0
                ? Text('Click the button below to retry')
                : Text('Wait for ' + this.count.toString() + ' and try again'),
          ),
        ),
        ListViewItem(
            child: RaisedButton(
                child: Text('Try again'),
                onPressed: this.count == 0
                    ? () {
                        Provider.of<DataBackend>(context, listen: false)
                            .recoverFromError();
                      }
                    : null)),
      ],
    ));
  }
}
