import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../Utils/form_builder/custom_button.dart';
import '../../../Utils/helper/color.dart';
import 'waiting_approval_screen.dart';

class EventEnableNotificationScreen extends StatefulWidget {
  const EventEnableNotificationScreen({super.key});

  @override
  State<EventEnableNotificationScreen> createState() =>
      _EventEnableNotificationScreenState();
}

class _EventEnableNotificationScreenState
    extends State<EventEnableNotificationScreen> with WidgetsBindingObserver {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

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
                    openAppSettings();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WaitingApprovalScreen()),
                    );
                    // final timer = Timer.periodic(const Duration(seconds: 1),
                    //     (timer) async {
                    //   FirebaseMessaging messaging = FirebaseMessaging.instance;
                    //   NotificationSettings settings =
                    //       await messaging.requestPermission(
                    //     alert: true,
                    //     announcement: false,
                    //     badge: true,
                    //     carPlay: false,
                    //     criticalAlert: false,
                    //     provisional: false,
                    //     sound: true,
                    //   );
                    //   if (settings.authorizationStatus ==
                    //       AuthorizationStatus.authorized) {
                    //     timer.cancel();
                    //     print('User granted permission');

                    //   } else if (settings.authorizationStatus ==
                    //       AuthorizationStatus.provisional) {
                    //     print('User granted provisional permission');
                    //     timer.cancel();
                    //   } else {
                    //     print('User declined or has not accepted permission');
                    //     timer.cancel();
                    //   }
                    // });
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
