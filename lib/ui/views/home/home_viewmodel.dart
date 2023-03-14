import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends FormViewModel {
  final log = getLogger('HomeViewModel');
  final _routerService = locator<RouterService>();

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
}
