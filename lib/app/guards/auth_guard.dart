import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:stacked/stacked.dart';

class AuthGuard extends StackedRouteGuard {
  @override
  Future<void> onNavigation(resolver, router) async {
    final _userService = locator<UserService>();

    if (!_userService.hasFirebaseUser) {
      router.push(const UnknownViewRoute());
      return;
    }

    resolver.next(true);
  }
}
