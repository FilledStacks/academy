import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/models/user/user.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserProfileViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _userService = locator<UserService>();

  bool get hasUser => _userService.hasUser;
  User? get currentUser => _userService.currentUser;

  Future<void> navigateToPaymentCapture() async {
    await _routerService.navigateToPaymentCaptureView();
  }

  Future<void> goBack() async {
    await _routerService.clearStackAndShow(HomeViewRoute());
  }
}
