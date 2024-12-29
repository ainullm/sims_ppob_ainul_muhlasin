import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/utils/global_context.dart';
import 'package:sims_ppob_ainul_muhlasin/routes/routes.dart';
import 'package:sizer/sizer.dart';

import 'initializer.dart';
import 'shared/style/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    debugPrint = (String? message, {int? wrapWidth}) =>
        debugPrintSynchronously(message, wrapWidth: wrapWidth);
  } else {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  if (kDebugMode) {
    runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ));
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...Initializer.initialProviders(),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: GlobalContext.navigatorKey,
          builder: DevicePreview.appBuilder,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light,
          initialRoute: AppRoutes.initial,
          routes: AppRoutes.routes,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}
