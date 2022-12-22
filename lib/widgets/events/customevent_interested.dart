import 'package:flutter/material.dart';

class CustomEventInterested extends StatelessWidget {
  final String? title;
  final Widget? widget;
  const CustomEventInterested({Key? key, this.widget, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 46.0,
          width: 46.0,
          margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withAlpha(90),
              shape: BoxShape.circle),
          alignment: Alignment.center,
          child: widget!,
        ),
        Text(title!, style: Theme.of(context).textTheme.subtitle2)
      ],
    );
  }
}
