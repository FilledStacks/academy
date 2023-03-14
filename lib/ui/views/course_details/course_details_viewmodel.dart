import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/services/course_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/models.dart';

class CourseDetailsViewModel extends BaseViewModel {
  final log = getLogger('CourseDetailsViewModel');
  final _routerService = locator<RouterService>();
  final _courseService = locator<CourseService>();

  Course get course => _courseService.courses.first;

  List<dynamic> get sidebarItems {
    final tempItems = <dynamic>[];

    for (var module in course.modules) {
      tempItems.add(module);
      tempItems.addAll(module.chapters);
    }

    return tempItems;
  }

  Future<void> showChapter({required String id, bool initial = false}) async {
    _routerService.replaceWith(CourseChapterViewRoute(
      key: UniqueKey(),
      chapterId: id,
    ));
    notifyListeners();
  }

  bool isSidebarItemSelected(SideBarItem sideBarItem) {
    final id = _routerService.topRoute.pathParams.optString('chapterId');
    return id == null ? false : sideBarItem.isSelected(id);
  }
}
