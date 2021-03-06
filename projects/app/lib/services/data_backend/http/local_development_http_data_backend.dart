import 'package:iwfpapp/services/data_backend/http/vercel_http_data_backend.dart';

class LocalDevelopmentHttpDataBackend extends VercelHttpDataBackend {
  @override
  String getBaseEndpoint() {
    return 'http://localhost:3000/api';
  }

  @override
  String getLoggingNamespace() {
    return 'service.data_backend.http.local_development';
  }
}
