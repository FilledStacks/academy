import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/services/course_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/models.dart';

class CourseDetailsViewModel extends FutureViewModel<Course> {
  final log = getLogger('CourseDetailsViewModel');
  final _routerService = locator<RouterService>();
  final _courseService = locator<CourseService>();

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

  void showChapter(Chapter chapter) {
    selectedChapter = chapter;
    notifyListeners();
  }

  bool isSidebarItemSelected(SideBarItem sideBarItem) {
    final id = _routerService.topRoute.pathParams.optString('chapterId');
    return id == null ? false : sideBarItem.isSelected(id);
  }
}
