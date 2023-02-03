import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/setting_modules/screens/sub_setting_screen/contract_terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class QuickNotification extends StatefulWidget {
  const QuickNotification({Key? key}) : super(key: key);

  @override
  State<QuickNotification> createState() => _QuickNotificationState();
}

class _QuickNotificationState extends State<QuickNotification> {
  Future<void> getLanguage() async {
    S.load(
      const Locale(
        'en',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragStart: (start) {
          getLanguage();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ContractTerm(),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
              height: double.infinity,
              // child: SvgPicture.asset(
              //   'assets/images/svgfile/backgroundSlide.svg',
              //   fit: BoxFit.cover,
              // ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.17,
              child: SvgPicture.asset('assets/images/svgfile/notifyImage.svg'),
              // child: Image.asset('assets/images/svgfile/onboardingpic1.png'),
            ),
            // Positioned(
            //   top: 50.0,
            //   right: 20.0,
            //   child: InkWell(
            //     child: Text(
            //       'Skip',
            //       style:
            //           TextStyle(fontFamily: 'Montserrat', color: Colors.white),
            //     ),
            //     onTap: () {
            //       Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => ContractTerm(),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Positioned(
                top: mediaHeight * 0.55,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Notify',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: Get.theme.brightness == Brightness.light
                              ? Colors.black
                              : Colors.white),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        'Stay updated with CiC by getting announcements and notifications.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
