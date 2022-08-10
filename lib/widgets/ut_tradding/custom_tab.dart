import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTab extends StatelessWidget {
  final String? title;
  final bool? isSelect;
  final int? selectIndex;
  const CustomTab({Key? key, this.title, this.selectIndex, this.isSelect})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isSelect!
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor.withAlpha(40),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(0),
            ),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Text(
          title!,
          style: isSelect!
              ? TextStyle(color: Theme.of(context).primaryColor)
              : Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
