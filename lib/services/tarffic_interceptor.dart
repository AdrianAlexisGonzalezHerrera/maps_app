import 'package:dio/dio.dart';

class TrafficInterceptor extends Interceptor {
  final accessToken =
      'pk.eyJ1IjoiYWRyaWFuYWxleGlzZ29uemFsZXpoZXJyZXJhIiwiYSI6ImNscDFrZW9iODBvaHAyaXJwbm9va3hmZjIifQ.rFrSpgCz_2SsmNh6nfFzXw';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken,
    });

    super.onRequest(options, handler);
  }
}
