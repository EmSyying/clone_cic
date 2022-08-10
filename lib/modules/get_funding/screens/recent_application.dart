// import 'package:cicgreenloan/helper/containerPartern.dart';
// import 'package:cicgreenloan/helper/custom_appbar.dart';
// import 'package:cicgreenloan/pages/getFunding/application_tab.dart';
// import 'package:cicgreenloan/widgets/custom_button.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';

// class RecentApplication extends StatelessWidget {
//   const RecentApplication({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: CustomAppBar(
//           isLeading: true,
//           context: context,
//           title: 'Get Funding',
//           action: [
//             kIsWeb
//                 ? Container()
//                 : Platform.isIOS || Platform.isAndroid
//                     ? IconButton(
//                         icon: Container(
//                           margin: const EdgeInsets.only(right: 10.0),
//                           child: Icon(
//                             CupertinoIcons.add,
//                             color: Colors.white,
//                           ),
//                         ),
//                         onPressed: () {},
//                       )
//                     : Container()
//           ],
//         ),
//         body: Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: Column(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       color: Theme.of(context).cardColor,
//                       boxShadow: [
//                         BoxShadow(
//                             offset: Offset(0.0, 1.0),
//                             color: Colors.black12,
//                             blurRadius: 6)
//                       ]),
//                   child: TabBar(
//                     labelStyle: TextStyle(
//                         fontFamily: 'DMSans',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         color: Theme.of(context).primaryColor),
//                     indicatorWeight: 3,
//                     indicatorSize: TabBarIndicatorSize.label,
//                     indicatorColor: Theme.of(context).primaryColor,
//                     labelColor: Theme.of(context).primaryColor,
//                     unselectedLabelColor:
//                         Get.theme.brightness == Brightness.light
//                             ? Colors.grey[500]
//                             : Colors.white,
//                     tabs: [
//                       Tab(
//                         text: 'Equity Investment',
//                       ),
//                       Tab(
//                         text: 'Debt Investment',
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: TabBarView(children: [
//                     ApplicationTab(),
//                     ApplicationTab(),
//                   ]),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 90,
//                   margin: EdgeInsets.only(left: 0, right: 0, bottom: 0),
//                   padding: EdgeInsets.symmetric(
//                       horizontal: padding, vertical: padding),
//                   child: CustomButton(
//                     onPressed: () {},
//                     isDisable: false,
//                     isOutline: false,
//                     title: 'Create New Application',
//                   ),
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }
