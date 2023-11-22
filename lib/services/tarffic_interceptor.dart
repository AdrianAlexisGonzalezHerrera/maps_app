import 'package:dio/dio.dart';

const accessToken =
    'pk.eyJ1IjoiYWRyaWFuYWxleGlzZ29uemFsZXpoZXJyZXJhIiwiYSI6ImNscDFrZW9iODBvaHAyaXJwbm9va3hmZjIifQ.rFrSpgCz_2SsmNh6nfFzXw';

class TrafficInterceptor extends Interceptor {
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
