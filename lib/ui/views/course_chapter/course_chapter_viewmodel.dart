import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/enums/bottom_sheet_type.dart';
import 'package:filledstacked_academy/enums/sign_in_result.dart';
import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/services/course_service.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CourseChapterViewModel extends BaseViewModel {
  final _courseService = locator<CourseService>();
  final _userService = locator<UserService>();
  final _sheetService = locator<BottomSheetService>();

  final String chapterId;
  final Chapter? chapter;

  CourseChapterViewModel({
    required this.chapterId,
    required this.chapter,
  });

  bool get loadingChapter => chapter == null;

  bool get hasUser => _userService.hasUser;

  Future<void> signInWithGoogle() async {
    final result = await runBusyFuture(_userService.signInWithGoogle());

    if (result == SignInResult.failure) {
      await _sheetService.showCustomSheet(
        variant: BottomSheetType.notice,
        title: 'Sign in failed',
        description: 'Please, try again later or contact support.',
      );

      return;
    }
  }
}
