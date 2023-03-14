import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/services/course_service.dart';
import 'package:stacked/stacked.dart';

class CourseChapterViewModel extends BaseViewModel {
  final _courseService = locator<CourseService>();

  final String chapterId;
  final Chapter? chapter;

  CourseChapterViewModel({
    required this.chapterId,
    required this.chapter,
  });

  bool get loadingChapter => chapter == null;
}
