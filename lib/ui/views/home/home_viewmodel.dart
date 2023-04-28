import 'package:filledstacks_academy/app/app.locator.dart';
import 'package:filledstacks_academy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  Future<void> navigateToCourse() async {
    await _routerService.navigateToCourseLandingView();
  }
}
