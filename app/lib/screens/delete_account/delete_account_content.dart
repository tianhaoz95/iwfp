import 'package:flutter/material.dart';
import 'package:iwfpapp/screens/delete_account/account_deleted.dart';
import 'package:iwfpapp/screens/delete_account/delete_account_error.dart';
import 'package:iwfpapp/screens/delete_account/delete_account_pending.dart';
import 'package:iwfpapp/screens/delete_account/deleting_account.dart';
import 'package:iwfpapp/services/config/typedefs/data_store.dart';
import 'package:iwfpapp/services/data_backend/base.dart';
import 'package:iwfpapp/widgets/generic/unknown_error.dart';
import 'package:provider/provider.dart';

class DeleteAccountContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataBackend>(
      builder: (BuildContext context, DataBackend backend, Widget child) {
        switch (backend.getDeleteAccountStatus()) {
          case DeleteAccountStatus.PENDING:
            return DeleteAccountPending();
          case DeleteAccountStatus.DELETEING:
            return DeletingAccount();
          case DeleteAccountStatus.ERROR:
            return DeleteAccountError();
          case DeleteAccountStatus.DELETED:
            return AccountDeleted();
          default:
            return UnknownError();
        }
      },
    );
  }
}
