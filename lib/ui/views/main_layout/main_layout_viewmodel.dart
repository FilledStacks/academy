import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/ui/common/app_constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MainLayoutViewModel extends BaseViewModel {
  final routerService = locator<RouterService>();
  double get contentWidth {
    final topRouteName = routerService.topRoute.name;
    print('contentWidth - TopRouteName: $topRouteName');

    final isShowingCourseDetails =
        routerService.topRoute.name == CourseDetailsViewRoute.name;

    return isShowingCourseDetails ? 200 : kdDesktopMaxContentWidth;
  }
}
