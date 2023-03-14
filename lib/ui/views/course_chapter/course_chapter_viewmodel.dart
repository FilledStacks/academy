import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/services/course_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CourseChapterViewModel extends FutureViewModel<Chapter> {
  final _courseService = locator<CourseService>();
  final _routerService = locator<RouterService>();

  final String chapterId;
  final Chapter? chapter;

  CourseChapterViewModel({
    required this.chapterId,
    this.chapter,
  });

  bool get loadingChapter => chapter == null;

  @override
  Future<Chapter> futureToRun() {
    return Future.value();
  }
}
