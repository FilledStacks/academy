import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future<void> logAppOpen() async {
    await _analytics.logAppOpen();
  }

  Future<void> setUserId({required String id}) async {
    await _analytics.setUserId(id: id);
  }

  Future<void> setUserProperty({required String name, String? value}) async {
    await _analytics.setUserProperty(name: name, value: value);
  }

  Future<void> logLogin() async {
    await _analytics.logLogin(loginMethod: 'google_sign_in');
  }

  Future<void> logScreenView({
    String? screenClass,
    String? screenName,
  }) async {
    await _analytics.logScreenView(
      screenClass: screenClass,
      screenName: screenName,
    );
  }

  Future<void> logAddPaymentInfo({
    String? coupon,
    String? currency,
    String? paymentType,
    double? value,
    List<AnalyticsEventItem>? items,
  }) async {
    await _analytics.logAddPaymentInfo(
      coupon: coupon,
      currency: currency,
      paymentType: paymentType,
      value: value,
      items: items,
    );
  }

  Future<void> logButtonClick({required String name}) async {
    await _analytics.logEvent(
      name: 'buttonClick',
      parameters: {'name': name},
    );
  }

  Future<void> logChapterSelected({
    required String id,
    String? chapterTitle,
    String? courseTitle,
  }) async {
    await _analytics.logEvent(
      name: 'chapterSelected',
      parameters: {
        'chapterTitle': chapterTitle,
        'courseTitle': courseTitle,
      },
    );
  }
}
