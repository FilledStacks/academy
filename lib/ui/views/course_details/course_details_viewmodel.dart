import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/services/course_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/models.dart';

class CourseDetailsViewModel extends FutureViewModel<Course> {
  final log = getLogger('CourseDetailsViewModel');
  final _routerService = locator<RouterService>();
  final _courseService = locator<CourseService>();

  final String courseId;
  Course? fetchedCourse;

  CourseDetailsViewModel({required this.courseId});

  bool get busyFetchingCourese => fetchedCourse == null;

  @override
  Future<Course> futureToRun() async {
    fetchedCourse = await _courseService.getCourseForId(courseId);
    rebuildUi();

    final chapterId = _routerService.topRoute.pathParams.optString('chapterId');
    print('ChapterID: $chapterId');

    final chapterIdToShow =
        chapterId ?? fetchedCourse!.modules.first.chapters.first.id;

    _routerService.navigateTo(CourseChapterViewRoute(
      key: UniqueKey(),
      chapterId: chapterIdToShow,
      chapter: fetchedCourse!.chapterForId(chapterIdToShow),
    ));

    return fetchedCourse!;
  }

  List<dynamic> get sidebarItems {
    final tempItems = <dynamic>[];

    for (var module in data!.modules) {
      tempItems.add(module);
      tempItems.addAll(module.chapters);
    }

    return tempItems;
  }

  Future<void> showChapter(Chapter chapter) async {
    _routerService.replaceWith(CourseChapterViewRoute(
      key: UniqueKey(),
      chapterId: chapter.id,
      chapter: chapter,
    ));

    notifyListeners();
  }

  bool isSidebarItemSelected(SideBarItem sideBarItem) {
    final id = _routerService.topRoute.pathParams.optString('chapterId');
    return id == null ? false : sideBarItem.isSelected(id);
  }
}
