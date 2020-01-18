import 'package:flutter/material.dart';
import 'package:iwfpapp/services/auth.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/config/typedefs/home_tab_id.dart';
import 'package:iwfpapp/services/config/typedefs/submission_screen_status.dart';
import 'package:iwfpapp/services/data_store.dart';

class DeleteAccountScreen extends StatefulWidget {
  final DataStore dataStore;
  final IwfpappAuth auth;
  const DeleteAccountScreen(this.dataStore, this.auth);
  @override
  _DeleteAccountScreen createState() {
    return _DeleteAccountScreen();
  }
}

class _DeleteAccountScreen extends State<DeleteAccountScreen> {
  SubmitScreenStatus status = SubmitScreenStatus.PENDING;

  Future<void> handleDeleteAccount(BuildContext context) async {
    setState(() {
      status = SubmitScreenStatus.LOADING;
    });
    BackendResponse deleteAccountResponse =
        await widget.dataStore.deleteAccount();
    if (deleteAccountResponse.status == ResponseStatus.SUCCEESS) {
      setState(() {
        status = SubmitScreenStatus.DONE;
      });
      await widget.auth.handleSignOut();
      Navigator.pushReplacementNamed(context, '/sign_in');
    } else {
      setState(() {
        status = SubmitScreenStatus.ERROR;
      });
    }
  }

  Widget renderPendingContent(BuildContext context) {
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
                handleDeleteAccount(context);
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

  Widget renderUnknownContent(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Unknown Error',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget renderDoneContent(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Account Deleted, Navigating...',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget renderErrorContent(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Error',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget renderLoadingContent(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget renderContent(BuildContext context) {
    Widget content = renderPendingContent(context);
    switch (status) {
      case SubmitScreenStatus.PENDING:
        content = renderPendingContent(context);
        break;
      case SubmitScreenStatus.LOADING:
        content = renderLoadingContent(context);
        break;
      case SubmitScreenStatus.ERROR:
        content = renderErrorContent(context);
        break;
      case SubmitScreenStatus.DONE:
        content = renderDoneContent(context);
        break;
      default:
        content = renderUnknownContent(context);
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Account?'),
        leading: FlatButton(
          key: Key('delete_account_back_btn'),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/',
                arguments: HomeTabId.USER_SETTINGS);
          },
        ),
      ),
      body: renderContent(context),
    );
  }
}
