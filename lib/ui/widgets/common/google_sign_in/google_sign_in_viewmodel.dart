import 'package:filledstacks_academy/app/app.bottomsheets.dart';
import 'package:filledstacks_academy/app/app.locator.dart';
import 'package:filledstacks_academy/enums/sign_in_result.dart';
import 'package:filledstacks_academy/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GoogleSignInViewModel extends BaseViewModel {
  final _userService = locator<UserService>();
  final _bottomSheetService = locator<BottomSheetService>();

  Future<void> signInWithGoogle() async {
    final result = await runBusyFuture(_userService.signInWithGoogle());

    if (result == SignInResult.failure) {
      await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.notice,
        title: 'Sign in failed',
        description: 'Please, try again later or contact support',
      );
    }

    // Success: perform an action here if needed
  }
}
