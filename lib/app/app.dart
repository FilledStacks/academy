import 'package:filledstacked_academy/services/analytics_service.dart';
import 'package:filledstacked_academy/services/course_service.dart';
import 'package:filledstacked_academy/services/google_cloud_logger_service.dart';
import 'package:filledstacked_academy/services/http_service.dart';
import 'package:filledstacked_academy/services/layout_service.dart';
import 'package:filledstacked_academy/services/native_interaction_service.dart';
import 'package:filledstacked_academy/services/user_service.dart';
import 'package:filledstacked_academy/ui/views/course_chapter/course_chapter_view.dart';
import 'package:filledstacked_academy/ui/views/course_details/course_details_view.dart';
import 'package:filledstacked_academy/ui/views/course_landing/course_landing_view.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.dart';
import 'package:filledstacked_academy/ui/views/main_layout/main_layout_view.dart';
import 'package:filledstacked_academy/ui/views/payment_capture/payment_capture_view.dart';
import 'package:filledstacked_academy/ui/views/unknown/unknown_view.dart';
import 'package:filledstacked_academy/ui/views/user_profile/user_profile_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:filledstacked_academy/services/environment_service.dart';
// @stacked-import

import '../utils/google_cloud_logger_output.dart';
import 'guards/auth_guard.dart';

@StackedApp(
  routes: [
    CustomRoute(
      page: MainLayoutView,
      initial: true,
      children: [
        CustomRoute(
          path: '',
          page: HomeView,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(page: CourseLandingView, path: 'courses/:courseId'),
        CustomRoute(
          page: CourseDetailsView,
          path: 'details/:courseId',
          children: [
            CustomRoute(page: CourseChapterView, path: ':chapterId'),
          ],
        ),
        CustomRoute(
          page: UserProfileView,
          path: 'profile',
          guards: [AuthGuard],
        ),
        CustomRoute(
          page: PaymentCaptureView,
          path: 'payment-capture',
          guards: [AuthGuard],
        ),
      ],
    ),
// @stacked-route

    CustomRoute(
      page: UnknownView,
      path: '/404',
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  dependencies: [
    LazySingleton(classType: RouterService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: EnvironmentService),
    LazySingleton(classType: HttpService),
    LazySingleton(classType: CourseService),
    LazySingleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: LayoutService),
    LazySingleton(classType: AnalyticsService),
    LazySingleton(classType: GoogleCloudLoggerService),
    LazySingleton(classType: NativeInteractionService),
// @stacked-service
  ],
  logger: StackedLogger(
    loggerOutputs: [GoogleCloudLoggerOutput],
  ),
)
class App {}
