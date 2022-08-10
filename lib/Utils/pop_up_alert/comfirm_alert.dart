import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

onShowConfirmAlert(
    {BuildContext? context,
    GestureTapCallback? onPressed,
    String? title,
    String? content}) {
  kIsWeb
      ? showDialog(
          context: context!,
          builder: (BuildContext context) {
            return AlertDialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 18),
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: Text(
                title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppin',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // contentPadding: EdgeInsets.all(0),
              content: Text(content!),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
                    child: const Text(
                      'No',
                      style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onPressed,
                  child: Container(
                    margin: const EdgeInsets.only(
                        right: 10.0, bottom: 10.0, top: 10.0),
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            );
          },
        )
      : Platform.isIOS
          ? showCupertinoDialog(
              context: context!,
              builder: (context) {
                return Center(
                  child: CupertinoAlertDialog(
                    title: Text(
                      title!,
                    ),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(content!),
                    ),
                    actions: [
                      CupertinoButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoButton(
                        onPressed: onPressed,
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              })
          : showDialog(
              context: context!,
              builder: (BuildContext context) {
                return AlertDialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 18),
                  titlePadding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 20.0),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 0.0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppin',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // contentPadding: EdgeInsets.all(0),
                  content: Text(content!),
                  actions: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
                        child: const Text(
                          'No',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onPressed,
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: 10.0, bottom: 10.0, top: 10.0),
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
}
