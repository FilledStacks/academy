import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/services/environment_service.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis/logging/v2.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:logger/logger.dart';

const _scopes = ['https://www.googleapis.com/auth/logging.write'];

class GoogleCloudLoggerService {
  static late ServiceAccountCredentials _credentials;

  static late AutoRefreshingAuthClient _authClient;
  static late LoggingApi _loggingApi;

  final log = getLogger('GoogleCloudLoggerService');
  final resource = MonitoredResource()..type = 'global';

  String get projectId => EnvironmentService.projectId;
  String get environment => EnvironmentService.currentEnvironment.name;
  bool get _isDevelopment => EnvironmentService.isDevelopment;

  late Map<String, String> labels;

  bool _initialised = false;

  Future<void> initialise() async {
    try {
      if (!_isDevelopment) {
        labels = {'project_id': projectId, 'environment': environment};

        final credentialJson = await rootBundle.loadString(
          'credentials/academy-$environment-logging.json',
        );

        _credentials = ServiceAccountCredentials.fromJson(credentialJson);
        _authClient = await clientViaServiceAccount(_credentials, _scopes);
        _loggingApi = LoggingApi(_authClient);
        log.i(
          'GoogleApiService setup successfully completed for Cloud logging',
        );
        _initialised = true;
      }
    } catch (e) {
      log.e('ERROR: GoogleCloudLogger not initialised. $e');
    }
  }

  String _getSeverityFromLevel(Level level) {
    switch (level) {
      case Level.wtf:
        return 'EMERGENCY';
      case Level.error:
        return 'ERROR';
      case Level.warning:
        return 'WARNING';
      case Level.info:
        return 'INFO';
      case Level.debug:
        return 'DEBUG';

      default:
        return 'DEBUG';
    }
  }

  void writeEntry({required Level level, required List<String> lines}) {
    if (_initialised) {
      LogEntry logEntry = LogEntry();
      logEntry.logName = "projects/$projectId/logs/$projectId";
      logEntry.jsonPayload = {'message': lines.join('\n')};
      logEntry.resource = resource;
      labels['level'] = level.toString();
      logEntry.labels = labels;
      logEntry.severity = _getSeverityFromLevel(level);

      final request = WriteLogEntriesRequest();
      request.entries = [logEntry];

      _loggingApi.entries.write(request).catchError((error) {
        log.e('ERROR: GoogleCloudLogger - $error');
        return WriteLogEntriesResponse();
      });
    }
  }

  void setUserId({
    required String userId,
    required int sessionId,
  }) {
    if (_initialised) {
      labels['user_id'] = userId;
      labels['session_id'] = sessionId.toString();
    }
  }
}
