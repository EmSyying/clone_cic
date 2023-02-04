import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void formatValueOnchange(
    {required String value,
    required TextEditingController controller,
    int maxLength = 10}) {
  String tempString = "";
  bool noCollape = false;
  bool isPlusOne = false;
  bool isPlusOnDel = false;
  int plusValue = 0;
  String formNum(String s) {
    return NumberFormat.decimalPattern().format(
      int.parse(s),
    );
  }

  if (tempString.length > value.length) {
    try {
      debugPrint('Backspace${tempString.length}=$value=${value.length}');

      if (value.isNotEmpty) {
        if (value.contains(".")) {
          var temp = value;
          var strList = value.split(".");
          strList[0] = formNum(
            strList[0].replaceAll(',', ''),
          );
          value = "${strList[0]}.${strList[1]}";
          if (temp.length > value.length) {
            isPlusOnDel = true;
            plusValue = value.length - temp.length;
          }
          debugPrint('plusValue$isPlusOnDel==${value.length}==${temp.length}');
          debugPrint(
              '$value==baseOffset${controller.selection.baseOffset}==${value.length}');
          try {
            controller.value = TextEditingValue(
                text: value,
                selection: TextSelection.fromPosition(TextPosition(
                    offset: isPlusOnDel
                        ? controller.selection.baseOffset - 1
                        : controller.selection.baseOffset)));
          } catch (e) {
            debugPrint('$e');
          }
        } else {
          if (value.length > maxLength) {
            var startLength = value.length - (maxLength + 1);
            value = value.replaceRange(
                (value.length - 1) - startLength, value.length, "");
          }
          value = formNum(
            value.replaceAll(',', ''),
          );
          controller.value = TextEditingValue(
              text: value,
              selection: TextSelection.collapsed(offset: value.length));
        }
      }

      tempString = value;
      return;
    } catch (e) {
      debugPrint('Ex==$e');
      return;
    }
  } else if (value.isNotEmpty) {
    debugPrint('Local${Platform.localeName}');

    if (Platform.localeName.contains("KH")) {
      if (value[value.length - 1].contains(",")) {
        value = value.replaceRange(value.length - 1, value.length, ".");
        debugPrint('value$value');
      }
    }

    try {
      if (!value.contains(".")) {
        if (value.length > maxLength && !value.contains(".")) {
          debugPrint('v0===${value.length}');

          value = value.replaceRange(value.length - 1, value.length, "");
          debugPrint('v===${value.length}');
        }
        value = formNum(
          value.replaceAll(',', ''),
        );
      } else {
        debugPrint('IsContain$value==${value[value.length - 1] != "."}');
        if (value[value.length - 1] != ".") {
          debugPrint('Hello');
          var temp = value;
          var strList = value.split(".");
          debugPrint('Hello1$strList');
          strList[0] = formNum(
            strList[0].replaceAll(',', ''),
          );

          debugPrint('Hello2${strList[0]}');

          value = "${strList[0]}.${strList[1]}";
          debugPrint('temp==${temp.length}value==${value.length}');
          if (value.length > temp.length) {
            isPlusOne = true;
            plusValue = value.length - temp.length;
          }
          debugPrint(
              "strList=${temp.length}==after${value.length},plus=$plusValue==$isPlusOne");

          noCollape = true;
        }
      }
    } catch (e) {
      debugPrint('EX$e');
    }
    if (value.contains("..")) {
      debugPrint('v0===$value');

      value = value.replaceRange(value.length - 1, value.length, "");
      debugPrint('v===$value');
    }

    if (value.contains(".,")) {
      debugPrint('v0===$value');

      value = value.replaceRange(value.length - 1, value.length, "");
      debugPrint('v===$value');
    }
    if (value.contains(".") && value[value.length - 1].contains(".")) {
      debugPrint('a0===$value');

      value = value.replaceRange(value.length - 1, value.length, ".");
      debugPrint('a===$value');
    }
    tempString = value;
    if (noCollape == false) {
      debugPrint('WORK');
      controller.value = TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(
          offset: value.length,
        ),
      );
    } else {
      debugPrint(
          'controller!=${controller.selection.baseOffset}==${isPlusOne ? 1 + controller.selection.baseOffset : controller.selection.baseOffset}');
      controller.value = TextEditingValue(
          text: value,
          selection: isPlusOne
              ? TextSelection.fromPosition(
                  TextPosition(offset: controller.selection.baseOffset + 1))
              : controller.selection);
    }
  } else {
    debugPrint('Empty');
  }
}
