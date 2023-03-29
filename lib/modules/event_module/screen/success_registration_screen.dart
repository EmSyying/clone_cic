// ignore_for_file: use_build_context_synchronously

import 'package:cicgreenloan/modules/event_module/screen/enable_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../../Utils/form_builder/custom_button.dart';
import 'waiting_approval_screen.dart';

class SuccessRegistationScreen extends StatefulWidget {
  const SuccessRegistationScreen({
    super.key,
  });

  @override
  State<SuccessRegistationScreen> createState() =>
      _SuccessRegistationScreenState();
}

class _SuccessRegistationScreenState extends State<SuccessRegistationScreen>
    with WidgetsBindingObserver {
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
                        'assets/images/registration/success_registration.png'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Thank You!',
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
                      'Your application was successfully submitted.',
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
                      FirebaseMessaging messaging = FirebaseMessaging.instance;
                      NotificationSettings settings =
                          await messaging.requestPermission(
                        alert: true,
                        announcement: false,
                        badge: true,
                        carPlay: false,
                        criticalAlert: false,
                        provisional: false,
                        sound: true,
                      );
                      if (settings.authorizationStatus ==
                          AuthorizationStatus.authorized) {
                        //  print('User granted permission');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const WaitingApprovalScreen()),
                        );
                      } else if (settings.authorizationStatus ==
                          AuthorizationStatus.provisional) {
                        //  print('User granted provisional permission');
                      } else {
                        // print('User declined or has not accepted permission');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EnableNotificationScreen()));
                      }
                    },
                    title: 'Done',
                    isDisable: false,
                    isOutline: false,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
