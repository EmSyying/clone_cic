import 'package:flutter/material.dart';

class KeyboardKey extends StatefulWidget {
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;

  const KeyboardKey({
    Key? key,
    required this.label,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  @override
  KeyboardKeyState createState() => KeyboardKeyState();
}

class KeyboardKeyState extends State<KeyboardKey> {
  renderLabel() {
    if (widget.label is Widget) {
      return widget.label;
    }

    return Text(
      widget.label,
      style: Theme.of(context).textTheme.headline2!.copyWith(
          color: const Color(0xff5A5A5A),
          fontSize: 30,
          fontWeight: FontWeight.w500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const RoundedRectangleBorder(),
      child: InkWell(
        onTap: () {
          widget.onTap(widget.value);
        },
        child: Ink(
          child: AspectRatio(
            aspectRatio: 2,
            child: Center(
              child: renderLabel(),
            ),
          ),
        ),
      ),
    );
  }
}
