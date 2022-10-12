import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../modules/wallet/controller/wallet_controller.dart';

class CustomQRCard extends StatelessWidget {
  final String? amountQr;
  final String? userID;
  final String? userName;
  CustomQRCard(
      {Key? key, this.overlayEntry, this.amountQr, this.userID, this.userName})
      : super(key: key);
  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());

    return Container(
      height: 410,
      width: 400,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          colors: [Color(0xff384593), Color(0xff3588E8)],
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: PrettyQr(
              image: const AssetImage('assets/images/Logo/cic_logo_x4jpg.jpg'),
              size: 210,
              data: walletController.transferModel.value.toJson(),
              roundEdges: true,
              elementColor: AppColor.mainColor,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            '$userID',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: DottedDecoration(
              strokeWidth: 1,
              shape: Shape.line,
              color: Colors.white60,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '$amountQr',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          Text(
            '$userName',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
