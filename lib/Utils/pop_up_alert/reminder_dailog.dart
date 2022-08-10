import 'package:flutter/material.dart';

_showDivider() =>
    Divider(height: 0, color: Colors.black.withOpacity(0.4), thickness: 0.3);

showReminderDailog({
  required BuildContext context,
  String? title,
  String? content,
  String? actionTitle,
  String? cancelTitle,
  VoidCallback? onActioned,
  VoidCallback? onCanceled,
}) {
  return showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(14.0),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      title: Text(
        title ?? '',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              content ?? '',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  height: 1.8),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          _showDivider(),
          GestureDetector(
            onTap: onActioned ?? () {},
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              alignment: Alignment.center,
              child: Text(
                actionTitle ?? 'Accept',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff007AFF),
                    ),
              ),
            ),
          ),
          _showDivider(),
          GestureDetector(
            onTap: onCanceled ??
                () {
                  Navigator.pop(context);
                },
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              alignment: Alignment.center,
              child: Text(
                cancelTitle ?? 'Cancel',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff007AFF),
                  fontFamily: 'Poppin',
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
