import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/enums/sign_in_result.dart';
import 'package:filledstacked_academy/services/http_service.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FormViewModel {
  final log = getLogger('HomeViewModel');
  final _routerService = locator<RouterService>();
  final httpService = locator<HttpService>();
  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();

  Future<void> notifyMe() async {}

  bool get enableNotifyButton => hasEmail && isFormValid;

  bool get showValidationError =>
      hasEmail && emailValue!.length > 3 && hasEmailValidationMessage;

  Future<void> navigateToCourse() async {
    await _routerService.navigateTo(CourseDetailsViewRoute(
      courseId: 'flutter-web',
      children: List.from(
        [
          CourseChapterViewRoute(
            chapterId: 'readme',
          )
        ],
      ),
    ));
  }

  Future<void> signInWithGoogle() async {
    final result = await _userService.signInWithGoogle();

    if (result == SignInResult.failure) {
      // TODO: show sign in error
      return;
    }
  }
}
