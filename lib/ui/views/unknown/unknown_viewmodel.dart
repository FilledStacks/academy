import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UnknownViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  Future<void> navigateToHome() async {
    await _routerService.navigateTo(HomeViewRoute());
  }
}
