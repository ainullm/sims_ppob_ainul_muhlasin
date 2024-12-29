import 'package:provider/provider.dart';
import 'package:sims_ppob_ainul_muhlasin/modules/controllers/profile_controller.dart';

import 'modules/controllers/auth_controller.dart';
import 'modules/controllers/navigation_controller.dart';
import 'modules/controllers/transaction_controller.dart';

class Initializer {
  static List initialProviders() {
    return [
      ChangeNotifierProvider(create: (_) => AuthController()),
      ChangeNotifierProvider(create: (_) => NavigationController()),
      ChangeNotifierProvider(create: (_) => TransactionController()),
      ChangeNotifierProvider(create: (_) => ProfileController()),
    ];
  }
}
