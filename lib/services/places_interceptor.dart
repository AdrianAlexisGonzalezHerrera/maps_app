import 'package:dio/dio.dart';

class PlacesInterceptor extends Interceptor {
  final accessToken =
      'pk.eyJ1IjoiYWRyaWFuYWxleGlzZ29uemFsZXpoZXJyZXJhIiwiYSI6ImNscDFrZW9iODBvaHAyaXJwbm9va3hmZjIifQ.rFrSpgCz_2SsmNh6nfFzXw';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'access_token': accessToken,
      'language': 'es',
      'limit': 7,
    });
    super.onRequest(options, handler);
  }
}
