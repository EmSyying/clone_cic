import 'package:flutter/material.dart';

class CustomChips extends StatelessWidget {
  final String? title;
  final int? currentIndex;
  final int? selectIndex;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool? isInvest;
  const CustomChips(
      {Key? key,
      this.title,
      this.isInvest = false,
      this.currentIndex,
      this.selectIndex,
      this.margin,
      this.padding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
          color: currentIndex == selectIndex
              ? const Color(0xffB3C6E0)
              : isInvest == true
                  ? Colors.white
                  : Colors.grey[300],
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          title ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: currentIndex == selectIndex
                  ? Theme.of(context).primaryColor
                  : isInvest == true
                      ? Colors.grey[600]
                      : Colors.black),
        ),
      ),
    );
  }
}
