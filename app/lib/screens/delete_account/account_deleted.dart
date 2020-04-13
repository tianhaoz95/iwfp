import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:provider/provider.dart';

class AccountDeleted extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccountDeleted();
  }
}

class _AccountDeleted extends State<AccountDeleted> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    signOutAndNavigateToAuth();
  }

  Future<void> signOutAndNavigateToAuth() async {
    await Provider.of<AppAuth>(context, listen: false).signOut(silent: true);
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacementNamed(context, '/sign_in');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [Text('account deleted.')],
      ),
    );
  }
}
