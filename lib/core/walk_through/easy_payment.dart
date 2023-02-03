import 'package:cicgreenloan/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class EasyPay extends StatefulWidget {
  const EasyPay({Key? key}) : super(key: key);

  @override
  State<EasyPay> createState() => _EasyPayState();
}

class _EasyPayState extends State<EasyPay> {
  Future<void> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    S.load(
      Locale(
        prefs.getString('locale')!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
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
              child:
                  SvgPicture.asset('assets/images/svgfile/digitalImage.svg')),
          // Positioned(
          //   top: 50.0,
          //   right: 20.0,
          //   child: InkWell(
          //     child: Text(
          //       'Skip',
          //       style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
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
                    'Digitalize',
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
                      'Provide up-to-date information about CiC’s share price and its evaluation, your number of unit trust subscription and your unit trust subscription history.',
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
