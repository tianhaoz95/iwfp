import 'package:flutter/material.dart';
import 'package:iwfpapp/widgets/icons/iwfpapp_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutGitHubRepository extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () async {
        String url = 'https://github.com/tianhaoz95/iwfp';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          print('launch ${url} failed');
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            child: Icon(Iwfpapp.mark_github),
          ),
          Text('Checkout the repository'),
        ],
      ),
    );
  }
}
