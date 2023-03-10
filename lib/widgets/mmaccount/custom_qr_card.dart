import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../modules/wallet/controller/wallet_controller.dart';

class CustomQRCard extends StatelessWidget {
  final String? amountQr;
  final String? userID;
  final String? userName;
  final String assetName;
  const CustomQRCard(
      {Key? key,
      this.amountQr,
      this.userID,
      this.userName,
      this.assetName = "assets/images/Logo/cic_logo_x4jpg.jpg"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xff103783), Color(0xff3588E8)],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: PrettyQr(
              image: AssetImage(assetName),
              size: 200,
              data: walletController.transferModel.value.toJson(),
              roundEdges: true,
              elementColor: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(
            height: 20,
            width: 1,
          ),
          // Text(
          //   '$userID',
          //   style: Theme.of(context)
          //       .textTheme
          //       .titleLarge!
          //       .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
          // ),
          // const SizedBox(
          //   height: 15,
          //   width: 1,
          // ),
          Container(
            width: 249,
            decoration: DottedDecoration(
              strokeWidth: 1,
              shape: Shape.line,
              color: Colors.white60,
            ),
          ),
          const SizedBox(
            height: 20,
            width: 1,
          ),
          Text(
            amountQr != null && amountQr != '' ? '$amountQr USD' : '0.00 USD',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          Text(
            '$userName',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
