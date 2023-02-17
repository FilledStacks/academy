import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/services/http_service.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.form.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends FormViewModel {
  final httpService = locator<HttpService>();

  Future<void> notifyMe() async {
    await runBusyFuture(httpService.addEmail(emailValue!));
  }
}
