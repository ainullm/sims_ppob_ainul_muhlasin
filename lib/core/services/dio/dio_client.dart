import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as dev;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sims_ppob_ainul_muhlasin/core/constants/app_configuration.dart';

import '../../../modules/controllers/navigation_controller.dart';
import '../../../modules/controllers/profile_controller.dart';
import '../../../modules/controllers/transaction_controller.dart';
import '../../../routes/routes.dart';
import '../../../shared/utils/global_context.dart';
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

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Tangani token expired
      log('Token expired. Redirecting to login.');
      await _handleTokenExpired();
      return;
    }

    super.onError(err, handler);
  }

  Future<void> _handleTokenExpired() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConfiguration.KEY_ACCESS_TOKEN);

    final context = GlobalContext.navigatorKey.currentContext!;
    Provider.of<ProfileController>(context, listen: false).clearProfile();
    Provider.of<TransactionController>(context, listen: false).clearData();
    Provider.of<NavigationController>(context, listen: false).resetIndex();

    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }
}

extension AuthRequestOptionsX on RequestOptions {
  int get retryAttempt => (extra['auth_retry_attempt'] as int?) ?? 0;
  set retryAttempt(final int attempt) => extra['auth_retry_attempt'] = attempt;
}
