import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/helper/color.dart';

showCustomDialogTransactionDetail(
    {String? transactionDate,
    String? status,
    String? cashinFrom,
    String? accountName,
    String? accountNumber,
    String? amount}) {
  return showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          titlePadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          contentPadding: const EdgeInsets.all(0),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.47,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Transaction Detail",
                    style: TextStyle(
                        color: AppColor.textColor,
                        fontFamily: 'Poppin',
                        fontWeight: FontWeight.w800,
                        fontSize: 17),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  status!,
                  style: const TextStyle(
                      color: Colors.red,
                      fontFamily: 'Poppin',
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'ID:000999888',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(height: 30.0),
                if (transactionDate != "")
                  tranDetail(
                      title: "Transaction Date:", value: transactionDate),
                const SizedBox(height: 10.0),
                if (cashinFrom != "")
                  tranDetail(title: "Cash In From:", value: cashinFrom),
                const SizedBox(height: 10.0),
                if (accountName != "")
                  tranDetail(title: "Account Name:", value: accountName),
                const SizedBox(height: 10.0),
                if (accountNumber != "")
                  tranDetail(title: "Account Number:", value: accountNumber),
                const SizedBox(height: 35.0),
                if (amount != "")
                  tranDetail(
                      isAmount: true, title: "Amount:", value: "$amount USD"),
                const SizedBox(height: 50.0),
                CustomButton(
                  title: "Done",
                  isOutline: true,
                  isDisable: false,
                  onPressed: () {
                    //Done when user tap Done it will route to Bank gateway

                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      });
}

Widget tranDetail({String? title, String? value, bool? isAmount = false}) {
  return Row(
    children: [
      Text(
        title!,
        style: const TextStyle(
            color: AppColor.textColor,
            fontFamily: 'Poppin',
            fontWeight: FontWeight.w500,
            fontSize: 13),
      ),
      // Spacer(),
      // Text(
      //   value != "" ? value! : "",
      //   style: TextStyle(
      //       color: isAmount == true ? Colors.green : AppColor.textColor,
      //       fontFamily: 'Poppin',
      //       fontWeight: FontWeight.w400,
      //       fontSize: isAmount == true ? 18 : 13),
      // ),
    ],
  );
}
