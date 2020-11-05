import 'package:iwfpapp/services/data_backend/http/vercel_http_data_backend.dart';

class ProductionHttpDataBackend extends VercelHttpDataBackend {
  @override
  String getBaseEndpoint() {
    return 'https://cashback-optimizer-api.vercel.app/api';
  }

  @override
  String getLoggingNamespace() {
    return 'service.data_backend.http.local_development';
  }
}
