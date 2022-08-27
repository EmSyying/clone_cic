import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import '../../../../Utils/helper/color.dart';
import '../../../../widgets/privilege/custom_dashedline.dart';

class PaymentDoneScreen extends StatelessWidget {
  final String? numberRated;
  final String? digiteCode;
  final GestureTapCallback? onTap;
  const PaymentDoneScreen({
    Key? key,
    this.numberRated,
    this.digiteCode,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: const Text(
          'Member ID: CiC123456',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 20.0,
            ),
            child: LottieBuilder.asset(
              "assets/images/animation/lf30_editor_g4pvkudk.json",
              height: 240,
              repeat: false,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              frameRate: FrameRate(100),
            ),
          ),
          const Spacer(),
          Text(
            "Success",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "Congratulations! You just received a discount of",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.black,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            numberRated ?? '40%',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: AppColor.statusColor['pending'],
                  fontWeight: FontWeight.w700,
                  fontSize: 37,
                ),
          ),
          const CustomDasheLine(),
          Text(
            '4 digits code',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: () {
              Clipboard.setData(
                const ClipboardData(text: 'APGQ'),
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: 88,
              height: 31,
              decoration: BoxDecoration(
                color: AppColor.statusColor['pending']!.withOpacity(0.2),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                digiteCode ?? 'APGQ',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: AppColor.statusColor['pending'],
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 30.0),
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.mainColor),
                alignment: Alignment.center,
                child: Text(
                  "Done",
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
