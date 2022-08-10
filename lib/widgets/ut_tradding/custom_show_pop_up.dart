import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';

import '../../Utils/helper/color.dart';

showPopUpBuyRequest({
  BuildContext? context,
  String? description,
  int? utValume,
  double? utPrice,
  String? operation,
}) {
  return showDialog(
      barrierDismissible: false,
      context: context!,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return AlertDialog(
              insetPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              contentPadding: const EdgeInsets.all(0),
              content: Container(
                height: description != '' ? 280.0 : 215.0,
                width: MediaQuery.of(context).size.width * 0.9,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        operation == 'buy' ? 'Buy Request' : 'Sell Request',
                        style: const TextStyle(
                            color: AppColor.textColor,
                            fontFamily: 'Poppin',
                            fontWeight: FontWeight.w800,
                            fontSize: 17),
                      ), //fontFamily: 'Poppin',fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          'UT Volume',
                          style: TextStyle(
                              color: AppColor.textColor,
                              fontFamily: 'Poppin',
                              fontWeight: FontWeight.w800,
                              fontSize: 14),
                        ),
                        const Spacer(),
                        Text(
                          '${utValume!}',
                          style: const TextStyle(
                              color: AppColor.textColor,
                              fontFamily: 'Poppin',
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          'UT Price',
                          style: TextStyle(
                              color: AppColor.textColor,
                              fontFamily: 'Poppin',
                              fontWeight: FontWeight.w800,
                              fontSize: 14),
                        ),
                        const Spacer(),
                        Text(
                          '\$${utPrice!}',
                          style: const TextStyle(
                              color: AppColor.textColor,
                              fontFamily: 'Poppin',
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(
                      height: 0,
                      thickness: 1,
                      endIndent: 0,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    if (description != '')
                      const Flexible(
                        child: Text(
                          'Description',
                          style: TextStyle(
                              color: AppColor.textColor,
                              fontFamily: 'Poppin',
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (description != '')
                      Text(
                        description!,
                        style: const TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Poppin',
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    if (description != '') const Spacer(),
                    CustomButton(
                        isDisable: false,
                        onPressed: () => Get.back(),
                        isOutline: true,
                        title: 'Close')
                  ],
                ),
              ));
        });
      });
}
