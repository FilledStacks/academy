import 'package:filledstacks_academy/app/app.locator.dart';
import 'package:filledstacks_academy/services/user_service.dart';
import 'package:filledstacks_academy/ui/views/payment_capture/payment_capture_view.form.dart';
import 'package:stacked/stacked.dart';

class PaymentCaptureViewModel extends FormViewModel {
  final _userService = locator<UserService>();

  void initializeForm() {
    cardOwnerValue = _userService.currentUser?.fullName;
  }

  Future<void> submitData() async {
    if (hasCardCvvValidationMessage || hasCardExpiryValidationMessage) {
      return;
    }

    // Commented because _api does NOT exist
    // _api.submitCard(
    //   name: cardOwnerValue,
    //   cardNumber: cardNumberValue,
    //   expiry: cardExpiryValue,
    //   cvv: cardCvvValue,
    // );
  }
}
