// import 'package:cicgreenloan/widgets/onBoarding/getPosition.dart';
// import 'package:flutter/material.dart';

// class ShowAppTour extends StatefulWidget {
//   final Widget? showItem;
//   final Widget? bannerDisplay;
//   final Widget? child;
//   final GlobalKey? key;
//   ShowAppTour({this.showItem, this.key, this.bannerDisplay, this.child})
//       : super(key: key);
//   @override
//   ShowAppTourState createState() => ShowAppTourState();
//   static ShowAppTourState? of(BuildContext context) {
//     ShowAppTourState? state =
//         context.findAncestorStateOfType<ShowAppTourState>();
//     if (state != null) {
//       return context.findAncestorStateOfType<ShowAppTourState>();
//     } else {
//       throw Exception('Please provide ShowCaseView context');
//     }
//   }
// }

// class ShowAppTourState extends State<ShowAppTour> {
//   double? width, height, xPosition, yPosition;

//   findObject() {
//     RenderObject? renderBox = widget.key!.currentContext!.findRenderObject();
//     width = renderBox as double?;
//     height = renderBox as double?;
//     // Offset offset = renderBox!.localToGlobal(Offset.zero);
//     // xPosition = offset.dx;
//     // yPosition = offset.dy;
//     print('Width from Component: $width');
//     print('Height from Component: $width');
//   }

//   onWelcomeMessage(GlobalKey key) {
//     print('Hello World from Key One');
//   }

//   OverlayEntry showOverlay() {
//     return OverlayEntry(builder: (context) {
//       return Stack(
//         children: [
//           Container(
//               width: double.infinity,
//               height: double.infinity,
//               color: Colors.black45),
//           Positioned(
//             left: xPosition,
//             top: yPosition,
//             child: Container(
//               height: height,
//               width: width,
//               padding: EdgeInsets.all(8),
//               color: Colors.transparent,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Container(
//                     height: height - 10,
//                     width: width - 10,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                     ),
//                     child: widget.showItem),
//               ),
//             ),
//           ),
//           Positioned(
//             left: xPosition,
//             top: yPosition - 190,
//             right: xPosition,
//             child: Container(
//               height: 180,
//               width: MediaQuery.of(context).size.height,
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Color(0xff0F50A4),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Material(
//                   color: Colors.transparent, child: widget.bannerDisplay),
//             ),
//           ),
//         ],
//       );
//     });
//   }

//   GetPosition position;

//   @override
//   void initState() {
//     // position = GetPosition(key: widget.key);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(key: widget.key, child: widget.child);
//     // return Container(child: );
//   }
// }
