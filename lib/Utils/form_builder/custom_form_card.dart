import 'package:flutter/material.dart';

class CustomFormCard extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final bool? isRadius;
  final Widget? child;
  const CustomFormCard(
      {Key? key, this.child, this.padding, this.isRadius = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(
                  0.0,
                  1.0,
                ),
                color: Colors.black12),
          ],
          color: Theme.of(context).cardColor,
          borderRadius: isRadius!
              ? null
              : const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
      child: child!,
    );
  }
}
