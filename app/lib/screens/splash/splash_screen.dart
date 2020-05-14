import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/theme/base_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  Future<void> initAppData() async {
    if (Provider.of<AppTheme>(context, listen: false).needHive()) {
      await Hive.initFlutter();
    }
    await maybeNavigateToSignIn();
    await Provider.of<AppTheme>(context, listen: false).initialize();
    Navigator.pushReplacementNamed(context, '/home');
  }

  Future<void> maybeNavigateToSignIn() async {
    bool signedIn =
        await Provider.of<AppAuth>(context, listen: false).isSignedIn();
    if (!signedIn) {
      Navigator.pushReplacementNamed(context, '/sign_in');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initAppData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to 5% App'),
      ),
      body: Container(
        child: ListView(
          children: [
            LinearProgressIndicator(),
            Container(
              child: Center(
                child: Text('Loading your settings...'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
