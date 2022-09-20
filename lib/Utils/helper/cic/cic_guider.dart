// ignore_for_file: invalid_use_of_protected_member

import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

double _getContentPossitioned(Offset offset, BuildContext context,
        double objHeight, double contentheight) =>
    offset.dy < MediaQuery.of(context).size.height * 0.5
        ? offset.dy + objHeight
        : offset.dy - 25 - contentheight;

// Widget widgetbuilder ()=>

/*extension MyOverlay on BuildContext {
  void showOverlay({
    List<GlobalKey>? keys,
    double padding = 10,
    String Function(int index)? titleBuilder,
    String Function(int index)? descriptionBuilder,
    OverlaySetting? overlaySetting,
  }) {
    overlayState = Overlay.of(this);
    int i = 0;
    GlobalKey<State<StatefulWidget>> getkey;
    getkey = keys![0];
    offset = _getRenderBox(getkey).localToGlobal(Offset.zero);
    size = _getRenderBox(getkey).size;

    bool _hasOverlaySetting() => overlaySetting != null ? true : false;

    Duration _duration() =>
        _hasOverlaySetting() && overlaySetting!.duration != null
            ? overlaySetting.duration!
            : const Duration(milliseconds: 500);

    overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            overlayEntry!.remove();
          },
          child: Stack(
            children: [
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  /// Mask layer color
                  Colors.black38,
                  BlendMode.srcOut,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        backgroundBlendMode: BlendMode.dstOut,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: _duration(),
                      top: offset!.dy - padding / 2,
                      left: offset!.dx - 10 / 2,
                      child: AnimatedContainer(
                        duration: _duration(),
                        width: size!.width + 10,
                        height: size!.height + padding,

                        /// Any color

                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              /* AnimatedPositioned(
                  top: offset!.dy - 50,
                  left: offset!.dx + 5,
                  duration: _duration(),
                  child: LottieBuilder.asset(
                    'assets/svg/white_arrow_down.json',
                    width: 50,
                  )),*/
              AnimatedPositioned(
                duration: _duration(),
                top: _getContentTopPossitioned(offset!, context),
                left: 20,
                child: AnimatedContainer(
                  duration: _duration(),
                  width: MediaQuery.of(context).size.width - 40,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        titleBuilder?.call(i) ?? '',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff121212),
                          shadows: [
                            const Shadow(color: Colors.grey, blurRadius: 1),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        descriptionBuilder?.call(i) ?? '',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w200,
                          color: const Color(0xff121212),
                          shadows: [
                            const Shadow(color: Colors.grey, blurRadius: 1),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                side: BorderSide.none,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                if (i > 0) {
                                  i--;
                                  getkey = keys[i];
                                  offset = _getRenderBox(getkey)
                                      .localToGlobal(Offset.zero);
                                  size = _getRenderBox(getkey).size;
                                  overlayState!.setState(() {});
                                } else {
                                  overlayEntry!.remove();
                                }
                              },
                              child: Text(i == 0 ? 'Skip' : 'Back')),
                          const Spacer(),
                          ElevatedButton(
                              onPressed: () {
                                if (i < keys.length - 1) {
                                  i++;
                                  getkey = keys[i];
                                  offset = _getRenderBox(getkey)
                                      .localToGlobal(Offset.zero);
                                  size = _getRenderBox(getkey).size;
                                  overlayState!.setState(() {});
                                } else {
                                  overlayEntry!.remove();
                                }
                              },
                              child: Text(
                                  i == keys.length - 1 ? 'Finish' : 'Next'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    overlayState!.insert(overlayEntry!);
  }
}*/

class CiCApp {
  // static BuildContext context =
  //     router.routerDelegate.navigatorKey.currentState!.context;

  /* static void showOverlay({
    required BuildContext context,
    required GlobalKey key,
    double padding = 10,
    String? title,
    String? description,
    OverlaySetting? overlaySetting,
  }) {
    overlayState = Overlay.of(context);

    GlobalKey<State<StatefulWidget>> getkey;
    getkey = key;
    offset = _getRenderBox(getkey).localToGlobal(Offset.zero);
    size = _getRenderBox(getkey).size;

    bool _hasOverlaySetting() => overlaySetting != null ? true : false;

    Duration _duration() =>
        _hasOverlaySetting() && overlaySetting!.duration != null
            ? overlaySetting.duration!
            : const Duration(milliseconds: 500);
    double objectHeight = size!.width + padding;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            overlayEntry!.remove();
          },
          child: Stack(
            children: [
              ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  /// Mask layer color
                  Colors.black,
                  BlendMode.srcOut,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        backgroundBlendMode: BlendMode.dstOut,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: _duration(),
                      top: offset!.dy - padding / 2,
                      left: offset!.dx - 10 / 2,
                      child: AnimatedContainer(
                        duration: _duration(),
                        width: size!.width + padding,
                        height: size!.height + padding,

                        /// Any color

                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              /* AnimatedPositioned(
                  top: offset!.dy - 50,
                  left: offset!.dx + 5,
                  duration: _duration(),
                  child: LottieBuilder.asset(
                    'assets/svg/white_arrow_down.json',
                    width: 50,
                  )),*/
              AnimatedPositioned(
                duration: _duration(),
                top: _getContentTopPossitioned(offset!, context, objectHeight),
                left: 20,
                child: AnimatedContainer(
                  duration: _duration(),
                  width: MediaQuery.of(context).size.width - 40,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title ?? '',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w300,
                          color: AppColor.mainColor,
                          shadows: [
                            const Shadow(color: Colors.grey, blurRadius: 1),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        description ?? '',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w200,
                          color: const Color(0xff121212),
                          shadows: [
                            const Shadow(color: Colors.grey, blurRadius: 1),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                side: BorderSide.none,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {},
                              child: const Text('Skip')),
                          const Spacer(),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('Done'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    overlayState!.insert(overlayEntry!);
  }*/

  ///[CiCApp] Get widget RenderBox by it's Key.
  static RenderBox getRenderBox(GlobalKey key) =>
      key.currentContext!.findRenderObject() as RenderBox;

  ///[CiCApp] Get Widget Size by it's key.
  static Size getSize(GlobalKey key) => getRenderBox(key).size;

  ///[CiCApp] Get Widget Offset by It's Key.
  ///Offset by key..localToGlobal(Offset.zero);
  static Offset getOffset(GlobalKey key) =>
      getRenderBox(key).localToGlobal(Offset.zero);

  ///Show Multiple OverLays
  static Future<void> showOverlays({
    required BuildContext context,
    required GlobalKey Function(int index) key,
    required int itemCount,
    String Function(int index)? titleBuilder,
    String Function(int index)? descriptionBuilder,
    OverlaySetting? overlaySetting,
    bool allowSkip = true,
  }) async {
    OverlayState? overlayState;
    OverlayEntry? overlayEntry;

    int i = 0;
    GlobalKey<State<StatefulWidget>> getKey = key(i);

    Size size = getRenderBox(getKey).size;

    Offset offset = getOffset(getKey);

    double objectHeight = size.height;
    GlobalKey contentKey = GlobalKey();
    double contentheight = 0;

    overlayState = Overlay.of(context);

    Future.delayed(const Duration(milliseconds: 500), () {
      contentheight = getSize(contentKey).height;
      overlayState!.setState(() {});
    });

    void _updateState() {
      getKey = key(i);
      offset = getOffset(getKey);
      size = getRenderBox(getKey).size;
      objectHeight = size.height;

      overlayState!.setState(() {});

      Future.delayed(const Duration(milliseconds: 200), () {
        contentheight = getSize(contentKey).height;
        overlayState!.setState(() {});
      });
    }

    bool _hasOverlaySetting() => overlaySetting != null ? true : false;

    Duration _duration() =>
        _hasOverlaySetting() && overlaySetting!.duration != null
            ? overlaySetting.duration!
            : const Duration(milliseconds: 200);

    void _tapBack() {
      if (i > 0) {
        i--;
        _updateState();
      }
    }

    void _tapNext() {
      if (i < itemCount - 1) {
        i++;
        _updateState();
      } else {
        overlayEntry!.remove();
      }
    }

    double _padding() =>
        _hasOverlaySetting() ? overlaySetting!.padding ?? 10 : 10;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            // overlayEntry!.remove();
          },
          child: Stack(
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  /// Mask layer color
                  Colors.black.withOpacity(0.7),
                  BlendMode.srcOut,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        backgroundBlendMode: BlendMode.dstOut,
                      ),
                    ),
                    AnimatedPositioned(
                      duration: _duration(),
                      top: offset.dy - _padding() / 2,
                      left: offset.dx - _padding() / 2,
                      child: AnimatedContainer(
                        duration: _duration(),
                        width: size.width + _padding(),
                        height: size.height + _padding(),

                        /// Any color

                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ///
              AnimatedPositioned(
                  top: offset.dy - (_padding() / 2) - 50,
                  left: offset.dx + (size.width / 2) - 25,
                  duration: _duration(),
                  child: ColoredBox(
                    color: Colors.transparent,
                    child: LottieBuilder.asset(
                      'assets/images/animation/white_arrow_down.json',
                      // animate: false,
                      width: 50,
                      height: 50,
                    ),
                  )),

              ///
              AnimatedPositioned(
                key: contentKey,
                duration: _duration(),
                top: _getContentPossitioned(
                    offset, context, objectHeight, contentheight),
                left: 20,
                child: AnimatedContainer(
                  duration: _duration(),
                  width: MediaQuery.of(context).size.width - 40,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Material(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                titleBuilder?.call(i) ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: AppColor.mainColor,
                                    ),
                              ),
                            ),
                            Text(
                              '${i + 1}/$itemCount',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColor.chartLabelColor,
                                  ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          descriptionBuilder?.call(i) ?? '',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColor.darkColor,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            if (allowSkip)
                              GestureDetector(
                                onTap: () {
                                  overlayEntry!.remove();
                                },
                                child: Text(
                                  'Skip',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.mainColor,
                                      ),
                                ),
                              ),
                            const Spacer(),
                            if (i > 0)
                              GestureDetector(
                                onTap: _tapBack,
                                child: Text(
                                  'Back',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.chartLabelColor,
                                      ),
                                ),
                              ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: _tapNext,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: AppColor.mainColor,
                                    borderRadius: BorderRadius.circular(6)),
                                child: Text(
                                  i == itemCount - 1 ? 'Done' : 'Next',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    overlayState!.insert(overlayEntry);
  }
}

class OverlaySetting {
  double? padding;

  Duration? duration;

  Curve? curves;

  bool dismisable;

  OverlaySetting({
    this.padding,
    this.duration,
    this.curves = Curves.linear,
    this.dismisable = true,
  });
}
