import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../modules/privilege_program/screen/choose_gift_template.dart';
import 'custom_header_transaction.dart';

Widget loadingTransactionTemplate(
    BuildContext context, ChosenMVPModel? chosenMVPModel) {
  return LayoutBuilder(builder: (context, constrain) {
    debugPrint("constrain:==${constrain.maxHeight}");
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[300]),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  //Header Card Gift Template
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: headerCardGiftTemplate(
                      context,
                      titleGiftTemplate: chosenMVPModel != null
                          ? chosenMVPModel.receiverName
                          : "",
                      acountNumGiftTemplate: chosenMVPModel != null
                          ? chosenMVPModel.receiverWallet
                          : "",
                      id: chosenMVPModel != null ? chosenMVPModel.id : 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Transaction History',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff848F92)),
                      ),
                    ),
                  ),
                  Divider(
                    //thickness: 1.2,
                    color: Colors.grey[400],
                    height: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * .15),
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ],
    );
  });
}
