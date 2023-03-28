import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/services/course_service.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CourseLandingViewModel extends FutureViewModel {
  final log = getLogger('CourseLandingViewModel');
  final _courseService = locator<CourseService>();
  final _routerService = locator<RouterService>();

  final String courseId;
  CourseLandingViewModel({required this.courseId});

  Course? fetchedCourse;

  List<Chapter> _chapters = [];
  List<Chapter> get chapters => _chapters;

  @override
  Future<void> futureToRun() async {
    fetchedCourse = await _courseService.getCourseForId(courseId);
    if (fetchedCourse == null) {
      await _routerService.replaceWith(const UnknownViewRoute());
      return;
    }

    _chapters = extractAllChapters(fetchedCourse);
  }

  Future<void> navigateToChapter(Chapter chapter) async {
    await _routerService.navigateTo(CourseDetailsViewRoute(
      courseId: courseId,
      children: List.from([
        CourseChapterViewRoute(chapterId: chapter.id),
      ]),
    ));
  }

  @visibleForTesting
  List<Chapter> extractAllChapters(Course? course) {
    if (course == null) return [];

    final List<Chapter> chapters = [];
    for (var module in course.modules) {
      chapters.addAll(module.chapters);
    }

    return chapters;
  }
}
