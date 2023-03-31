import 'dart:async';

import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/enums/bottom_sheet_type.dart';
import 'package:filledstacked_academy/enums/sign_in_result.dart';
import 'package:filledstacked_academy/models/user/user.dart';
import 'package:filledstacked_academy/services/analytics_service.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:filledstacked_academy/ui/common/app_strings.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FormViewModel {
  final _log = getLogger('HomeViewModel');
  final _analyticsService = locator<AnalyticsService>();
  final _routerService = locator<RouterService>();
  final _userService = locator<UserService>();
  final _sheetService = locator<BottomSheetService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];

  Future<void> notifyMe() async {}

  bool get enableNotifyButton => hasEmail && isFormValid;

  bool get showValidationError =>
      hasEmail && emailValue!.length > 3 && hasEmailValidationMessage;

  bool get hasUser => _userService.hasUser;

  User get currentUser => _userService.currentUser;

  Future<void> navigateToCourse() async {
    unawaited(_analyticsService.logButtonClick(name: ksCTAHomeViewHeroImage));
    await _routerService.navigateTo(CourseLandingViewRoute(
      courseId: 'flutter-web',
    ));
  }

  Future<void> navigateToUserProfile() async {
    await _routerService.navigateTo(const UserProfileViewRoute());
  }

  Future<void> signInWithGoogle() async {
    _log.i('');

    unawaited(_analyticsService.logButtonClick(name: ksCTASignInWithGoogle));

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
