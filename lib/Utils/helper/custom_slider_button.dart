import 'package:flutter/material.dart';

class CustomSliderbutton extends StatelessWidget {
  ///switch width
  final double width;

  ///switch heigh
  final double heigh;

  ///padding inside circle
  final double? thumbPadding;

  ///margin hirizional of circle
  final double thumbMargin;

  ///circle color
  final Color? thumbColor;

  ///true value color
  final Color? activeColor;

  ///false value color
  final Color? inactiveColor;

  ///current value of switch true/false
  final bool? value;

  ///border style of button
  final BoxBorder? border;

  ///void function that return value of boolean
  final ValueChanged<bool> onchange;

  ///The widget that you placed inside circle thumb
  final Widget? widget;

  ///circle radius
  final double radius;
  const CustomSliderbutton({
    Key? key,
    required this.onchange,
    this.width = 50,
    this.heigh = 20,
    this.radius = 25,
    this.widget,
    this.thumbColor,
    this.activeColor,
    this.inactiveColor,
    this.thumbPadding,
    this.thumbMargin = 0,
    this.border,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onchange(value!);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: heigh,
            width: width,
            decoration: BoxDecoration(
              color: value!
                  ? (activeColor ?? Theme.of(context).primaryColor)
                  : (inactiveColor ?? Colors.grey[300]),
              border: border,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: Offset(1, 1)),
              ],
            ),
          ),
          SizedBox(
            width: width,
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width:
                      value! ? width - radius - thumbMargin : 0 + thumbMargin,
                ),
                Container(
                  height: radius,
                  width: radius,
                  padding: EdgeInsets.all(thumbPadding ?? 0),
                  decoration: BoxDecoration(
                      color: thumbColor ?? Colors.white,
                      shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: FittedBox(child: widget),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
