import 'package:flutter/material.dart';

import '../../../Utils/helper/color.dart';

class CustomDropDownbutton extends StatefulWidget {
  final Function(String text)? onSelected;
  final int? initialIndex;
  const CustomDropDownbutton({super.key, this.onSelected, this.initialIndex});

  @override
  State<CustomDropDownbutton> createState() => _CustomDropDownbuttonState();
}

class _CustomDropDownbuttonState extends State<CustomDropDownbutton> {
  final List<String> optionDropdownStores = <String>[
    'All Stores',
    'Discount',
    'MVP Approved',
  ];

  int selectedIndex = 0;
  final _globalKey = GlobalKey();
  void _show() {
    RenderBox renderBox =
        _globalKey.currentContext!.findRenderObject() as RenderBox;

    Offset offset = renderBox.localToGlobal(Offset.zero);
    OverlayState? overlayState;
    OverlayEntry? overlay;
    overlay = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                overlay?.remove();
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            left: offset.dx,
            top: offset.dy + renderBox.size.height + 10,
            child: Material(
              child: Container(
                width: 201,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 0),
                      blurRadius: 4,
                      spreadRadius: -1,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: optionDropdownStores
                      .asMap()
                      .entries
                      .map((e) => customOptionStores(
                            context,
                            title: e.value,
                            selected: selectedIndex == e.key,
                            onTapOptionStore: () {
                              selectedIndex = e.key;

                              widget.onSelected?.call(e.value);
                              setState(() {});
                              overlay?.remove();
                            },
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    overlayState = Overlay.of(context, rootOverlay: true);
    overlayState.insert(overlay);
    // overlayState.
  }

  @override
  void initState() {
    if (widget.initialIndex != null &&
        widget.initialIndex! > 0 &&
        widget.initialIndex! <= optionDropdownStores.length) {
      selectedIndex = widget.initialIndex!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _show();
      },
      child: Row(
        key: _globalKey,
        children: <Widget>[
          Text(
            optionDropdownStores[selectedIndex],
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColor.chartLabelColor,
                ),
          ),
          const SizedBox(
            width: 2.0,
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget customOptionStores(
    BuildContext context, {
    String? title,
    bool selected = false,
    Function()? onTapOptionStore,
  }) {
    return GestureDetector(
      onTap: onTapOptionStore,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
        child: Row(
          children: [
            Text(
              '$title',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
            ),
            const Spacer(),
            if (selected)
              const Icon(
                Icons.check,
                size: 16,
                color: AppColor.mainColor,
              ),
          ],
        ),
      ),
    );
  }
}
