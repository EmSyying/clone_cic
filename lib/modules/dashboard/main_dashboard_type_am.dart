import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/link.dart';

import '../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../Utils/custom_indicatior.dart';
import '../../Utils/function/convert_fromhex_color.dart';
import '../../Utils/helper/color.dart';
import '../report_module/controllers/documentation_controller.dart';
import '../report_module/models/documentation_model.dart';
import '../report_module/screens/view_report.dart';

class MainDashBoardTypeAM extends StatefulWidget {
  const MainDashBoardTypeAM({Key? key}) : super(key: key);

  @override
  State<MainDashBoardTypeAM> createState() => _MainDashBoardTypeAMState();
}

class _MainDashBoardTypeAMState extends State<MainDashBoardTypeAM> {
  Future<List<DocumentationModel>>? futureList;
  final documentCon = Get.put(DocumentationController());
  final settingCon = Get.put(SettingController());
  int currentIndex = 0;
  var timeNow = int.parse(DateFormat('kk').format(DateTime.now()));
  var message = '';
  bool? switchIcon = false;
  final widgetKey = GlobalKey();

  @override
  void initState() {
    if (timeNow <= 12) {
      message = 'Good Morning!';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      message = 'Good Afternoon!';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      message = 'Good Evening!';
    } else {
      message = 'Good Night!';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: context.theme.backgroundColor,
      //   automaticallyImplyLeading: false,
      //   centerTitle: false,
      //   title: Row(
      //     children: [
      //       const SizedBox(
      //         width: 10,
      //       ),
      //       SvgPicture.asset(
      //         'assets/images/svgfile/Logocic.svg',
      //         height: 27,
      //       ),
      //       const SizedBox(
      //         width: 10,
      //       ),
      //       const Text(
      //         'Mobile',
      //         style: TextStyle(
      //             fontFamily: 'DMSans',
      //             fontWeight: FontWeight.bold,
      //             fontSize: 20),
      //       ),
      //       const SizedBox(
      //         width: 10,
      //       ),
      //       Container(
      //         padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(5),
      //             color: Colors.white12),
      //         child: Text(
      //           'AM',
      //           style: Theme.of(context)
      //               .textTheme
      //               .headline6!
      //               .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
      //         ),
      //       ),
      //       FlutterSwitch(
      //           key: widgetKey,
      //           padding: 3,
      //           width: 50,
      //           height: 30,
      //           inactiveIcon: const Text(
      //             'QM',
      //             style: TextStyle(color: Colors.black),
      //           ),
      //           activeIcon: const Text(
      //             'AM',
      //             style: TextStyle(color: Colors.black),
      //           ),
      //           activeColor: const Color(0xff0685CF),
      //           value: switchIcon!,
      //           onToggle: (e) {
      //             setState(() {
      //               switchIcon = e;
      //               if (e == true) {
      //                 Offset offset = getWidgetInfo(widgetKey);
      //                 context.go('/switch-splash-screen', extra: offset);
      //               } else {
      //                 Offset offset = getWidgetInfo(widgetKey);
      //                 context.go('/switch-splash-screen', extra: offset);
      //               }
      //             });
      //           }),
      //       PopupMenuButton(
      //         shape: const RoundedRectangleBorder(
      //           borderRadius: BorderRadius.all(Radius.circular(10)),
      //         ),
      //         icon: const Padding(
      //           padding: EdgeInsets.only(right: 10),
      //           child: Icon(Icons.expand_more),
      //         ),
      //         itemBuilder: (context) => <PopupMenuEntry>[
      //           PopupMenuItem(
      //             child: GestureDetector(
      //                 onTap: () {
      //                   setState(() {
      //                     // switchIcon = e;
      //                     // if (e == true) {
      //                     Offset offset = getWidgetInfo(widgetKey);
      //                     context.go('/switch-splash-screen', extra: offset);
      //                     // Navigator.push(
      //                     //     context,
      //                     //     MaterialPageRoute(
      //                     //         builder: (context) =>
      //                     //             const DashboardTypeAM()));
      //                     // }
      //                     // else {
      //                     //   Offset offset = getWidgetInfo(widgetKey);
      //                     //   context.go('/switch-splash-screen', extra: offset);
      //                     // }
      //                   });
      //                 },
      //                 child: const Text('AM')),
      //           ),
      //           const PopupMenuDivider(height: 0),
      //           const PopupMenuItem(
      //             child: Text('QM'),
      //           ),
      //         ],
      //         // Row(
      //         //   children: [
      //         //     Container(
      //         //       padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      //         //       decoration: BoxDecoration(
      //         //           borderRadius: BorderRadius.circular(5),
      //         //           color: Colors.white12),
      //         //       child: Text(
      //         //         'AM',
      //         //         style: Theme.of(context)
      //         //             .textTheme
      //         //             .headline6!
      //         //             .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
      //         //       ),
      //         //     ),
      //         //     const Icon(Icons.expand_more),
      //         //   ],
      //         // ),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     Row(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         GestureDetector(
      //           // key: actionKey,
      //           onTap: () async {
      //             context.go('/notification');
      //           },
      //           child: Stack(
      //             alignment: Alignment.center,
      //             children: [
      //               GestureDetector(
      //                 onTap: () {
      //                   Navigator.pop(context);
      //                 },
      //                 child: Container(
      //                   margin: const EdgeInsets.only(right: 10.0),
      //                   child: SvgPicture.asset(
      //                     'assets/images/svgfile/notifications.svg',
      //                     height: 26.0,
      //                   ),
      //                 ),
      //               ),
      //               // Obx(
      //               //   () => _notificationCon.isLoading.value
      //               //       ? Container()
      //               //       : _notificationCon.countNotificatio.value != 0
      //               //           ? Positioned(
      //               //               right: 5.0,
      //               //               top: 0.0,
      //               //               child: Container(
      //               //                 padding: const EdgeInsets.symmetric(
      //               //                     horizontal: 5, vertical: 1),
      //               //                 decoration: BoxDecoration(
      //               //                     color: Colors.red,
      //               //                     borderRadius:
      //               //                         BorderRadius.circular(30)),
      //               //                 child: Text(
      //               //                   '${_notificationCon.countNotificatio.value}',
      //               //                   style:
      //               //                       const TextStyle(fontSize: 12),
      //               //                 ),
      //               //               ),
      //               //             )
      //               //           : Container(),
      //               // ),
      //             ],
      //           ),
      //         ),
      //         const SizedBox(
      //           width: 10,
      //         ),
      //         GestureDetector(
      //           onTap: () async {
      //             // await LocalData.storeAppTou('appTour', true);
      //             // showDashboardTour();
      //           },
      //           child: SvgPicture.asset('assets/images/demo.svg'),
      //         ),
      //         const SizedBox(
      //           width: 10,
      //         ),
      //       ],
      //     )
      //   ],
      //   systemOverlayStyle: SystemUiOverlayStyle.light,
      // ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25),
            decoration: const BoxDecoration(
              color: Color(0xffF8F8F8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                margin: const EdgeInsets.only(left: 20, top: 12),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                  color: AppColor.mainColor,
                  // image: const DecorationImage(
                  //     image: NetworkImage(
                  //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDuE2ejpy-CjPVNdAhuIVch-8DRr20pvVwxs2pBWtl&s',
                  //     ),
                  //     fit: BoxFit.cover),
                ),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    boxShadow: [],
                    shape: BoxShape.circle,
                    color: AppColor.mainColor,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDuE2ejpy-CjPVNdAhuIVch-8DRr20pvVwxs2pBWtl&s'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text('Syying',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            )),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: AspectRatio(
                      aspectRatio: 7 / 2.6,
                      child: Swiper(
                        loop: true,
                        index: currentIndex,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (settingCon.slideList![index].status ==
                              'Display') {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          settingCon.slideList![index].image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 20,
                                    left: 25,
                                    child: settingCon
                                                .slideList![index].button !=
                                            null
                                        ? Row(
                                            children: [
                                              Link(
                                                uri: Uri.tryParse(
                                                    '${settingCon.slideList![index].button!.target}'),
                                                builder:
                                                    (context, followLink) =>
                                                        GestureDetector(
                                                  onTap: followLink,
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8,
                                                        horizontal: 8),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Colors.white
                                                          .withOpacity(0.4),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.network(
                                                            '${settingCon.slideList![index].button!.icon}'),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          '${settingCon.slideList![index].button!.label}',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headline6!
                                                              .copyWith(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                  )
                                ],
                              ),
                            );
                          }
                          return Container();
                        },
                        onIndexChanged: (value) {
                          setState(() {
                            currentIndex = value;
                          });
                        },
                        curve: Curves.easeIn,
                        autoplay: true,
                        itemCount: settingCon.slideList!.length,
                        viewportFraction: 1,
                        scale: 0.9,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: settingCon.slideList!
                        .asMap()
                        .entries
                        .where((element) => element.value.status == 'Display')
                        .map((e) => CustomIndicator(
                              isSelect: e.key == currentIndex,
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    // height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[200]!),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            spreadRadius: 4,
                            offset: const Offset(0, 1),
                            color: Colors.grey[100]!)
                      ],
                    ),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      childAspectRatio: 3 / 2.15,
                      children: settingCon.appSettingDataList
                          .asMap()
                          .entries
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: customMenu(
                                    context: context,
                                    icon: e.value.icon,
                                    label: e.value.label),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      'Recent Documents',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 90,
                    width: double.infinity,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 25, right: 15),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var item = documentCon.documentationList[index];
                        return GestureDetector(
                          onTap: () {
                            // debugPrint('item.cover${item.cover}');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewReport(
                                  title: item.title,
                                  url: item.url,
                                  attachedFile: item.attachedFile,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(1.0, 0.0),
                                      color: Colors.black12,
                                      blurRadius: 4)
                                ]),
                            width: 330,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  height: 60,
                                  width: 60,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: fromHex(item.color ?? '')
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  alignment: Alignment.center,
                                  child: SvgPicture.network(
                                    item.cover ?? '',
                                    color: item.color != null &&
                                            item.color!.isNotEmpty
                                        ? fromHex(item.color!)
                                        : null,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                          item.title!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                          item.publishedAt!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey[500],
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: documentCon.documentationList.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

customMenu({
  String? icon,
  String? label,
  BuildContext? context,
}) {
  return Column(
    children: [
      SvgPicture.network(
        '$icon',
        width: 30,
        height: 30,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        '$label',
        style: Theme.of(context!)
            .textTheme
            .headline2!
            .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ],
  );
}

List<DocumentationModel> documentListTest = [
  DocumentationModel(
    title: 'My Investment',
    url: 'assets/images/svgfile/HomeActive.svg',
  ),
  DocumentationModel(
    title: 'My Investment',
    url: 'assets/images/svgfile/language.svg',
  ),
  DocumentationModel(
    title: 'My Investment',
    url: 'assets/images/svgfile/language.svg',
  ),
  // DocumentationModel(
  //   title: 'My Investment',
  //   url: 'assets/images/svgfile/marketClose.svg',
  // ),
  DocumentationModel(
    title: 'My Investment',
    url: 'assets/images/svgfile/announcementIcon.svg',
  ),
  // DocumentationModel(
  //   title: 'My Investment',
  //   url: 'assets/images/svgfile/announcementIcon.svg',
  // ),
  // DocumentationModel(
  //   title: 'My Investment',
  //   url: 'assets/images/svgfile/announcementIcon.svg',
  // ),
  // DocumentationModel(
  //   title: 'My Investment',
  //   url: 'assets/images/svgfile/announcementIcon.svg',
  // ),
];
