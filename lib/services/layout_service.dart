import 'package:stacked/stacked.dart';

class LayoutService with ListenableServiceMixin {
  bool _fullScreenMode = false;

  bool get fullScreenMode => _fullScreenMode;

  void enterFullScreen() {
    _fullScreenMode = true;
    notifyListeners();
  }

  void exitFullScreen() {
    _fullScreenMode = false;
    notifyListeners();
  }
}
