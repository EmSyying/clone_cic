import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../Utils/form_builder/custom_button.dart';

class ShowPermision extends StatelessWidget {
  final String? lottieJson;
  final String? title;
  final String? description;
  final String? button;

  const ShowPermision(
      {super.key,
      this.title,
      this.description,
      required this.lottieJson,
      this.button});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.asset(
                    lottieJson ?? '',
                    height: 200,
                  ),
                  // 'assets/images/animation/camera_permission.json',
                  // height: 200,
                  // ),
                  const SizedBox(height: 20),
                  Text(
                    title ?? '',
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            CustomButton(
              onPressed: () {
                openAppSettings().then((value) {
                  debugPrint('Status $value');
                });
              },
              isDisable: false,
              isOutline: false,
              title: button ?? '',
            )
          ],
        ),
      ),
    );
  }
}
