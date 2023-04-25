import 'package:filledstacks_academy/app/app.bottomsheets.dart';
import 'package:filledstacks_academy/app/app.dialogs.dart';
import 'package:filledstacks_academy/app/app.locator.dart';
import 'package:filledstacks_academy/app/app.router.dart';
import 'package:filledstacks_academy/ui/common/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  setPathUrlStrategy();
  setupLocator(
    stackedRouter: stackedRouter,
  );
  setupDialogUi();
  setupBottomSheetUi();
  await setupFirebase();

  runApp(const MyApp());
}

Future<void> setupFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "000000000_00000000000000000000000000000",
      authDomain: "project-id.firebaseapp.com",
      projectId: "project-id",
      storageBucket: "project-id.appspot.com",
      messagingSenderId: "000000000000",
      appId: "1:000000000000:web:0000000000000000000000",
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
        preferDesktop: true,
        builder: (_) => MaterialApp.router(
              title: 'Stacked Application',
              theme: Theme.of(context).copyWith(
                primaryColor: kcBackgroundColor,
                focusColor: kcPrimaryColor,
                textTheme: GoogleFonts.openSansTextTheme().apply(
                  bodyColor: Colors.white,
                ),
              ),
              routerDelegate: stackedRouter.delegate(),
              routeInformationParser: stackedRouter.defaultRouteParser(),
            ).animate().fadeIn(
                  delay: const Duration(milliseconds: 50),
                  duration: const Duration(milliseconds: 400),
                ));
  }
}
