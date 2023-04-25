import 'package:filledstacks_academy/services/course_service.dart';
import 'package:filledstacks_academy/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:filledstacks_academy/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:filledstacks_academy/ui/views/course_details/course_details_view.dart';
import 'package:filledstacks_academy/ui/views/course_landing/course_landing_view.dart';
import 'package:filledstacks_academy/ui/views/home/home_view.dart';
import 'package:filledstacks_academy/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:filledstacks_academy/ui/views/main_layout/main_layout_view.dart';
import 'package:filledstacks_academy/services/layout_service.dart';
import 'package:filledstacks_academy/ui/views/course_chapter/course_chapter_view.dart';
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
  logger: StackedLogger(),
)
class App {}
