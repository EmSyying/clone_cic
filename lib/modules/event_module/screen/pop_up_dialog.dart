import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
                      child: Center(
                        child: Text(
                          "Share this event",
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
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
                      child: Center(
                        child: Text(
                          "Add to calendar",
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
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
                      child: Center(
                        child: Text(
                          "Contact organiser",
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
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
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
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
                          child: Center(
                            child: Text(
                              "Share this event",
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
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
                          child: Center(
                            child: Text(
                              "Add to calendar",
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
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
                          child: Center(
                            child: Text(
                              "Contact organiser",
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
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
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
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
                      child: Text(
                        "Share this event",
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        onTap('Add to calendar');
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Add to calendar",
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        onTap('Contact to organiser');
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Contact to organiser",
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                );
              },
            );
}
