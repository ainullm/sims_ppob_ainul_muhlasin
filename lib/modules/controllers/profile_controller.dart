import 'package:flutter/material.dart';
import 'package:sims_ppob_ainul_muhlasin/models/balance_model.dart';
import 'package:sims_ppob_ainul_muhlasin/models/user_model.dart';

import '../../core/repositories/profile_repositories.dart';

class ProfileController extends ChangeNotifier {
  ProfileController() {
    firstNameController.addListener(checkCompletedEdit);
    lastNameController.addListener(checkCompletedEdit);
  }
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  UserModel? profile;
  BalanceModel? balance;

  bool? isVisibleBalance = false;

  bool? isEditComplete = false;

  void changeVisibilityBalance() {
    isVisibleBalance = !isVisibleBalance!;
    notifyListeners();
  }

  void clearProfile() {
    profile = null;
    notifyListeners();
  }

  void clearController() {
    firstNameController.clear();
    lastNameController.clear();
  }

  void checkCompletedEdit() {
    final isComplete = firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty;

    if (isEditComplete != isComplete) {
      isEditComplete = isComplete;
      notifyListeners(); // Beritahu perubahan hanya jika status berubah
    }
  }

  Future<void> getProfile() async {
    try {
      profile = await ProfileRepositories().getProfile();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateProfile(Map<String, dynamic> data) async {
    try {
      await ProfileRepositories().updateProfile(data);
      clearController();
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
