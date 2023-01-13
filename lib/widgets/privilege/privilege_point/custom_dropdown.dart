import 'package:flutter/material.dart';

import '../../../Utils/helper/color.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  final List<String> optionDropdownStores = <String>[
    'All',
    'Discount',
    'MVP Approved',
  ];
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
                      .map((e) => customOptionStores(
                            context,
                            title: e,
                            onTapOptionStore: () {},
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
    overlayState?.insert(overlay);
    // overlayState.
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
            'All Stores',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
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

  Widget customOptionStores(BuildContext context,
      {String? title, Function()? onTapOptionStore}) {
    return GestureDetector(
      onTap: onTapOptionStore,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
        child: Row(
          children: [
            Text(
              '$title',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
            ),
            const Spacer(),
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
