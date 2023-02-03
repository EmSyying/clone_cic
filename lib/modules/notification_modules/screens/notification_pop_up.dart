import 'package:flutter/material.dart';

showAlertDialog({
  BuildContext? context,
  String? buttonName,
  String? title,
  String? content,
  String? notificationType,
  GestureTapCallback? onTap,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context!,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 18),
        titlePadding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        contentPadding: const EdgeInsets.all(0),
        title: Text(
          "$title",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Poppin',
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: SingleChildScrollView(
          // width: double.infinity,
          // height: 155.0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    "$content",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppin',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.black,
                  thickness: 0.2,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 50.0,
                    margin: const EdgeInsets.only(
                        bottom: 20.0, left: 20.0, right: 20.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(
                      child: Text(
                        buttonName!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppin',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
