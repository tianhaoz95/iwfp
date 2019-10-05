import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/buttons/login_btn.dart';
import 'package:iwfpapp/widgets/buttons/glogin_btn.dart';

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
            LoginButton(
              onPressedCallback: () { Navigator.pushNamed(context, '/main'); },
            ),
            SizedBox(height: 25.0),
            GLoginButton(
              onPressedCallback: () { Navigator.pushNamed(context, '/main'); },
            ),
          ],
        ),
      )
    );
  }
}