import 'package:filledstacked_academy/services/course_service.dart';
import 'package:filledstacked_academy/services/http_service.dart';
import 'package:filledstacked_academy/ui/views/course_chapter/course_chapter_view.dart';
import 'package:filledstacked_academy/ui/views/course_details/course_details_view.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:filledstacked_academy/ui/views/profile/profile_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(
      page: HomeView,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: CourseDetailsView,
      path: '/course/:courseId',
      children: [
        CustomRoute(page: CourseChapterView, path: ':chapterId'),
      ],
    ),
    MaterialRoute(page: ProfileView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: RouterService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: HttpService),
    LazySingleton(classType: CourseService),
    LazySingleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: UserService),
    // @stacked-service
  ],
  logger: StackedLogger(),
)
class App {}
