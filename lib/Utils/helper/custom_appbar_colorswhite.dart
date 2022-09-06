import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: non_constant_identifier_names
CustomAppBarWhiteColor({
  BuildContext? context,
  Widget? leading,
  List<Widget>? action,
  String? title,
  Widget? widgetTitle,
  String? subtitle,
  Color? backgroundColor,
  double? elevation,
}) {
  return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      shadowColor: Colors.grey,
      elevation: elevation ?? 1.0,
      actions: action,
      backgroundColor: backgroundColor ?? Colors.white,
      leading: leading ??
          IconButton(
              icon: kIsWeb
                  ? const Icon(Icons.arrow_back)
                  : Platform.isAndroid
                      ? const Icon(Icons.arrow_back)
                      : const Icon(Icons.arrow_back_ios),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context!);
              }),
      title: widgetTitle ??
          Column(
            children: [
              Text(
                title ?? '',
                style: const TextStyle(color: Colors.black),
              ),
              if (subtitle == "Rejected" ||
                  subtitle == "Approved" ||
                  subtitle == "Review")
                Text(
                  subtitle!,
                  style: TextStyle(
                      fontSize: 12,
                      color: subtitle == "Rejected"
                          ? const Color(0xffED1E26)
                          : subtitle == "Review"
                              ? const Color(0xffE28112)
                              : const Color(0xff75BF72)),
                ),
            ],
          ),
      systemOverlayStyle: SystemUiOverlayStyle.dark);
}
