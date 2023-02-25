import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardCurrentPoints extends StatelessWidget {
  final String? title;
  final String? amount;
  const CardCurrentPoints({Key? key, this.title, this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final walletController = Get.put(WalletController());
    TextStyle textStyle = Theme.of(context).textTheme.displayMedium!;
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title ?? '',
                    //'MVP Balance',
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
                    amount ?? '0.00',
                    // walletController.mvpBalance.value.mvpAmountFormat ??
                    //     '0.00',
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
          SvgPicture.asset(
            'assets/images/svgfile/line.svg',
            color: Colors.black12,
            fit: BoxFit.cover,
            width: 50.0,
            height: 78.0,
            // 'assets/images/svgfile/union_point.svg',
            // fit: BoxFit.cover,
            // width: 50.0,
            // height: 110.0,
          ),
        ],
      ),
    );
  }
}
