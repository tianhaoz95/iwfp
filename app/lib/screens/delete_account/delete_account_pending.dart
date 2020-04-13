import 'package:flutter/material.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:provider/provider.dart';

class DeleteAccountPending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          Material(
            child: Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    child: Center(
                      child: Text('Are you sure?'),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    child: Center(
                      child: Text('Once delete, it cannot be recovered'),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: RaisedButton(
              onPressed: () {
                Provider.of<DataBackend>(context, listen: false).deleteAccount();
              },
              color: Colors.redAccent,
              child: Text(
                'Yes, delete!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}