import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/buttons/login_btn.dart';
import 'package:iwfpapp/widgets/buttons/glogin_btn.dart';
import 'package:iwfpapp/widgets/buttons/guest_login_btn.dart';

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 15.0),
              Image.asset(
                'assets/iwfp_splash.png',
                key: Key('iwfp_splash_img'),
              ),
              SizedBox(height: 25.0),
              TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: 'username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)))),
              SizedBox(height: 25.0),
              TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: 'password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)))),
              SizedBox(height: 25.0),
              LoginButton(
                onPressedCallback: () {
                  Navigator.pushNamed(context, '/placeholder');
                },
              ),
              SizedBox(height: 25.0),
              GuestLoginButton(
                onPressedCallback: () {
                  Navigator.pushNamed(context, '/main');
                },
              ),
              SizedBox(height: 25.0),
              GLoginButton(
                onPressedCallback: () {
                  Navigator.pushNamed(context, '/placeholder');
                },
              ),
            ],
          ),
        ));
  }
}
