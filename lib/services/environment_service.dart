import 'package:filledstacks_academy/enums/environment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentService {
  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: _envDevelopment,
  );

  static const String _envDevelopment = 'Development';
  static const String _envProduction = 'Production';
  static const String _envStaging = 'Staging';

  static EnvironmentService? _instance;

  static Future<EnvironmentService> getInstance() async {
    if (_instance == null) {
      _instance = EnvironmentService();
      await _instance!.initialize();
    }

    return _instance!;
  }

  bool get isDevelopment => currentEnvironment == Environment.development;
  bool get isProduction => currentEnvironment == Environment.production;
  bool get isStaging => currentEnvironment == Environment.staging;

  String get apiKey => _getOrThrow('API_KEY');
  String get appId => _getOrThrow('APP_ID');
  String get authDomain => _getOrThrow('AUTH_DOMAIN');
  String get messagingSenderId => _getOrThrow('MESSAGING_SENDER_ID');
  String get projectId => _getOrThrow('PROJECT_ID');
  String get storageBucket => _getOrThrow('STORAGE_BUCKET');

  Future<void> initialize() async {
    await dotenv.load(fileName: currentEnvironment.path);
  }

  Environment get currentEnvironment {
    switch (environment) {
      case _envDevelopment:
        return Environment.development;
      case _envProduction:
        return Environment.production;
      case _envStaging:
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
