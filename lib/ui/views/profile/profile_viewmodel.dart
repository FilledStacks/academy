import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/models/user/user.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final _log = getLogger('ProfileViewModel');
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  User get currentUser =>
      _userService.hasUser ? _userService.currentUser : User.empty();

  Future<void> logout() async {
    _log.i('');

    await _userService.logout();
    _navigationService.navigateToHomeView();
  }
}
