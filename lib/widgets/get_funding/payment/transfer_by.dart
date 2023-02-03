import 'dart:io';
import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/get_funding/models/payment_model/payment.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferPage extends StatefulWidget {
  final Payment? payment;
  final String? paymentType;
  // final String amount;

  const TransferPage({Key? key, this.payment, this.paymentType})
      : super(key: key);
  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  Future? banks;

  final GlobalKey _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: double.infinity,
          ),
          Container(
            height: 110.0,
            decoration: BoxDecoration(
              color: Get.theme.brightness == Brightness.light
                  ? Theme.of(context).primaryColor
                  : const Color(0xffDEE8E9).withOpacity(0.1),
            ),
          ),
          Positioned(
            top: 50.0,
            left: 20.0,
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: 300.0,
              height: 80.0,
              child: Text(S.of(context).transferBy,
                  style: Theme.of(context).textTheme.button),
            ),
          ),
          Positioned(
              top: 25.0,
              left: 0.0,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: kIsWeb
                    ? const Icon(Icons.arrow_back)
                    : Platform.isIOS
                        ? const Icon(Icons.arrow_back_ios)
                        : const Icon(Icons.arrow_back),
                color: Get.theme.brightness == Brightness.light
                    ? Colors.white
                    : Theme.of(context).primaryColor,
              )),
          Positioned(
            top: 110.0,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: FutureBuilder(
              future: banks,
              builder: (context, snapshot) {
                // return _con.banks.length != 0
                //     ? ListView.builder(
                //         padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                //         itemCount: banksData.length,
                //         itemBuilder: (context, index) {
                //           Bank _bank = banksData[index];
                //           return GestureDetector(
                //             onTap: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) => PayNow(
                //                     payment: widget.payment,
                //                     bank: _bank,
                //                     paymentType: widget.paymentType,
                //                   ),
                //                 ),
                //               );
                //             },
                //             child: BankWidget(
                //               bankProfile: _bank,
                //             ),
                //           );
                //         },
                //       )
                //     : Center(child: CircularProgressIndicator());
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
