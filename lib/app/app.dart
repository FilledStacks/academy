import 'package:filledstacked_academy/services/http_service.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.dart';
import 'package:filledstacked_academy/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: HomeView, initial: true),
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
