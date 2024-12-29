import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes/routes.dart';

class NavigationController extends ChangeNotifier {
  int currentIndex = 0;
  int currentPage = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Future<void> navigateToNext(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
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
