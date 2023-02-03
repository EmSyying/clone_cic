import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? title;
  final Widget? icon;
  const CustomMenu({Key? key, this.onTap, this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          icon!,
          const SizedBox(width: 10),
          Text(
            title!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
