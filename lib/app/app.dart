import 'package:filledstacks_academy/services/course_service.dart';
import 'package:filledstacks_academy/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:filledstacks_academy/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:filledstacks_academy/ui/views/course_details/course_details_view.dart';
import 'package:filledstacks_academy/ui/views/course_landing/course_landing_view.dart';
import 'package:filledstacks_academy/ui/views/home/home_view.dart';
import 'package:filledstacks_academy/ui/views/unknown/unknown_view.dart';
import 'package:filledstacks_academy/utils/google_cloud_logger_output.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:filledstacks_academy/ui/views/main_layout/main_layout_view.dart';
import 'package:filledstacks_academy/services/layout_service.dart';
import 'package:filledstacks_academy/ui/views/course_chapter/course_chapter_view.dart';
import 'package:filledstacks_academy/services/user_service.dart';
import 'package:filledstacks_academy/ui/views/payment_capture/payment_capture_view.dart';

import 'guards/auth_guard.dart';
import 'package:filledstacks_academy/services/google_cloud_logger_service.dart';
import 'package:filledstacks_academy/services/analytics_service.dart';
import 'package:filledstacks_academy/services/native_interactions/native_interaction_service.dart';
import 'package:filledstacks_academy/services/environment_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(
      page: MainLayoutView,
      initial: true,
      children: [
        CustomRoute(page: HomeView, path: ''),
        CustomRoute(page: CourseLandingView, path: 'courses'),
        CustomRoute(
          page: CourseDetailsView,
          path: 'course/:courseId',
          children: [
            CustomRoute(page: CourseChapterView, path: ':chapterId'),
          ],
        ),
        CustomRoute(
          page: PaymentCaptureView,
          path: 'payment',
          guards: [AuthGuard],
        ),
      ],
    ),

// @stacked-route
    CustomRoute(page: UnknownView, path: '/404'),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    LazySingleton(classType: CourseService),

    LazySingleton(classType: LayoutService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: GoogleCloudLoggerService),
    LazySingleton(classType: AnalyticsService),
    LazySingleton(classType: NativeInteractionService),
    Presolve(
      classType: EnvironmentService,
      presolveUsing: EnvironmentService.getInstance,
    ),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(loggerOutputs: [GoogleCloudLoggerOutput]),
)
class App {}
