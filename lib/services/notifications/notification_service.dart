import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final Logger _logger = Logger();

  Future<void> init() async {
    // Request permissions (iOS)
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      _logger.i('User granted permission');
    } else {
      _logger.w('User declined or has not accepted permission');
    }

    // Get FCM Token
    String? token = await _fcm.getToken();
    _logger.i("FCM Token: $token");

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _logger.i("Received foreground message: ${message.notification?.title}");
    });

    // Handle message open app
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _logger.i("App opened from notification: ${message.notification?.title}");
    });
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    // Handle background message
    print("Handling a background message: ${message.messageId}");
  }
}
