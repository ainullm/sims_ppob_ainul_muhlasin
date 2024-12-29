import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ainul_muhlasin/core/constants/app_configuration.dart';
import 'package:sims_ppob_ainul_muhlasin/models/balance_model.dart';
import 'package:sims_ppob_ainul_muhlasin/models/user_model.dart';

import '../../modules/controllers/profile_controller.dart';
import '../../shared/utils/global_context.dart';
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

  Future<Response?> updateProfile(Map<String, dynamic> data) async {
    try {
      var dataUpdate = <String, dynamic>{
        'first_name': data['first_name'],
        'last_name': data['last_name'],
      };
      final res = await dioClient
          .create()
          .put(Endpoint.profileUpdate, data: dataUpdate);

      if (res.statusCode == 200) {
        final context = GlobalContext.navigatorKey.currentContext!;
        await Provider.of<ProfileController>(context, listen: false)
            .getProfile();
        Navigator.pop(context);
        return res;
      } else {}
    } catch (e) {
      log('Update profile failed with error: $e');
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
