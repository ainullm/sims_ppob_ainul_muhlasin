import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:developer' as dev;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sims_ppob_ainul_muhlasin/core/constants/app_configuration.dart';

import '../../constants/custom_dio.dart';

class DioClient {
  DioClient(this._baseUrl);

  final String _baseUrl;

  Dio create() {
    return CustomDio(_baseUrl).create()
      ..interceptors.addAll([ApiInterceptor()]);
  }
}

class ApiInterceptor extends Interceptor {
  final int retries = 1;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      String? platform;
      if (Platform.isAndroid) {
        platform = 'android';
      } else if (Platform.isIOS) {
        platform = 'ios';
      }

      if (platform != null) {
        options.headers.putIfAbsent('x-client-platform', () => platform);
      }
      var accessToken = await SharedPreferences.getInstance()
          .then((pref) => pref.getString(AppConfiguration.KEY_ACCESS_TOKEN));
      if (accessToken != null) {
        options.headers.putIfAbsent(
            HttpHeaders.authorizationHeader, () => 'Bearer $accessToken');
      }
      super.onRequest(options, handler);
    } catch (e) {
      dev.log('ApiInterceptor, error: $e');
    }
  }

  // @override
  // Future<void> onError(DioException err, ErrorInterceptorHandler handler,
  //     BuildContext context) async {
  //   if (err.response?.statusCode == 401) {
  //     // Unauthorized
  //     Navigator.pushReplacementNamed(context, AppRoutes.login);
  //     return super.onError(err, handler);
  //   }

  //   final attempt = err.requestOptions._retryAttempt + 1;
  //   if (attempt > retries) return super.onError(err, handler);

  //   try {
  //     final dio = const CustomDio(AppConfiguration.devBaseUrl).create();
  //     final pref = await SharedPreferences.getInstance();
  //     var refreshToken = pref.get(AppConfiguration.KEY_ACCESS_TOKEN);
  //     if (refreshToken == null) return super.onError(err, handler);
  //     dio.options.headers['Authorization'] = 'Bearer $refreshToken';
  //     final response = await dio.get('/auth/refresh-token');

  //     if (response.statusCode == 200) {
  //       String accessToken =
  //           response.data?['data'][AppConfiguration.KEY_ACCESS_TOKEN];
  //       await pref.setString(AppConfiguration.KEY_ACCESS_TOKEN, accessToken);

  //       final options = err.requestOptions
  //         ..headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
  //       final newResponse = await dio.fetch<void>(options);
  //       return handler.resolve(newResponse);
  //     }
  //   } on DioException catch (e) {
  //     dev.log(
  //         'ApiInterceptor, error refresh token: ${e.response?.statusCode} ${e.response}');
  //   }

  //   super.onError(err, handler);
  // }
}

extension AuthRequestOptionsX on RequestOptions {
  int get retryAttempt => (extra['auth_retry_attempt'] as int?) ?? 0;
  set retryAttempt(final int attempt) => extra['auth_retry_attempt'] = attempt;
}
