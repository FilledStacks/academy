import 'dart:async';

import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/services/analytics_service.dart';
import 'package:filledstacked_academy/services/course_service.dart';
import 'package:filledstacked_academy/services/layout_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CourseDetailsViewModel extends BaseViewModel {
  final log = getLogger('CourseDetailsViewModel');
  final _analyticsService = locator<AnalyticsService>();
  final _courseService = locator<CourseService>();
  final _routerService = locator<RouterService>();
  final _layoutService = locator<LayoutService>();

  final String courseId;
  CourseDetailsViewModel({required this.courseId});

  Course? fetchedCourse;

  bool get busyFetchingCourese => fetchedCourse == null;

  Future<Course?> futureToRun() async {
    fetchedCourse = await _courseService.getCourseForId(courseId);
    if (fetchedCourse == null) {
      await _routerService.replaceWithUnknownView();
      return null;
    }

    rebuildUi();

    final chapterId = _routerService.topRoute.pathParams.optString('chapterId');

    final chapterIdToShow =
        chapterId ?? fetchedCourse!.modules.first.chapters.first.id;

    _routerService.navigateToCourseChapterView(
      key: UniqueKey(),
      chapterId: chapterIdToShow,
      chapter: fetchedCourse!.chapterForId(chapterIdToShow),
    );

    return fetchedCourse!;
  }

  List<dynamic> get sidebarItems {
    return [];
  }

  Future<void> showChapter(Chapter chapter) async {
    unawaited(_analyticsService.logChapterSelected(
      id: chapter.id,
      chapterTitle: chapter.title,
      courseTitle: fetchedCourse?.title,
    ));

    _routerService.replaceWithCourseChapterView(
      key: UniqueKey(),
      chapterId: chapter.id,
      chapter: chapter,
    );

    rebuildUi();
  }

  bool isSidebarItemSelected(SideBarItem sideBarItem) {
    final id = _routerService.topRoute.pathParams.optString('chapterId');
    return id == null ? false : sideBarItem.isSelected(id);
  }

  void enterFullscreen() => _layoutService.enterFullScreen();
  void exitFullscreen() => _layoutService.exitFullScreen();
}
