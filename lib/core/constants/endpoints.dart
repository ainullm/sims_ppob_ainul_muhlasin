import 'app_configuration.dart';

class Endpoint {
  //base url
  static const API_BASE_URL = AppConfiguration.devBaseUrl;
  //auth
  static const login = '$API_BASE_URL/login';
  static const register = '$API_BASE_URL/registration';
  static const profile = '$API_BASE_URL/profile';
  static const profileUpdate = '$API_BASE_URL/profile/update';
  static const profileImage = '$API_BASE_URL/profile/image';
  static const balance = '$API_BASE_URL/balance';
  static const topup = '$API_BASE_URL/topup';
  static const transaction = '$API_BASE_URL/transaction';
  static const transactionHistroy = '$API_BASE_URL/transaction/history';
  static const banner = '$API_BASE_URL/banner';
  static const services = '$API_BASE_URL/services';
}
