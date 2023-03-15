import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/setup/setup_bottom_sheet_ui.dart';
import 'package:filledstacked_academy/ui/setup/setup_dialog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/app.router.dart';

Future<void> main() async {
  setPathUrlStrategy();
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();

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
            primaryColor: kcBackgroundColor,
            focusColor: kcPrimaryColor,
            textTheme: GoogleFonts.openSansTextTheme(
              Theme.of(context).textTheme,
            ).apply(
              bodyColor: Colors.white,
            ),
          ),
          routerDelegate: stackedRouter.delegate(),
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
