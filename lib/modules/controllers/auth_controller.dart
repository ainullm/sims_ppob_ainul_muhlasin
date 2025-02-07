import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sims_ppob_ainul_muhlasin/core/repositories/auth_repositories.dart';
import 'package:sims_ppob_ainul_muhlasin/modules/controllers/navigation_controller.dart';
import 'package:sims_ppob_ainul_muhlasin/modules/controllers/transaction_controller.dart';
import 'package:sims_ppob_ainul_muhlasin/routes/routes.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/components/app_storage.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/utils/global_context.dart';

import '../../core/constants/app_configuration.dart';
import 'profile_controller.dart';

class AuthController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isLogin = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  void clearController() {
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    isPasswordVisible = false;
    isConfirmPasswordVisible = false;
  }

  void clearEmail() {
    formKey.currentState!.fields['email']?.didChange(null);
    formKey.currentState!.fields['email']?.reset();
    emailController.clear();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  void setLogin(bool value) {
    isLogin = value;
    notifyListeners();
  }

  void loginHandle(BuildContext context, Map<String, dynamic> input) async {
    try {
      final response = await AuthRepositories().login(input);
      if (response != null && response.statusCode == 200) {
        Provider.of<NavigationController>(context, listen: false).checkToken();
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }

  Future<void> callData() async {
    try {
      final context = GlobalContext.navigatorKey.currentContext!;
      await Provider.of<ProfileController>(context, listen: false).getProfile();
      await Provider.of<ProfileController>(context, listen: false).getBalance();
      await Provider.of<TransactionController>(context, listen: false)
          .loadInitialTransactions();
      notifyListeners();
    } on DioException catch (e) {
      await handleApiError(e);
    }
  }

  Future<void> registrasiHandle(input, BuildContext context) async {
    try {
      final resp = await AuthRepositories().register(input);

      if (resp != null && resp.statusCode == 200) {
        Navigator.pushReplacementNamed(context, AppRoutes.login);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> handleApiError(DioException err) async {
    if (err.response?.statusCode == 401) {
      log('Token expired. Logging out user.');
      await logoutHandle();
    } else {
      log('Unhandled API error: ${err.message}');
    }
  }

  Future<void> logoutHandle() async {
    try {
      final context = GlobalContext.navigatorKey.currentContext!;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
      clearController();
      AppStorage.doLogout();
      await clearToken();
      Provider.of<ProfileController>(context, listen: false).clearProfile();
      Provider.of<TransactionController>(context, listen: false).clearData();
      Provider.of<NavigationController>(context, listen: false).resetIndex();
      notifyListeners();
    } catch (e) {
      log('Error during logout: $e');
    }
  }

  Future<void> clearToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(AppConfiguration.KEY_ACCESS_TOKEN);
      log('Token cleared');
    } catch (e) {
      log('Error clearing token: $e');
    }
  }
}
