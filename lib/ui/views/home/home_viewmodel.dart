import 'dart:async';

import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/models/user/user.dart';
import 'package:filledstacked_academy/services/analytics_service.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:filledstacked_academy/ui/common/app_strings.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FormViewModel {
  final _analyticsService = locator<AnalyticsService>();
  final _routerService = locator<RouterService>();
  final _userService = locator<UserService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];

  Future<void> notifyMe() async {}

  bool get enableNotifyButton => hasEmail && isFormValid;

  bool get showValidationError => hasEmail && hasEmailValidationMessage;

  bool get hasUser => _userService.hasUser;

  User? get currentUser => _userService.currentUser;

  Future<void> navigateToCourse() async {
    unawaited(_analyticsService.logButtonClick(name: ksCTAHomeViewHeroImage));
    await _routerService.navigateToCourseLandingView(courseId: 'flutter-web');
  }

  Future<void> navigateToUserProfile() async {
    await _routerService.navigateToUserProfileView();
  }
}
