import 'dart:async';

import 'package:filledstacks_academy/app/app.locator.dart';
import 'package:filledstacks_academy/app/app.logger.dart';
import 'package:filledstacks_academy/app/app.router.dart';
import 'package:filledstacks_academy/models/models.dart';
import 'package:filledstacks_academy/services/course_service.dart';
import 'package:filledstacks_academy/services/layout_service.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CourseDetailsViewModel extends FutureViewModel<Course?> {
  final log = getLogger('CourseDetailsViewModel');

  final _courseService = locator<CourseService>();
  final _routerService = locator<RouterService>();
  final _layouService = locator<LayoutService>();

  final String courseId;
  CourseDetailsViewModel({required this.courseId});

  Course? fetchedCourse;
  Chapter? selectedChapter;

  bool get busyFetchingCourese => fetchedCourse == null;

  void enterFullscreen() => _layouService.enterFullScreen();
  void exitFullscreen() => _layouService.exitFullScreen();

  @override
  @override
  Future<Course> futureToRun() async {
    final fetchedCourse = await _courseService.getCourseForId(courseId);

    final chapterId = _routerService.topRoute.pathParams.optString('chapterId');

    final chapterIdToShow =
        chapterId ?? fetchedCourse.modules.first.chapters.first.id;

    _routerService.navigateToCourseChapterView(
      key: UniqueKey(),
      chapterId: chapterIdToShow,
      chapter: fetchedCourse.chapterForId(chapterIdToShow),
    );

    return fetchedCourse;
  }

  List<dynamic> get sidebarItems {
    if (isBusy) {
      return [];
    }

    final tempItems = <dynamic>[];

    for (var module in data!.modules) {
      tempItems.add(module);
      tempItems.addAll(module.chapters);
    }

    return tempItems;
  }

  void showChapter(Chapter chapter) {
    _routerService.replaceWithCourseChapterView(
      key: UniqueKey(),
      chapterId: chapter.id,
      chapter: chapter,
    );

    notifyListeners();
  }

  bool isSidebarItemSelected(SideBarItem sideBarItem) {
    final id = _routerService.topRoute.pathParams.optString('chapterId');
    return id == null ? false : sideBarItem.isSelected(id);
  }
}
