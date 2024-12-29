import 'package:flutter/foundation.dart';
import 'package:sims_ppob_ainul_muhlasin/models/balance_model.dart';
import 'package:sims_ppob_ainul_muhlasin/models/user_model.dart';

import '../../core/repositories/profile_repositories.dart';

class ProfileController extends ChangeNotifier {
  UserModel? profile;
  BalanceModel? balance;

  bool? isVisibleBalance = false;

  void changeVisibilityBalance() {
    isVisibleBalance = !isVisibleBalance!;
    notifyListeners();
  }

  void clearProfile() {
    profile = null;
    notifyListeners();
  }

  Future<void> getProfile() async {
    try {
      profile = await ProfileRepositories().getProfile();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getBalance() async {
    try {
      balance = await ProfileRepositories().getBalance();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
