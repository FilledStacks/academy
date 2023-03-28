import 'package:filledstacked_academy/services/course_service.dart';
import 'package:filledstacked_academy/services/http_service.dart';
import 'package:filledstacked_academy/ui/views/course_chapter/course_chapter_view.dart';
import 'package:filledstacked_academy/ui/views/course_details/course_details_view.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:filledstacked_academy/ui/views/course_landing/course_landing_view.dart';
import 'package:filledstacked_academy/ui/views/unknown/unknown_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(
      page: HomeView,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(page: CourseLandingView, path: '/courses/:courseId'),
    CustomRoute(
      page: CourseDetailsView,
      path: '/courses/:courseId',
      children: [
        CustomRoute(page: CourseChapterView, path: ':chapterId'),
      ],
    ),
    CustomRoute(
      page: UnknownView,
      path: '/404',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
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
