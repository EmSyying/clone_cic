import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../Utils/form_builder/custom_button.dart';
import '../../../Utils/helper/color.dart';
import 'waiting_approval_screen.dart';

class EnableNotificationScreen extends StatefulWidget {
  const EnableNotificationScreen({super.key});

  @override
  State<EnableNotificationScreen> createState() =>
      _EnableNotificationScreenState();
}

class _EnableNotificationScreenState extends State<EnableNotificationScreen>
    with WidgetsBindingObserver {
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
                    Image.asset(
                        'assets/images/registration/enable_notification.png'),
                    const SizedBox(
                      height: 20.0,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WaitingApprovalScreen()),
                    );
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
