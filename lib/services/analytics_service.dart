import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

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

  Future<void> logButtonClick({required String name}) async {
    await _analytics.logEvent(
      name: 'buttonClick',
      parameters: {'name': name},
    );
  }
}
