import 'package:filledstacks_academy/enums/environment.dart';

class EnvironmentService {
  static const String kEnvDevelopment = 'Development';
  static const String kEnvStaging = 'Staging';
  static const String kEnvProduction = 'Production';

  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: kEnvDevelopment,
  );
  static const String apiKey = String.fromEnvironment('API_KEY');
  static const String appId = String.fromEnvironment('APP_ID');
  static const String authDomain = String.fromEnvironment('AUTH_DOMAIN');
  static const String messagingSenderId =
      String.fromEnvironment('MESSAGING_SENDER_ID');
  static const String projectId = String.fromEnvironment('PROJECT_ID');
  static const String storageBucket = String.fromEnvironment('STORAGE_BUCKET');

  static Environment get currentEnvironment {
    switch (environment) {
      case kEnvDevelopment:
        return Environment.development;
      case kEnvStaging:
        return Environment.staging;
      case kEnvProduction:
        return Environment.production;
      default:
        return Environment.development;
    }
  }

  static bool get isDevelopment =>
      currentEnvironment == Environment.development;
  static bool get isProduction => currentEnvironment == Environment.production;
  static bool get isStaging => currentEnvironment == Environment.staging;
}
