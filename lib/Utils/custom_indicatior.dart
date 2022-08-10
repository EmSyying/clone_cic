import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  final bool? isSelect;
  const CustomIndicator({Key? key, this.isSelect}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 5,
      width: isSelect! ? 20 : 5,
      decoration: BoxDecoration(
          color: isSelect!
              ? Theme.of(context).primaryColor
              : const Color(0xffBDBDBD),
          borderRadius: BorderRadius.circular(8)),
    );
    // : Container(
    //     margin: const EdgeInsets.symmetric(horizontal: 5),
    //     height: 5,
    //     width: 5,
    //     decoration: const BoxDecoration(
    //         shape: BoxShape.circle, color: Color(0xffBDBDBD)),
    //   );
  }
}
