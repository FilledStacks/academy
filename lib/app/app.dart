import 'package:filledstacks_academy/services/course_service.dart';
import 'package:filledstacks_academy/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:filledstacks_academy/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:filledstacks_academy/ui/views/course_details/course_details_view.dart';
import 'package:filledstacks_academy/ui/views/course_landing/course_landing_view.dart';
import 'package:filledstacks_academy/ui/views/home/home_view.dart';
import 'package:filledstacks_academy/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: HomeView, initial: true),
    CustomRoute(page: CourseLandingView),
    CustomRoute(page: CourseDetailsView),

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