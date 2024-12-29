import 'package:shared_preferences/shared_preferences.dart';
import 'package:sims_ppob_ainul_muhlasin/core/constants/app_configuration.dart';

class AppStorage {
  // static const String _token = 'token';
  static const String _login = 'login';
  static bool isAuthenticated = false;

  static Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      isAuthenticated = isLoggedIn(prefs);
      if (isAuthenticated) {
        // ProfileController.to.getProfile();
      } else {
        await prefs.clear(); // Clear all data in case of an error
      }
    } catch (e) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // Clear all data in case of an error
    }
  }

  static bool getBool(String key, SharedPreferences prefs) {
    return prefs.getBool(key) ?? false;
  }

  static String? getString(String key, SharedPreferences prefs) {
    return prefs.getString(key);
  }

  static int? getInt(String key, SharedPreferences prefs) {
    return prefs.getInt(key);
  }

  static Future<void> save(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else {
      throw Exception('Unsupported type');
    }
  }

  static Future<void> removeKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConfiguration.KEY_ACCESS_TOKEN);
  }

  static bool isLoggedIn(SharedPreferences prefs) {
    return getBool(_login, prefs);
  }

  static Future<void> saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    isAuthenticated = true;
    await prefs.setBool(_login, true);
  }

  static Future<void> saveToken({
    required String accessToken,
  }) async {
    await save(AppConfiguration.KEY_ACCESS_TOKEN, accessToken);
    await saveLogin();
  }

  static Future<void> doLogout() async {
    final prefs = await SharedPreferences.getInstance();
    isAuthenticated = false;
    await prefs.clear();
  }
}
