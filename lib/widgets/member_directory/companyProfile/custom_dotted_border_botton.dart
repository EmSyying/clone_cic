import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomDottedBotton extends StatelessWidget {
  final String? title;
  final GestureDoubleTapCallback? onTap;
  const CustomDottedBotton({Key? key, this.title, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            bottom: 0,
            child: DottedBorder(
              borderType: BorderType.RRect,
              color: Theme.of(context).primaryColor,
              radius: const Radius.circular(10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100]),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$title',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
