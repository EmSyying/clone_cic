import 'package:cicgreenloan/widgets/ut_tradding/custom_tab.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final List<CustomTab>? item;
  final Function? onTap;
  final int? index;
  const CustomTabBar({Key? key, this.item, this.onTap, this.index})
      : super(key: key);
  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.item!.asMap().entries.map((e) {
          return Expanded(
              child: GestureDetector(
            onTap: () {
              widget.onTap!(e.key);
            },
            child: CustomTab(
              selectIndex: e.key,
              isSelect: widget.index == e.key,
              title: e.value.title.toString(),
            ),
          ));
        }).toList(),
      ),
    );
  }
}
