import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/enums/environment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Loads all the required environment values
class EnvironmentService {
  final log = getLogger('EnvironmentService');

  static EnvironmentService? _instance;

  static Future<EnvironmentService> getInstance() async {
    if (_instance == null) {
      _instance = EnvironmentService();
      await _instance!.initialize();
    }

    return _instance!;
  }

  static const String kEnvDevelopment = 'Development';
  static const String kEnvProduction = 'Production';
  static const String kEnvStaging = 'Staging';

  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: kEnvDevelopment,
  );

  bool get isDevelopment => currentEnvironment == Environment.development;
  bool get isProduction => currentEnvironment == Environment.production;
  bool get isStaging => currentEnvironment == Environment.staging;

  String get apiKey => _getOrThrow('API_KEY');
  String get appId => _getOrThrow('APP_ID');
  String get authDomain => _getOrThrow('AUTH_DOMAIN');
  String get messagingSenderId => _getOrThrow('MESSAGING_SENDER_ID');
  String get projectId => _getOrThrow('PROJECT_ID');
  String get storageBucket => _getOrThrow('STORAGE_BUCKET');
  String get baseUrl => _getOrThrow('BASE_URL');

  Future<void> initialize() async {
    log.i(
      'currentEnvironment:$environment activeEnvironmentPath:${currentEnvironment.path}',
    );
    await dotenv.load(fileName: currentEnvironment.path);
  }

  Environment get currentEnvironment {
    switch (environment) {
      case kEnvDevelopment:
        return Environment.development;
      case kEnvProduction:
        return Environment.production;
      case kEnvStaging:
        return Environment.staging;
      default:
        return Environment.development;
    }
  }

  String _getOrThrow(String key, {bool throwException = true}) {
    final value = dotenv.env[key];
    if (value == null && throwException) {
      throw Exception('No $key defined in ${currentEnvironment.path}');
    }

    return value ?? '';
  }
}
