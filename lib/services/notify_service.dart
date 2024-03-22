
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('flutter_logo');

    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    await notificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {});
  }

  Future<void> scheduleNotification({
    required String title,
    required String body,
  }) async {
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);

    await notificationsPlugin.periodicallyShow(0, title, body, RepeatInterval.everyMinute, notificationDetails);
  }
}
