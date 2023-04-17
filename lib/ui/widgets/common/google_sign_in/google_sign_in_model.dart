import 'dart:async';

import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/enums/bottom_sheet_type.dart';
import 'package:filledstacked_academy/enums/sign_in_result.dart';
import 'package:filledstacked_academy/services/analytics_service.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:filledstacked_academy/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GoogleSignInModel extends BaseViewModel {
  final log = getLogger('GoogleSignInModel');
  final _analyticsService = locator<AnalyticsService>();
  final _sheetService = locator<BottomSheetService>();
  final _userService = locator<UserService>();

  /// CTA name for Analytics
  final String eventName;
  GoogleSignInModel({
    this.eventName = ksCTASignInWithGoogle,
  });

  Future<void> signInWithGoogle() async {
    log.i('');

    unawaited(_analyticsService.logButtonClick(name: eventName));

    final result = await runBusyFuture(_userService.signInWithGoogle());

    if (result == SignInResult.failure) {
      await _sheetService.showCustomSheet(
        variant: BottomSheetType.notice,
        title: 'Sign in failed',
        description: 'Please, try again later or contact support',
      );

      return;
    }
  }
}
