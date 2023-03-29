import 'package:cicgreenloan/modules/event_module/screen/waiting_approval_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/form_builder/custom_button.dart';
import '../../../Utils/helper/color.dart';
import '../../../Utils/helper/notification_permission.dart';

class EventEnableNotificationScreen extends StatefulWidget {
  const EventEnableNotificationScreen({super.key});

  @override
  State<EventEnableNotificationScreen> createState() =>
      _EventEnableNotificationScreenState();
}

class _EventEnableNotificationScreenState
    extends State<EventEnableNotificationScreen> with WidgetsBindingObserver {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  Future<String>? permissionStatusFuture;
  var permGranted = "granted";
  var permDenied = "denied";
  var permUnknown = "unknown";
  var permProvisional = "provisional";

  @override
  void initState() {
    super.initState();
    // set up the notification permissions class
    // set up the future to fetch the notification data
    permissionStatusFuture = getCheckNotificationPermStatus();
    // With this, we will be able to check if the permission is granted or not
    // when returning to the application
    WidgetsBinding.instance.addObserver(this);
  }

  /// When the application has a resumed status, check for the permission
  /// status
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        permissionStatusFuture = getCheckNotificationPermStatus();
      });
    }
  }

  /// Checks the notification permission status
  Future<String> getCheckNotificationPermStatus() {
    return NotificationPermissions.getNotificationPermissionStatus()
        .then((status) {
      switch (status) {
        case PermissionStatus.denied:
          return permDenied;
        case PermissionStatus.granted:
          return permGranted;
        case PermissionStatus.unknown:
          return permUnknown;
        case PermissionStatus.provisional:
          return permProvisional;
        default:
          return '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/event/enable_notification.svg',
                      width: 250,
                      height: 250,
                    ),
                    Text(
                      'Enable Notification',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.w700, fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      'Stay in the loop and enable notifications to know when your account is ready.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: const Color(0xff848F92)),
                    ),
                  ],
                ),
              ),
              SafeArea(
                top: false,
                minimum: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: CustomButton(
                  width: double.infinity,
                  onPressed: () async {
                    //   await NotificationHelper.initial();
                    NotificationPermissions.requestNotificationPermissions(
                            iosSettings: const NotificationSettingsIos(
                                sound: true, badge: true, alert: true))
                        .then((_) {
                      // when finished, check the permission status

                      setState(() {
                        permissionStatusFuture =
                            getCheckNotificationPermStatus().then((value) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const WaitingApprovalScreen()),
                          );
                          return '';
                        });
                      });
                    });
                  },
                  title: 'Allow Notifications',
                  isDisable: false,
                  isOutline: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Text(
                    'Not Now',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: AppColor.mainColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
