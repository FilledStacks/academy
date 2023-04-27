import 'package:filledstacks_academy/app/app.locator.dart';
import 'package:filledstacks_academy/app/app.router.dart';
import 'package:filledstacks_academy/services/native_interactions/native_interaction_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _nativeInteractionService = locator<NativeInteractionService>();

  Future<void> navigateToCourse() async {
    // _nativeInteractionService.openPopup();
    await _routerService.navigateToCourseLandingView();
  }
}
