import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/services/analytics_service.dart';
import 'package:filledstacked_academy/services/environment_service.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/setup/setup_bottom_sheet_ui.dart';
import 'package:filledstacked_academy/ui/setup/setup_dialog_ui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: EnvironmentService.apiKey,
      appId: EnvironmentService.appId,
      authDomain: EnvironmentService.authDomain,
      messagingSenderId: EnvironmentService.messagingSenderId,
      projectId: EnvironmentService.projectId,
      storageBucket: EnvironmentService.storageBucket,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      preferDesktop: true,
      builder: (context) {
        return MaterialApp.router(
          title: 'FilledStacks Academy',
          theme: Theme.of(context).copyWith(
            focusColor: kcPrimaryColor,
            primaryColor: kcBackgroundColor,
            scaffoldBackgroundColor: Colors.transparent,
            textTheme: GoogleFonts.openSansTextTheme(
              Theme.of(context).textTheme,
            ).apply(
              bodyColor: Colors.white,
            ),
          ),
          routerDelegate: stackedRouter.delegate(
            navigatorObservers: () => [
              locator<AnalyticsService>().getAnalyticsObserver(),
            ],
          ),
          routeInformationParser: stackedRouter.defaultRouteParser(),
        )
            .animate()
            .moveY(end: 0, begin: 35)
            .fadeIn(
              duration: const Duration(milliseconds: 500),
              delay: const Duration(milliseconds: 50),
            )
            .scale(
              begin: const Offset(0.9, 0.9),
              end: const Offset(1, 1),
              curve: Curves.easeInOut,
            );
      },
    );
  }
}
