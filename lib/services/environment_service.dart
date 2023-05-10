import 'package:filledstacked_academy/enums/environment.dart';

/// Loads all the required environment values
class EnvironmentService {
  static const String kEnvDevelopment = 'Development';
  static const String kEnvProduction = 'Production';
  static const String kEnvStaging = 'Staging';

  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: kEnvDevelopment,
  );
  static const String apiKey = String.fromEnvironment('API_KEY');
  static const String appId = String.fromEnvironment('APP_ID');
  static const String authDomain = String.fromEnvironment('AUTH_DOMAIN');
  static const String baseUrl = String.fromEnvironment('BASE_URL');
  static const String messagingSenderId =
      String.fromEnvironment('MESSAGING_SENDER_ID');
  static const String projectId = String.fromEnvironment('PROJECT_ID');
  static const String storageBucket = String.fromEnvironment('STORAGE_BUCKET');

  static bool get isDevelopment =>
      currentEnvironment == Environment.development;
  static bool get isProduction => currentEnvironment == Environment.production;
  static bool get isStaging => currentEnvironment == Environment.staging;

  static Environment get currentEnvironment {
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
}
