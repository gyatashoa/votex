import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:votex/app/app.locator.dart';
import 'package:votex/app/app.router.dart';
import 'package:votex/models/voting_data_model.dart';
import 'package:timezone/data/latest.dart' as t;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future initialize() async {
    final androidInit = AndroidInitializationSettings("launcher_icon");

    final iosInit = IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onNotificationTapped);
  }

  Future<void> onNotificationTapped(String? payload) async {
    if (payload == null) return;
    final _navigator = locator<NavigationService>();
    _navigator.navigateTo(Routes.votingDetailView,
        arguments: VotingDetailViewArguments(id: payload));
  }

  Future subscribe(VotingDataModel model, int id) async {
    final android = AndroidNotificationDetails('id', 'channel', 'des');
    final ios = IOSNotificationDetails();
    final platform = new NotificationDetails(
      android: android,
      iOS: ios,
    );

    t.initializeTimeZones();

    bool hasNotStarted = model.startTime!.isAfter(DateTime.now());
    bool hasEnded = model.endTime!.isBefore(DateTime.now());

    //No notification will be sheduled
    if (hasEnded) return;

    //Schedule ids for for first and second
    int left = (id + 1) * 2;
    int right = ((id + 1) * 2) + 1;
    //Schedule for both starting and ending
    if (hasNotStarted) {
      var temp = model.startTime!.toUtc();
      var scheduler =
          tz.TZDateTime.now(tz.local).add(temp.difference(DateTime.now()));

      await _flutterLocalNotificationsPlugin.zonedSchedule(
          left,
          model.title,
          "Voting activities for this poll has begun!, Tap to participate",
          scheduler,
          platform,
          payload: model.id,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true);
    }

    var temp1 = model.endTime!.toUtc();
    var scheduler1 =
        tz.TZDateTime.now(tz.local).add(temp1.difference(DateTime.now()));
    await _flutterLocalNotificationsPlugin.zonedSchedule(
        right,
        model.title,
        "Voting activities for this poll has Ended!,Tap to check result",
        scheduler1,
        platform,
        payload: model.id,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  Future unsubscribe(int id) async {
    int left = (id + 1) * 2;
    int right = ((id + 1) * 2) + 1;
    //cancel both
    await _flutterLocalNotificationsPlugin.cancel(left);
    await _flutterLocalNotificationsPlugin.cancel(right);
  }
}
