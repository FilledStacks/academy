import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'payment_capture_view.form.dart';

class PaymentCaptureViewModel extends FormViewModel {
  final log = getLogger('PaymentCaptureViewModel');
  final _routerService = locator<RouterService>();
  final _userService = locator<UserService>();

  bool get canAccept =>
      !hasCardExpiryValidationMessage && !hasCardCvvValidationMessage;

  Future<void> initializeForm() async {
    cardOwnerValue = _userService.currentUser.fullName;
  }

  Future<void> onAccept() async {
    log.i('Payment submited!');

    if (!isFormValid) {
      setValidationMessage(_composeValidationMessageText());
      rebuildUi();
      return;
    }

    await _routerService.navigateTo(const UserProfileViewRoute());
  }

  Future<void> onCancel() async {
    log.i('Payment cancelled!');
    clearForm();
    await _routerService.clearStackAndShow(HomeViewRoute());
  }

  String _composeValidationMessageText() {
    String output =
        'Something went wrong, please verify the following errors:\n';

    if (hasCardExpiryValidationMessage) {
      output +=
          '\n- EXPIRY value: "$cardExpiryValue". Error: $cardExpiryValidationMessage.';
    }

    if (hasCardCvvValidationMessage) {
      output +=
          '\n- CVV value: "$cardCvvValue". Error: $cardCvvValidationMessage.';
    }

    return output;
  }
}
