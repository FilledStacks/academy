import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'payment_capture_view.form.dart';

class PaymentCaptureViewModel extends FormViewModel {
  final log = getLogger('PaymentCaptureViewModel');
  final _routerService = locator<RouterService>();

  Future<void> onAccept() async {
    log.i('Payment submited!');

    if (!isFormValid) {
      setValidationMessage('Something went wrong, please verify data entered.');
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
}
