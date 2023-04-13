import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:stacked/stacked.dart';

class MenuOverlayViewModel extends BaseViewModel {
  final log = getLogger('MenuButtonViewModel');
  final _userService = locator<UserService>();

  Future<void> logout() async {
    log.v('');
    setBusy(true);
    await _userService.logout();
    await Future.delayed(2.seconds);
    setBusy(false);
  }
}
