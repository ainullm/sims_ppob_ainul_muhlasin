import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ainul_muhlasin/core/constants/app_configuration.dart';
import 'package:sims_ppob_ainul_muhlasin/models/transaction_model.dart';

import '../../modules/controllers/profile_controller.dart';
import '../../modules/controllers/transaction_controller.dart';
import '../../shared/utils/global_context.dart';
import '../constants/endpoints.dart';
import '../services/dio/dio_client.dart';

class TransactionRepositories {
  TransactionRepositories()
      : dioClient = DioClient(AppConfiguration.devBaseUrl);

  DioClient dioClient;

  Future<Response?> requestTopUp(Map<String, dynamic> data) async {
    try {
      var dataTopUp = <String, dynamic>{
        'top_up_amount': data['top_up_amount'],
      };

      final res =
          await dioClient.create().post(Endpoint.topup, data: dataTopUp);

      if (res.statusCode == 200) {
        final context = GlobalContext.navigatorKey.currentContext!;
        await Provider.of<ProfileController>(context, listen: false)
            .getBalance();
        await Provider.of<TransactionController>(context, listen: false)
            .loadInitialTransactions();
      } else {}
    } catch (e) {
      log('Request top up failed with error: $e');
      return Future.error(e);
    }
    return null;
  }

  Future<Response?> requestPayment(Map<String, dynamic> data) async {
    try {
      var dataTopUp = <String, dynamic>{
        'service_code': data['service_code'],
      };

      final res =
          await dioClient.create().post(Endpoint.transaction, data: dataTopUp);

      if (res.statusCode == 200) {
        final context = GlobalContext.navigatorKey.currentContext!;
        await Provider.of<ProfileController>(context, listen: false)
            .getBalance();
        await Provider.of<TransactionController>(context, listen: false)
            .loadInitialTransactions();
        Provider.of<TransactionController>(context, listen: false)
            .clearNominal();
        Navigator.pop(context);
      } else {}
    } catch (e) {
      log('Request top up failed with error: $e');
      return Future.error(e);
    }
    return null;
  }

  Future<List<Records>> getAllTransaction(
      {int? offset = 0, int limit = 3}) async {
    try {
      final res = await dioClient.create().get(
        Endpoint.transactionHistroy,
        queryParameters: {'offset': offset, 'limit': limit},
      );

      if (res.statusCode == 200) {
        // Pastikan records diambil dari datas
        final List records = res.data['data']['records'] as List;
        return records.map((e) => Records.fromJson(e)).toList();
      }
    } catch (e) {
      log('Get all transaction failed with error: $e');
      return Future.error(e);
    }
    return [];
  }
}
