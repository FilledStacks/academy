import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:stacked/stacked.dart';

class CourseChapterViewModel extends ReactiveViewModel {
  final _userService = locator<UserService>();

  final String chapterId;
  final Chapter? chapter;

  CourseChapterViewModel({
    required this.chapterId,
    required this.chapter,
  });

  @override
  List<ListenableServiceMixin> get listenableServices => [_userService];

  bool get loadingChapter => chapter == null;

  bool get hasUser => _userService.hasUser;
}
