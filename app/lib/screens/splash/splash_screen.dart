import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:iwfpapp/services/app_auth/base_auth.dart';
import 'package:iwfpapp/services/app_context/base_app_context.dart';
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
    if (Provider.of<AppContext>(context, listen: false).needRemoteConfig()) {
      print('set up remote config');
      RemoteConfig remoteConfig = await RemoteConfig.instance;
      await remoteConfig.fetch(expiration: const Duration(hours: 6));
      await remoteConfig.activateFetched();
    }
    await Provider.of<AppTheme>(context, listen: false).initialize();
    await maybeNavigateToSignIn();
    if (Provider.of<AppContext>(context, listen: false).getAllowDynamicLink()) {
      await maybeUseDynamicLink();
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  Future<void> maybeNavigateToSignIn() async {
    bool signedIn =
        await Provider.of<AppAuth>(context, listen: false).isSignedIn();
    if (!signedIn) {
      Navigator.pushReplacementNamed(context, '/sign_in');
    }
  }

  Future<void> maybeUseDynamicLink() async {
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      Navigator.pushReplacementNamed(context, deepLink.path);
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;
      if (deepLink != null) {
        Navigator.pushReplacementNamed(context, deepLink.path);
      } else {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }, onError: (OnLinkErrorException err) async {
      print('Handle dynamic link failed');
      print(err.message);
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initAppData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Container(
              child: Center(
                child: Text(
                  '5% App',
                  style: TextStyle(fontSize: 32.0),
                ),
              ),
            ),
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
