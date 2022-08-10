import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

customSnackbar(
    {BuildContext? context,
    String? label,
    String? titleText,
    String? messageText,
    imgUrl,
    bool? isFailed = false,
    Color? color}) {
  return Get.snackbar("", "$label",
      borderRadius: 8,
      duration: const Duration(seconds: 2),
      backgroundColor: isFailed == true ? Colors.red : Colors.green,
      colorText: color,
      icon: isFailed == true
          ? const Icon(
              Icons.close,
              color: Colors.white,
            )
          : SvgPicture.asset('$imgUrl'),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
      overlayBlur: 3.0,
      titleText: Text(
        "$titleText",
        style: const TextStyle(color: Colors.white),
      ),
      messageText: Text(
        "$messageText",
        style: const TextStyle(color: Colors.white),
      ),
      snackStyle: SnackStyle.FLOATING);
}
