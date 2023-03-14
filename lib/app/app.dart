import 'package:filledstacked_academy/services/http_service.dart';
import 'package:filledstacked_academy/ui/views/course_chapter/course_chapter_view.dart';
import 'package:filledstacked_academy/ui/views/course_details/course_details_view.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.dart';
import 'package:filledstacked_academy/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(
      page: CourseDetailsView,
      path: 'course/:id',
      children: [
        RedirectRoute(path: '', redirectTo: 'readme'),
        MaterialRoute(page: CourseChapterView, path: ':chapterId'),
      ],
    ),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: RouterService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: HttpService),
    // @stacked-service
  ],
  logger: StackedLogger(),
)
class App {}
