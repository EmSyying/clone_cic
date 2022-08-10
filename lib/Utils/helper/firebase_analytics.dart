import 'package:firebase_analytics/firebase_analytics.dart';

FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

class FirebaseAnalyticsHelper {
  static Future<void> setCurrentScreenName(String screenName) async {
    await _analytics.setCurrentScreen(
      screenName: screenName,
      screenClassOverride: screenName.replaceAll(' ', ''),
    );
  }

  static Future<void> sendAnalyticsEvent(String eventName) async {
    await _analytics.logEvent(
      name: 'ON_PRESSED_${eventName.replaceAll(' ', '_').toUpperCase()}',
    );
    
  }
}
