// import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
// import 'package:cicgreenloan/modules/report_module/controllers/documentation_controller.dart';
// import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
// import 'package:cicgreenloan/generated/l10n.dart';

// import 'package:cicgreenloan/modules/report_module/screens/investore.dart';
// import 'package:cicgreenloan/widgets/defualt_size_web.dart';
// import 'package:cicgreenloan/widgets/get_funding/custom_chips.dart';
// import 'package:cicgreenloan/Utils/offline_widget.dart';
// import 'package:cicgreenloan/widgets/report/no_report_found.dart';

// import 'package:connectivity_wrapper/connectivity_wrapper.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../Utils/helper/custom_appbar.dart';
// import '../../../Utils/helper/firebase_analytics.dart';

// // ignore: must_be_immutable
// class Report extends StatefulWidget {
//   final bool? isNavigator;
//   int? currentTabIndex;
//   Report({Key? key, this.isNavigator, this.currentTabIndex = 0})
//       : super(key: key);
//   @override
//   State<Report> createState() => _ReportState();
// }

// class _ReportState extends State<Report> with TickerProviderStateMixin {
//   final docTypeCon = Get.put(DocumentCategory());
//   final docCon = Get.put(DocumentationController());
//   TabController? tabController;
//   TabController? cardTabController;
//   Future? documentList;
//   String? currentUser;
//   int selectIndex = 0;
//   bool isTabSelected = false;

//   @override
//   void initState() {
//     docTypeCon.fetchDocumentCategory();
//     tabController = TabController(
//         vsync: this,
//         length:
//             docTypeCon.reportList.isNotEmpty ? docTypeCon.reportList.length : 0,
//         initialIndex:
//             docTypeCon.reportList.length - 1 >= (widget.currentTabIndex ?? 0)
//                 ? widget.currentTabIndex!
//                 : 0);
//     tabController!.addListener(() {
//       setState(() {
//         isTabSelected = true;
//         widget.currentTabIndex = tabController!.index;
//         selectIndex = 0;
//       });
//     });

//     onGetcurrent();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     tabController!.dispose();
//     super.dispose();
//   }

//   onGetcurrent() async {
//     currentUser = await LocalData.getCurrentUser();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultSizeWeb(
//       child: WillPopScope(
//         onWillPop: () async =>
//             widget.isNavigator != null && widget.isNavigator! ? true : false,
//         child: Obx(
//           () => !docTypeCon.isLoading.value
//               ? Scaffold(
//                   appBar: CustomAppBar(
//                     isLogo: false,
//                     isLeading: true,
//                     context: context,
//                     backgroundColor: context.theme.backgroundColor,
//                     elevation: 1.0,
//                     title: S.of(context).report,
//                   ),
//                   body: ConnectivityWidgetWrapper(
//                     stacked: false,
//                     alignment: Alignment.bottomCenter,
//                     offlineWidget: const OfflineWidget(),
//                     child: docTypeCon.documentTypeList.isNotEmpty
//                         ? Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   color: Theme.of(context).cardColor,
//                                 ),
//                                 padding: const EdgeInsets.only(left: 0),
//                                 child: TabBar(
//                                   controller: tabController,
//                                   dragStartBehavior: DragStartBehavior.start,
//                                   onTap: (value) {
//                                     FirebaseAnalyticsHelper.sendAnalyticsEvent(
//                                         'Report ${docTypeCon.reportList[value].display}');
//                                     setState(() {
//                                       isTabSelected = true;
//                                     });
//                                   },
//                                   indicatorSize: TabBarIndicatorSize.label,
//                                   isScrollable: true,

//                                   labelStyle: TextStyle(
//                                       fontFamily: 'DMSans',
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: Theme.of(context).primaryColor),
//                                   indicatorWeight: 3,
//                                   indicatorColor:
//                                       Theme.of(context).primaryColor,
//                                   labelColor: Theme.of(context).primaryColor,
//                                   unselectedLabelColor:
//                                       Get.theme.brightness == Brightness.light
//                                           ? Colors.grey[500]
//                                           : Colors.white,

//                                   //                      ? Colors.white
//                                   //                      : Color(0xffDEE8E9).withOpacity(0.1),

//                                   tabs: docTypeCon.reportList.map((e) {
//                                     return Padding(
//                                       padding: const EdgeInsets.only(right: 10),
//                                       child: Tab(
//                                         text: e.display,
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),
//                               ),
//                               Container(
//                                 height: 1,
//                                 width: double.infinity,
//                                 decoration: const BoxDecoration(boxShadow: [
//                                   BoxShadow(
//                                       color: Colors.grey,
//                                       offset: Offset(0, 1),
//                                       blurRadius: 4),
//                                 ]),
//                               ),
//                               //////////////////  Filter row ///////////
//                               Container(
//                                 width: double.infinity,
//                                 color: const Color(0xffFAFAFA),
//                                 child: SingleChildScrollView(
//                                   physics: const ClampingScrollPhysics(),
//                                   scrollDirection: Axis.horizontal,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left: 20),
//                                     child: Row(
//                                       children: docTypeCon
//                                           .documentTypeList[
//                                               widget.currentTabIndex!]
//                                           .children!
//                                           .asMap()
//                                           .entries
//                                           .map((e) {
//                                         return GestureDetector(
//                                             onTap: () {
//                                               setState(() {
//                                                 isTabSelected = false;
//                                                 selectIndex = e.key;
//                                               });
//                                             },
//                                             child: CustomChips(
//                                               margin: const EdgeInsets.only(
//                                                   right: 15,
//                                                   top: 20,
//                                                   bottom: 20),
//                                               padding: const EdgeInsets.only(
//                                                   top: 13,
//                                                   bottom: 13,
//                                                   right: 17,
//                                                   left: 17),
//                                               title: e.value.display,
//                                               currentIndex: e.key,
//                                               selectIndex: isTabSelected
//                                                   ? 0
//                                                   : selectIndex,
//                                             ));
//                                       }).toList(),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               docTypeCon.documentTypeList.isNotEmpty
//                                   ? Expanded(
//                                       child: TabBarView(
//                                         controller: tabController,
//                                         children: docTypeCon.documentTypeList
//                                             .map(
//                                               (element) => InvestorPage(
//                                                 tabLabel: docTypeCon
//                                                         .documentTypeList[widget
//                                                             .currentTabIndex!]
//                                                         .children!
//                                                         .isNotEmpty
//                                                     ? docTypeCon
//                                                         .documentTypeList[widget
//                                                             .currentTabIndex!]
//                                                         .children![selectIndex]
//                                                         .id
//                                                         .toString()
//                                                     : docTypeCon
//                                                         .documentTypeList[widget
//                                                             .currentTabIndex!]
//                                                         .id
//                                                         .toString(),
//                                               ),
//                                             )
//                                             .toList(),
//                                       ),
//                                     )
//                                   : const SizedBox()
//                             ],
//                           )
//                         : const Center(child: NoReportFound()),
//                   ))
//               : Scaffold(
//                   appBar: CustomAppBar(
//                     isLogo: false,
//                     isLeading: true,
//                     context: context,
//                     backgroundColor: context.theme.backgroundColor,
//                     elevation: 1,
//                     title: S.of(context).report,
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }
