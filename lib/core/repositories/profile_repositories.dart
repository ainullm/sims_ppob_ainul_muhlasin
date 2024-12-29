import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sims_ppob_ainul_muhlasin/core/constants/app_configuration.dart';
import 'package:sims_ppob_ainul_muhlasin/models/balance_model.dart';
import 'package:sims_ppob_ainul_muhlasin/models/user_model.dart';

import '../constants/endpoints.dart';
import '../services/dio/dio_client.dart';

class ProfileRepositories {
  ProfileRepositories() : dioClient = DioClient(AppConfiguration.devBaseUrl);

  DioClient dioClient;

  Future<UserModel?> getProfile() async {
    try {
      final res = await dioClient.create().get(Endpoint.profile);

      if (res.statusCode == 200) {
        log('Data: ${res.data['data']}');
        return UserModel.fromJson(res.data['data']);
      } else {}
    } catch (e) {
      log('Get profile failed with error: $e');
      return Future.error(e);
    }
    return null;
  }

  Future<BalanceModel?> getBalance() async {
    try {
      final res = await dioClient.create().get(Endpoint.balance);

      if (res.statusCode == 200) {
        log('Data: ${res.data['data']}');
        return BalanceModel.fromJson(res.data['data']);
      } else {}
    } catch (e) {
      log('Get balance failed with error: $e');
      return Future.error(e);
    }
    return null;
  }
}
