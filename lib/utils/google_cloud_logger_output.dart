import 'package:filledstacks_academy/app/app.locator.dart';
import 'package:filledstacks_academy/services/google_cloud_logger_service.dart';
import 'package:logger/logger.dart';

class GoogleCloudLoggerOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    if (locator.isRegistered<GoogleCloudLoggerService>()) {
      final loggerService = locator<GoogleCloudLoggerService>();
      loggerService.writeEntry(level: event.level, lines: event.lines);
    }
  }
}
