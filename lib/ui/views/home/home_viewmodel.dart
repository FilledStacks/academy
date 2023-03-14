import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/services/http_service.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FormViewModel {
  final log = getLogger('HomeViewModel');
  final httpService = locator<HttpService>();
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();

  Future<void> notifyMe() async {
    await runBusyFuture(httpService.addEmail(emailValue!));
    clearForm();
  }

  Future<void> login() async {
    await _userService.login(email: 'fernando@academy.com', password: '123456');
    _navigationService.navigateToProfileView();
  }

  bool get enableNotifyButton => hasEmail && isFormValid;

  bool get showValidationError =>
      hasEmail && emailValue!.length > 3 && hasEmailValidationMessage;
}
