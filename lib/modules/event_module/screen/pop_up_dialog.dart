import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../Utils/helper/color.dart';

onShowChoice(BuildContext context, Function onTap) {
  return kIsWeb
      ? showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox(
              height: 210,
              width: double.infinity,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      onTap('share event');
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          "Share this event",
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            color: AppColor.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  InkWell(
                    onTap: () {
                      onTap('Add to calendar');
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          "Add to calendar",
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            color: AppColor.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  GestureDetector(
                    onTap: () {
                      onTap('Contact to organiser');
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          "Contact organiser",
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            color: AppColor.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            color: AppColor.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          })
      : Platform.isAndroid
          ? showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 210,
                  width: double.infinity,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          onTap('share event');
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              "Share this event",
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                color: AppColor.mainColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                      ),
                      InkWell(
                        onTap: () {
                          onTap('Add to calendar');
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              "Add to calendar",
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                color: AppColor.mainColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                      ),
                      InkWell(
                        onTap: () {
                          onTap('Contact to organiser');
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              "Contact organiser",
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                color: AppColor.mainColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                color: AppColor.mainColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              })
          : showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () {
                        onTap('share event');
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Share this event",
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16,
                          color: AppColor.mainColor,
                        ),
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        onTap('Add to calendar');
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Add to calendar",
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16,
                          color: AppColor.mainColor,
                        ),
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        onTap('Contact to organiser');
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Contact to organiser",
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16,
                          color: AppColor.mainColor,
                        ),
                      ),
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 16,
                        color: AppColor.mainColor,
                      ),
                    ),
                  ),
                );
              },
            );
}
