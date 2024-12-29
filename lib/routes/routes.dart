import 'package:flutter/material.dart';
import 'package:sims_ppob_ainul_muhlasin/modules/views/auth/login_view.dart';
import 'package:sims_ppob_ainul_muhlasin/modules/views/auth/register_view.dart';

import '../modules/views/navigation/navigation_view.dart';
import '../modules/views/profile/profile_edit_view.dart';
import '../modules/views/splash/splash_view.dart';
import '../modules/views/transaction/payment_transaction_view.dart';

class AppRoutes {
  static const String initial = '/';
  static const String login = '/login';
  static const String registrasi = '/registrasi';
  static const String navigation = '/navigation';
  static const String payment = '/payment';
  static const String profileEdit = '/profile-edit';

  static Map<String, WidgetBuilder> routes = {
    initial: (context) => const SplashView(),
    login: (context) => const LoginView(),
    registrasi: (context) => const RegisterView(),
    navigation: (context) => const NavigationView(),
    payment: (context) => const PaymentTransactionView(),
    profileEdit: (context) => const ProfileEditView(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );

      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case registrasi:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );
      case navigation:
        return MaterialPageRoute(
          builder: (_) => const NavigationView(),
        );
      case payment:
        return MaterialPageRoute(
          builder: (_) => const PaymentTransactionView(),
        );
      case profileEdit:
        return MaterialPageRoute(
          builder: (_) => const ProfileEditView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
