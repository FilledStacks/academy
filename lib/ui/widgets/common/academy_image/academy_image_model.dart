import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:stacked/stacked.dart';

class AcademyImageModel extends BaseViewModel {
  final log = getLogger('AcademyImageModel');

  AcademyImageModel() {
    _initialise();
  }

  bool _isLoadingImage = true;
  bool get isLoadingImage => _isLoadingImage;

  Future<void> _initialise() async {
    await Future.delayed(const Duration(milliseconds: 750));
    _isLoadingImage = false;
    rebuildUi();
  }
}
