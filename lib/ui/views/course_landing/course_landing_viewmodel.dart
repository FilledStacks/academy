import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/services/course_service.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';

class CourseLandingViewModel extends FutureViewModel {
  final log = getLogger('CourseLandingViewModel');
  final _courseService = locator<CourseService>();

  final String courseId;
  CourseLandingViewModel({required this.courseId});

  Course? fetchedCourse;

  List<Chapter> _chapters = [];
  List<Chapter> get chapters => _chapters;

  @override
  Future<void> futureToRun() async {
    fetchedCourse = await _courseService.getCourseForId(courseId);
    _chapters = extractAllChapters(fetchedCourse);
  }

  Future<void> navigateToChapter(Chapter chapter) async {
    log.i(chapter);
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
