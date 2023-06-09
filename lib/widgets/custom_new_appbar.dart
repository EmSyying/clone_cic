import 'dart:io';

import 'package:flutter/material.dart';

customNewAppBar({
  BuildContext? context,
  Widget? widgetTitle,
  String? title,
  Widget? leading,
  List<Widget>? action,
  Color? color,
}) {
  return AppBar(
    leading: leading ??
        IconButton(
          icon: Platform.isIOS
              ? const Icon(
                  Icons.arrow_back_ios,
                )
              : const Icon(
                  Icons.arrow_back,
                ),
          onPressed: () {
            Navigator.pop(context!);
          },
        ),
    title: widgetTitle ??
        Text(
          '$title',
          style: Theme.of(context!).textTheme.displayMedium!.copyWith(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
    actions: action,
    centerTitle: true,
    backgroundColor: color ?? Theme.of(context!).primaryColor,
  );
}
