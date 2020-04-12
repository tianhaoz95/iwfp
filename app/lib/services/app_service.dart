import 'package:flutter/foundation.dart';
import 'package:iwfpapp/services/app_auth/base.dart';
import 'package:iwfpapp/services/app_context/interface.dart';
import 'package:iwfpapp/services/data_backend/base.dart';

class AppService extends ChangeNotifier {
  final AppAuth appAuth;
  final AppContext appContext;
  final DataBackend dataBackend;
  AppService({
    @required this.appAuth,
    @required this.appContext,
    @required this.dataBackend,
  }): super();
}