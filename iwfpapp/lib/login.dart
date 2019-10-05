import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      backgroundColor: Colors.blue[100],
      body: Container(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0)
                )
              )
            ),
            SizedBox(height: 25.0),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0)
                )
              )
            ),
            SizedBox(height: 25.0),
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.blue,
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: () { Navigator.pushNamed(context, '/main'); },
                child: Text('login',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white)
                )
              )
            )
          ],
        ),
      )
    );
  }
}