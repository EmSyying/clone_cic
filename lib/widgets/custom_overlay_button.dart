import 'package:flutter/material.dart';

class CustomPopupButtonNew extends StatefulWidget {
  final int itemCount;
  final Widget child;
  final Widget Function(int index) itemBuilder;
  final Function(int index)? onSelected;

  final int? initialIndex;
  const CustomPopupButtonNew({
    super.key,
    required this.child,
    required this.itemBuilder,
    required this.itemCount,
    this.onSelected,
    this.initialIndex,
  });

  @override
  State<CustomPopupButtonNew> createState() => _CustomPopupButtonNewState();
}

class _CustomPopupButtonNewState extends State<CustomPopupButtonNew> {
  final List<String> optionDropdownStores = <String>[
    'All Stores',
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
          GestureDetector(
            onTap: () {
              overlay?.remove();
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
            ),
          ),
          Positioned(
            left: offset.dx - 135,
            top: offset.dy + renderBox.size.height + 10,
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                constraints: const BoxConstraints(
                  minWidth: 200,
                ),
                width: 200,
                padding: const EdgeInsets.symmetric(vertical: 10),
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
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      overlay?.remove();
                      widget.onSelected?.call(index);
                    },
                    child: widget.itemBuilder.call(index),
                  ),
                  separatorBuilder: (_, index) => const SizedBox.shrink(),
                  itemCount: widget.itemCount,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    overlayState = Overlay.of(context, rootOverlay: true);
    overlayState.insert(overlay);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _show();
      },
      child: SizedBox(
        key: _globalKey,
        child: widget.child,
      ),
    );
  }
}
