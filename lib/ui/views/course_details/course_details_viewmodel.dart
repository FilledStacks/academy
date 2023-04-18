import 'dart:async';

import 'package:filledstacks_academy/app/app.locator.dart';
import 'package:filledstacks_academy/app/app.logger.dart';
import 'package:filledstacks_academy/models/models.dart';
import 'package:filledstacks_academy/services/course_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CourseDetailsViewModel extends FutureViewModel<Course?> {
  final log = getLogger('CourseDetailsViewModel');

  final _courseService = locator<CourseService>();
  final _routerService = locator<RouterService>();

  Course? fetchedCourse;
  Chapter? selectedChapter;

  CourseDetailsViewModel();

  bool get busyFetchingCourese => fetchedCourse == null;

  @override
  Future<Course> futureToRun() => _courseService.getCourseForId('flutter-web');

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

  Future<void> showChapter(Chapter chapter) async {
    selectedChapter = chapter;
    notifyListeners();
  }

  bool isSidebarItemSelected(SideBarItem sideBarItem) {
    return sideBarItem.isSelected(selectedChapter?.id ?? '');
  }
}
