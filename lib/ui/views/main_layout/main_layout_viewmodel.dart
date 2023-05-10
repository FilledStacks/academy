import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/app/app.router.dart';
import 'package:filledstacked_academy/services/layout_service.dart';
import 'package:filledstacked_academy/ui/common/app_constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MainLayoutViewModel extends ReactiveViewModel {
  final log = getLogger('MainLayoutViewModel');

  final _routerService = locator<RouterService>();
  final _layoutService = locator<LayoutService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_layoutService];

  double? get contentWidth {
    return _layoutService.fullScreenMode ? null : kdDesktopMaxContentWidth;
  }

  Future<void> navigateToHome() async {
    _layoutService.exitFullScreen();
    await _routerService.clearStackAndShow(const HomeViewRoute());
  }
}
