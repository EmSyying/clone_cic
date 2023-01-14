import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../modules/wallet/controller/wallet_controller.dart';

class CardCurrentPoints extends StatelessWidget {
  const CardCurrentPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    TextStyle textStyle = Theme.of(context).textTheme.headline2!;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 110,
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xff384593),
                Color(0xff3588E8),
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'MVP Balance',
                    style: textStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    walletController.mvpBalance.value.mvpAmountFormat ?? '0.00',
                    style: textStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: SvgPicture.asset(
            'assets/images/svgfile/union_point.svg',
            fit: BoxFit.cover,
            width: 50.0,
            height: 110.0,
          ),
        ),
      ],
    );
  }
}
