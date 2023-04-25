import 'dart:async';

import 'package:filledstacks_academy/app/app.locator.dart';
import 'package:filledstacks_academy/app/app.logger.dart';
import 'package:filledstacks_academy/app/app.router.dart';
import 'package:filledstacks_academy/exceptions/resource_not_found.dart';
import 'package:filledstacks_academy/models/models.dart';
import 'package:filledstacks_academy/services/course_service.dart';
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
    try {
      fetchedCourse = await _courseService.getCourseForId(courseId);
      _chapters = extractAllChapters(fetchedCourse);
    } on ResourceNotFoundException catch (_) {
      await _routerService.replaceWith(const UnknownViewRoute());
    } catch (e) {
      log.e(
        'Unexpected error has occured while fetching the course using id $courseId',
        e,
        StackTrace.current,
      );
    }
  }

  Future<void> navigateToChapter(Chapter chapter) async {
    await _routerService.navigateToCourseDetailsView(courseId: courseId);
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

  Future<void> enroll() async {
    // do enroll tasks
  }
}
