// // ignore_for_file: invalid_use_of_protected_member

// import 'package:cicgreenloan/utils/helper/color.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class CiCApp {
//   static double _getContentPossitioned(Offset offset, BuildContext context,
//           double objHeight, double contentheight) =>
//       offset.dy < MediaQuery.of(context).size.height * 0.5
//           ? offset.dy + objHeight + 15
//           : offset.dy - 25 - contentheight;

//   ///[CiCApp] Get widget RenderBox by it's Key.
//   static RenderBox getRenderBox(GlobalKey key) =>
//       key.currentContext!.findRenderObject() as RenderBox;

//   ///[CiCApp] Get Widget Size by it's key.
//   static Size getSize(GlobalKey key) => getRenderBox(key).size;

//   ///[CiCApp] Get Widget Offset by It's Key.
//   ///Offset by key..localToGlobal(Offset.zero);
//   static Offset getOffset(GlobalKey key) =>
//       getRenderBox(key).localToGlobal(Offset.zero);

//   ///[ CiCApp ] Show OverLays Guidline
//   static Future<void> showOverlays({
//     required BuildContext context,
//     required int itemCount,
//     required GlobalKey Function(int index) key,
//     String Function(int index)? titleBuilder,
//     String Function(int index)? descriptionBuilder,
//     OverlaySetting? overlaySetting,
//     bool allowSkip = true,
//   }) async {
//     OverlayState? overlayState;
//     OverlayEntry? overlayEntry;

//     int i = 0;
//     GlobalKey<State<StatefulWidget>> getKey = key(i);

//     Size size = getRenderBox(getKey).size;

//     Offset offset = getOffset(getKey);

//     double objectHeight = size.height;
//     GlobalKey contentKey = GlobalKey();
//     double contentheight = 0;

//     overlayState = Overlay.of(context);

//     Future.delayed(const Duration(milliseconds: 500), () {
//       contentheight = getSize(contentKey).height;
//       overlayState!.setState(() {});
//     });

//     void _updateState() {
//       getKey = key(i);
//       offset = getOffset(getKey);
//       size = getRenderBox(getKey).size;
//       objectHeight = size.height;

//       overlayState!.setState(() {});

//       Future.delayed(const Duration(milliseconds: 200), () {
//         contentheight = getSize(contentKey).height;
//         overlayState!.setState(() {});
//       });
//     }

//     bool _hasOverlaySetting() => overlaySetting != null ? true : false;

//     Duration _duration() =>
//         _hasOverlaySetting() && overlaySetting!.duration != null
//             ? overlaySetting.duration!
//             : const Duration(milliseconds: 200);

//     void _tapBack() {
//       if (i > 0) {
//         i--;
//         _updateState();
//       }
//     }

//     void _tapNext() {
//       if (i < itemCount - 1) {
//         i++;
//         _updateState();
//       } else {
//         overlayEntry!.remove();
//       }
//     }

//     double _padding() =>
//         _hasOverlaySetting() ? overlaySetting!.padding ?? 10 : 10;

//     overlayEntry = OverlayEntry(
//       builder: (context) {
//         return GestureDetector(
//           onTap: () {
//             // overlayEntry!.remove();
//           },
//           child: Stack(
//             children: [
//               ColorFiltered(
//                 colorFilter: ColorFilter.mode(
//                   /// Mask layer color
//                   Colors.black.withOpacity(0.7),
//                   BlendMode.srcOut,
//                 ),
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: double.infinity,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         backgroundBlendMode: BlendMode.dstOut,
//                       ),
//                     ),
//                     AnimatedPositioned(
//                       duration: _duration(),
//                       top: offset.dy - _padding() / 2,
//                       left: offset.dx - _padding() / 2,
//                       child: AnimatedContainer(
//                         duration: _duration(),
//                         width: size.width + _padding(),
//                         height: size.height + _padding(),

//                         /// Any color

//                         decoration: BoxDecoration(
//                           // shape: BoxShape.circle,
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(
//                               _hasOverlaySetting()
//                                   ? overlaySetting!.radius ?? 8
//                                   : 8),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               ///
//               AnimatedPositioned(
//                 top: offset.dy - (_padding() / 2) - 50,
//                 left: offset.dx + (size.width / 2) - 25,
//                 duration: _duration(),
//                 child: ColoredBox(
//                   color: Colors.transparent,
//                   child: LottieBuilder.asset(
//                     'assets/images/animation/white_arrow_down.json',
//                     // animate: false,
//                     width: 50,
//                     height: 50,
//                   ),
//                 ),
//               ),

//               ///
//               AnimatedPositioned(
//                 key: contentKey,
//                 duration: _duration(),
//                 top: _getContentPossitioned(offset, context,
//                     objectHeight + (_padding() / 2), contentheight),
//                 left: 20,
//                 child: AnimatedContainer(
//                   duration: _duration(),
//                   width: MediaQuery.of(context).size.width - 40,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Material(
//                     color: Colors.white,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 titleBuilder?.call(i) ?? '',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .titleMedium!
//                                     .copyWith(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 16,
//                                       color: Theme.of(context).primaryColor,
//                                     ),
//                               ),
//                             ),
//                             if (itemCount > 1)
//                               Text(
//                                 '${i + 1}/$itemCount',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .titleMedium!
//                                     .copyWith(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 14,
//                                       color: AppColor.chartLabelColor,
//                                     ),
//                               )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),

//                         ///
//                         if (descriptionBuilder != null)
//                           Text(
//                             descriptionBuilder.call(i),
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleMedium!
//                                 .copyWith(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14,
//                                   color: AppColor.darkColor,
//                                 ),
//                           ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             if (allowSkip || itemCount > 1)
//                               GestureDetector(
//                                 onTap: () {
//                                   overlayEntry!.remove();
//                                 },
//                                 child: Text(
//                                   'Skip',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium!
//                                       .copyWith(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w400,
//                                         color: Theme.of(context).primaryColor,
//                                       ),
//                                 ),
//                               ),
//                             const Spacer(),
//                             if (i > 0 && itemCount > 1)
//                               GestureDetector(
//                                 onTap: _tapBack,
//                                 child: Text(
//                                   'Back',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium!
//                                       .copyWith(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w400,
//                                         color: AppColor.chartLabelColor,
//                                       ),
//                                 ),
//                               ),
//                             const SizedBox(width: 15),
//                             GestureDetector(
//                               onTap: _tapNext,
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 10, horizontal: 20),
//                                 decoration: BoxDecoration(
//                                     color: Theme.of(context).primaryColor,
//                                     borderRadius: BorderRadius.circular(6)),
//                                 child: Text(
//                                   i == itemCount - 1 ? 'Done' : 'Next',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium!
//                                       .copyWith(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w700,
//                                         color: Colors.white,
//                                       ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );

//     overlayState!.insert(overlayEntry);
//   }

//   ///[ CiCApp ] Show OverLays Guidline (work with Padding)
//   static Future<void> showOverlay({
//     required BuildContext context,
//     required int itemCount,
//     required GlobalKey Function(int index) key,
//     String Function(int index)? titleBuilder,
//     String Function(int index)? descriptionBuilder,
//     OverlaySetting? overlaySetting,
//     bool allowSkip = true,
//   }) async {
//     OverlayState? overlayState;
//     OverlayEntry? overlayEntry;

//     int i = 0;
//     GlobalKey<State<StatefulWidget>> getKey = key(i);

//     Size size = getRenderBox(getKey).size;

//     Offset offset = getOffset(getKey);

//     double objectHeight = size.height;
//     GlobalKey contentKey = GlobalKey();
//     double contentheight = 0;

//     overlayState = Overlay.of(context);

//     Future.delayed(const Duration(milliseconds: 500), () {
//       contentheight = getSize(contentKey).height;
//       overlayState!.setState(() {});
//     });

//     void _updateState() {
//       getKey = key(i);
//       offset = getOffset(getKey);
//       size = getRenderBox(getKey).size;
//       objectHeight = size.height;

//       overlayState!.setState(() {});

//       Future.delayed(const Duration(milliseconds: 200), () {
//         contentheight = getSize(contentKey).height;
//         overlayState!.setState(() {});
//       });
//     }

//     bool _hasOverlaySetting() => overlaySetting != null ? true : false;

//     Duration _duration() =>
//         _hasOverlaySetting() && overlaySetting!.duration != null
//             ? overlaySetting.duration!
//             : const Duration(milliseconds: 200);

//     void _tapBack() {
//       if (i > 0) {
//         i--;
//         _updateState();
//       }
//     }

//     void _tapNext() {
//       if (i < itemCount - 1) {
//         i++;
//         _updateState();
//       } else {
//         overlayEntry!.remove();
//       }
//     }

//     double _padding() =>
//         _hasOverlaySetting() ? overlaySetting!.padding ?? 10 : 10;

//     overlayEntry = OverlayEntry(
//       builder: (context) {
//         return GestureDetector(
//           onTap: () {
//             // overlayEntry!.remove();
//           },
//           child: Stack(
//             children: [
//               ColorFiltered(
//                 colorFilter: ColorFilter.mode(
//                   /// Mask layer color
//                   Colors.black.withOpacity(0.7),
//                   BlendMode.srcOut,
//                 ),
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: double.infinity,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         backgroundBlendMode: BlendMode.dstOut,
//                       ),
//                     ),
//                     AnimatedPositioned(
//                       duration: _duration(),
//                       top: offset.dy - _padding() / 2,
//                       left: offset.dx - _padding() / 2,
//                       child: AnimatedContainer(
//                         duration: _duration(),
//                         width: size.width + _padding(),
//                         height: size.height + _padding(),

//                         /// Any color

//                         decoration: BoxDecoration(
//                           // shape: BoxShape.circle,
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(
//                               _hasOverlaySetting()
//                                   ? overlaySetting!.radius ?? 8
//                                   : 8),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               ///
//               AnimatedPositioned(
//                 top: offset.dy - (_padding() / 2) - 50,
//                 left: offset.dx + (size.width / 2) - 25,
//                 duration: _duration(),
//                 child: ColoredBox(
//                   color: Colors.transparent,
//                   child: LottieBuilder.asset(
//                     'assets/images/animation/white_arrow_down.json',
//                     // animate: false,
//                     width: 50,
//                     height: 50,
//                   ),
//                 ),
//               ),

//               ///
//               AnimatedPositioned(
//                 key: contentKey,
//                 duration: _duration(),
//                 top: _getContentPossitioned(offset, context,
//                     objectHeight + (_padding() / 2), contentheight),
//                 left: 20,
//                 child: AnimatedContainer(
//                   duration: _duration(),
//                   width: MediaQuery.of(context).size.width - 40,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Material(
//                     color: Colors.white,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 titleBuilder?.call(i) ?? '',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .titleMedium!
//                                     .copyWith(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 16,
//                                       color: Theme.of(context).primaryColor,
//                                     ),
//                               ),
//                             ),
//                             if (itemCount > 1)
//                               Text(
//                                 '${i + 1}/$itemCount',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .titleMedium!
//                                     .copyWith(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 14,
//                                       color: AppColor.chartLabelColor,
//                                     ),
//                               )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),

//                         ///
//                         if (descriptionBuilder != null)
//                           Text(
//                             descriptionBuilder.call(i),
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleMedium!
//                                 .copyWith(
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 14,
//                                   color: AppColor.darkColor,
//                                 ),
//                           ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             if (allowSkip || itemCount > 1)
//                               GestureDetector(
//                                 onTap: () {
//                                   overlayEntry!.remove();
//                                 },
//                                 child: Text(
//                                   'Skip',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium!
//                                       .copyWith(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w400,
//                                         color: Theme.of(context).primaryColor,
//                                       ),
//                                 ),
//                               ),
//                             const Spacer(),
//                             if (i > 0 && itemCount > 1)
//                               GestureDetector(
//                                 onTap: _tapBack,
//                                 child: Text(
//                                   'Back',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium!
//                                       .copyWith(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w400,
//                                         color: AppColor.chartLabelColor,
//                                       ),
//                                 ),
//                               ),
//                             const SizedBox(width: 15),
//                             GestureDetector(
//                               onTap: _tapNext,
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 10, horizontal: 20),
//                                 decoration: BoxDecoration(
//                                     color: Theme.of(context).primaryColor,
//                                     borderRadius: BorderRadius.circular(6)),
//                                 child: Text(
//                                   i == itemCount - 1 ? 'Done' : 'Next',
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium!
//                                       .copyWith(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w700,
//                                         color: Colors.white,
//                                       ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );

//     overlayState!.insert(overlayEntry);
//   }
// }

// class OverlaySetting {
//   double? padding;

//   double? radius;

//   Duration? duration;

//   Curve? curves;

//   bool dismisable;

//   OverlaySetting({
//     this.padding,
//     this.duration,
//     this.curves = Curves.linear,
//     this.radius,
//     this.dismisable = true,
//   });
// }

// ignore_for_file: invalid_use_of_protected_member

import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CiCApp {
  static double _getContentPossitioned(Offset offset, BuildContext context,
          double objHeight, double contentheight) =>
      offset.dy < MediaQuery.of(context).size.height * 0.5
          ? offset.dy + objHeight + 15
          : offset.dy - 40 - contentheight;

  ///[CiCApp] Get widget RenderBox by it's Key.
  static RenderBox getRenderBox(GlobalKey key) =>
      key.currentContext!.findRenderObject() as RenderBox;

  ///[CiCApp] Get Widget Size by it's key.
  static Size getSize(GlobalKey key) => getRenderBox(key).size;

  ///[CiCApp] Get Widget Offset by It's Key.
  ///Offset by key..localToGlobal(Offset.zero);
  static Offset getOffset(GlobalKey key) =>
      getRenderBox(key).localToGlobal(Offset.zero);

  ///[ CiCApp ] Show OverLays Guidline
  static Future<void> showOverlays({
    required BuildContext context,
    required int itemCount,
    required GlobalKey Function(int index) key,
    String? Function(int index)? titleBuilder,
    String? Function(int index)? descriptionBuilder,
    ObjectSetting? Function(int index)? objectSettingBuilder,
    OverlaySetting? overlaySetting,
    bool allowSkip = true,
  }) async {
    //don't remove this
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

    final defaultObject = ObjectSetting(
        edgeInsets: const EdgeInsets.all(10), radius: BorderRadius.circular(8));

    ObjectSetting objectSetting = objectSettingBuilder?.call(i) ??
        ObjectSetting(
            edgeInsets: const EdgeInsets.all(10),
            radius: BorderRadius.circular(8));
    void _updateState() {
      getKey = key(i);
      offset = getOffset(getKey);
      size = getRenderBox(getKey).size;
      objectHeight = size.height;
      objectSetting = objectSettingBuilder?.call(i) ?? defaultObject;

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
                    ///background
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        backgroundBlendMode: BlendMode.dstOut,
                      ),
                    ),

                    ///
                    AnimatedPositioned(
                      duration: _duration(),
                      top: offset.dy -
                          (objectSetting.edgeInsets != null
                              ? objectSetting.edgeInsets!.top
                              : 0) -
                          (objectSetting.paddingSize != null
                              ? objectSetting.paddingSize!.height / 2
                              : 0),
                      left: offset.dx -
                          (objectSetting.edgeInsets != null
                              ? objectSetting.edgeInsets!.left
                              : 0) -
                          (objectSetting.paddingSize != null
                              ? objectSetting.paddingSize!.width / 2
                              : 0),
                      child: AnimatedContainer(
                        duration: _duration(),
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          color: Colors.white,
                          borderRadius: objectSetting.radius != null
                              ? objectSetting.radius!
                              : BorderRadius.circular(8),
                        ),
                        child: AnimatedContainer(
                          duration: _duration(),
                          margin: objectSetting.edgeInsets ?? EdgeInsets.zero,
                          width: size.width +
                              (objectSetting.paddingSize != null
                                  ? objectSetting.paddingSize!.width
                                  : 0),
                          height: size.height +
                              (objectSetting.paddingSize != null
                                  ? objectSetting.paddingSize!.height
                                  : 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ///Arrow
              AnimatedPositioned(
                top: offset.dy -
                    (objectSetting.edgeInsets != null
                        ? objectSetting.edgeInsets!.top
                        : 0) -
                    (objectSetting.paddingSize != null
                        ? objectSetting.paddingSize!.height / 2
                        : 0) -
                    50,
                left: offset.dx + (size.width / 2) - 25, //don't change this
                duration: _duration(),
                child: LottieBuilder.asset(
                  'assets/images/animation/white_arrow_down.json',
                  // animate: false,
                  width: 50,
                  height: 50,
                ),
              ),

              ///Content
              AnimatedPositioned(
                key: contentKey,
                duration: _duration(),
                top: _getContentPossitioned(
                  offset,
                  context,
                  objectHeight +
                      (objectSetting.edgeInsets != null
                          ? objectSetting.edgeInsets!.bottom
                          : 0) +
                      (objectSetting.paddingSize != null
                          ? (objectSetting.paddingSize!.height / 2)
                          : 0),
                  contentheight +
                      (objectSetting.edgeInsets != null
                          ? objectSetting.edgeInsets!.top
                          : 0) +
                      (objectSetting.paddingSize != null
                          ? (objectSetting.paddingSize!.height / 2)
                          : 0),
                ),
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
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                            if (itemCount > 1)
                              Text(
                                '${i + 1}/$itemCount',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                              )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        ///
                        if (descriptionBuilder != null)
                          Text(
                            descriptionBuilder.call(i) ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColor.chartLabelColor,
                                ),
                          ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            if (allowSkip && itemCount > 1)
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
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ),
                            const Spacer(),
                            if (i > 0 && itemCount > 1)
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
                                    color: Theme.of(context).primaryColor,
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

class ObjectSetting {
  EdgeInsets? edgeInsets;

  BorderRadius? radius;

  Size? paddingSize;

  ObjectSetting({
    this.edgeInsets,
    this.radius,
    this.paddingSize,
  });
}

class OverlaySetting {
  double? radius;

  Duration? duration;

  Curve? curves;

  bool dismisable;

  OverlaySetting({
    this.duration,
    this.curves = Curves.linear,
    this.radius,
    this.dismisable = true,
  });
}
