import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sims_ppob_ainul_muhlasin/modules/controllers/auth_controller.dart';
import 'package:sims_ppob_ainul_muhlasin/modules/views/loading/loading_view.dart';

import '../../core/constants/app_configuration.dart';
import '../../routes/routes.dart';
import '../../shared/utils/global_context.dart';

class NavigationController extends ChangeNotifier {
  NavigationController() {
    log('NavigationController initialized');
    checkToken();
  }

  int currentIndex = 0;
  int currentPage = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(AppConfiguration.KEY_ACCESS_TOKEN);

    // Navigasi ke halaman loading
    GlobalContext.navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (_) => const LoadingPage()),
    );

    if (token != null) {
      try {
        await Provider.of<AuthController>(
          GlobalContext.navigatorKey.currentContext!,
          listen: false,
        ).callData();

        GlobalContext.navigatorKey.currentState
            ?.pushReplacementNamed(AppRoutes.navigation);
      } catch (e) {
        GlobalContext.navigatorKey.currentState
            ?.pushReplacementNamed(AppRoutes.login);
      }
    } else {
      GlobalContext.navigatorKey.currentState
          ?.pushReplacementNamed(AppRoutes.login);
    }
  }

  Future<void> navigateToNext(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, AppRoutes.login);
    currentPage = 1;
    notifyListeners();
  }

  void resetIndex() {
    currentIndex = 0;
    notifyListeners();
  }
}
