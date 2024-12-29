import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sims_ppob_ainul_muhlasin/core/constants/app_configuration.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/utils/global_context.dart';
import 'package:sims_ppob_ainul_muhlasin/modules/controllers/profile_controller.dart';
import 'package:sims_ppob_ainul_muhlasin/routes/routes.dart';

import '../../shared/components/app_storage.dart';
import '../constants/endpoints.dart';
import '../services/dio/dio_client.dart';

class AuthRepositories {
  AuthRepositories() : dioClient = DioClient(AppConfiguration.devBaseUrl);

  DioClient dioClient;

  Future<Response?> login(Map<String, dynamic> data) async {
    try {
      var dataLogin = <String, dynamic>{
        'email': data['email'],
        'password': data['password'],
      };

      final res =
          await dioClient.create().post(Endpoint.login, data: dataLogin);

      if (res.statusCode == 200) {
        await saveToken(res.data);
        log('Login success with status code: ${res.statusCode}');

        return res;
      } else {
        log('Login failed with status code: ${res.statusCode}');
        return Future.error(res);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Response?> register(Map<String, dynamic> data) async {
    try {
      var dataRegister = <String, dynamic>{
        'email': data['email'],
        'first_name': data['first_name'],
        'last_name': data['last_name'],
        'password': data['password'],
      };

      final res =
          await dioClient.create().post(Endpoint.register, data: dataRegister);

      if (res.statusCode == 200) {
        log('Register success with status code: ${res.statusCode}');
        return res;
      } else {
        log('Register failed with status code: ${res.statusCode}');
        return Future.error(res);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> saveToken(data) async {
    String accessToken = data?['data']['token'];
    log('Access Token: $accessToken');
    AppStorage.saveToken(accessToken: accessToken);

    return true;
  }
}
