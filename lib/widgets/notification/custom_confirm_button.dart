import 'package:flutter/material.dart';

class CustomConfirmbutton extends StatelessWidget {
  final String? title;
  final GestureTapCallback? onTap;
  const CustomConfirmbutton({Key? key, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: title == 'Reject' ? null : Theme.of(context).primaryColor,
            border: title == 'Reject'
                ? Border.all(width: 1, color: Colors.grey)
                : null,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: title == 'Reject'
              ? Text(
                  title!,
                  style: const TextStyle(color: Colors.grey),
                )
              : Text(
                  title!,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
