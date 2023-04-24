import 'package:filledstacks_academy/app/app.locator.dart';
import 'package:filledstacks_academy/services/layout_service.dart';
import 'package:filledstacks_academy/ui/common/app_constants.dart';
import 'package:stacked/stacked.dart';

class MainLayoutViewModel extends ReactiveViewModel {
  final _layoutService = locator<LayoutService>();

  double? get contentWidth {
    return _layoutService.fullScreenMode ? null : kdDesktopMaxContentWidth;
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_layoutService];
}
