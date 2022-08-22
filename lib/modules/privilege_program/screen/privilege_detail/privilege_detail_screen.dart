import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/Utils/image_view/image_view_file.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../widgets/privilege/custom_fovarite.dart';
import '../../../../widgets/privilege/privilege_detail/custom_card_allstores_datil.dart';
import '../../../event_module/controller/event_controller.dart';
import '../../../event_module/screen/pop_up_dialog.dart';
import '../../controller/privilege_controller.dart';

class PrivilegeDetailScreen extends StatefulWidget {
  final bool? isColorsHours;
  final num? id;

  const PrivilegeDetailScreen({
    Key? key,
    this.isColorsHours = false,
    this.id,
  }) : super(key: key);

  @override
  State<PrivilegeDetailScreen> createState() => _PrivilegeDetailScreenState();
}

class _PrivilegeDetailScreenState extends State<PrivilegeDetailScreen> {
  PageController controller = PageController();
  int segmentedControlValue = 0;
  bool innerBoxIsScrolled = false;
  final preController = Get.put(PrivilegeController());
  final eventController = Get.put(EventController());

  @override
  void initState() {
    preController.onFetchShopDetail(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Scaffold(
        body: Obx(
          () => NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool isBoxIsScroll) {
              innerBoxIsScrolled = isBoxIsScroll;
              debugPrint(isBoxIsScroll.toString());

              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    // forceElevated: innerBoxIsScrolled,
                    backgroundColor: AppColor.mainColor,
                    centerTitle: true,
                    systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarBrightness: Brightness.dark,
                    ),
                    pinned: true,
                    floating: true,
                    expandedHeight: 310.0,
                    elevation: 0.0,
                    actions: [
                      Row(
                        children: [
                          CustomFovarite(
                            isBoxIsScroll: isBoxIsScroll,
                            //index: widget.index,
                            onPressed: () {
                              // setState(() {
                              //   preController.listAllStores[widget.index!].isFav =
                              //       !preController
                              //           .listAllStores[widget.index!].isFav;
                              //   //preController.listCardStoresPrivilege.refresh();
                              //   if (preController
                              //           .listAllStores[widget.index!].isFav ==
                              //       true) {
                              //     preController.favoritesList.add(
                              //         preController.listAllStores[widget.index!]);
                              //   } else {
                              //     preController.favoritesList.remove(
                              //         preController.listAllStores[widget.index!]);
                              //   }
                              // });
                            },
                          ),
                          CustomFovarite(
                              // index: widget.index,
                              isBoxIsScroll: isBoxIsScroll,
                              icon: Icons.ios_share_outlined,
                              onPressed: () {
                                onShowChoice(context, (value) {});
                              }),
                        ],
                      ),
                    ],
                    leading: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.only(left: 5),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: isBoxIsScroll
                              ? Colors.transparent
                              : Colors.white.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: isBoxIsScroll ? Colors.white : Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        width: double.infinity,
                        // color: Theme.of(context).cardColor,
                        color: Colors.grey[50],
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: double.infinity,
                                  color: Colors.transparent,
                                  child: Image.network(
                                    preController.shopDetailModel.value.cover!,
                                    fit: BoxFit.cover,
                                    height: 250,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20.0,
                                    left: 20.0,
                                    bottom: 14.0,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.room,
                                        size: 21,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Text(
                                          preController.shopDetailModel.value
                                              .fullAddress!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5!
                                              .copyWith(
                                                fontWeight: FontWeight.w200,
                                                color: const Color(0xff464646),
                                                letterSpacing: 0.2,
                                                fontSize: 14,
                                              ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                                left: 15,
                                right: 15,
                                bottom: 60,
                                child: CustomCardPrivilegeDetail(
                                  titile: preController
                                      .shopDetailModel.value.shopNameInEnglish,
                                  slogan: preController
                                      .shopDetailModel.value.slogan,
                                  discount: preController
                                      .shopDetailModel.value.discountRate,
                                  logo:
                                      preController.shopDetailModel.value.logo,
                                  status: "Open",
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Center(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 110),
                padding: const EdgeInsets.only(
                  right: 20.0,
                  left: 20.0,
                  top: 20.0,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(14.0),
                    topLeft: Radius.circular(14.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      //padding: const EdgeInsets.only(left: 20, right: 20),
                      width: double.infinity,

                      child: CupertinoSlidingSegmentedControl(
                          groupValue: segmentedControlValue,
                          backgroundColor:
                              const Color(0xff252552).withOpacity(0.1),
                          children: <int, Widget>{
                            0: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Service',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            1: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Info',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            2: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Photo',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          },
                          onValueChanged: (int? value) {
                            setState(() {
                              segmentedControlValue = value!;
                              controller.animateToPage(segmentedControlValue,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            });
                          }),
                    ),
                    Expanded(
                      child: PageView(
                        controller: controller,
                        onPageChanged: (value) {
                          segmentedControlValue = value;
                          setState(() {});
                        },
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HtmlWidget(
                                  preController
                                      .shopDetailModel.value.productOrService!,
                                )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: preController
                                  .shopDetailModel.value.openingDays!
                                  .asMap()
                                  .entries
                                  .map(
                                    (e) => openingDays(
                                        titleDay: e.value.dayName,
                                        timeMorning: e.value.shiftAHours,
                                        timeEvening: e.value.shiftBHours),
                                  )
                                  .toList(),
                            ),
                          ),
                          GridView.builder(
                            padding: const EdgeInsets.only(top: 30.0),
                            itemCount: preController
                                .shopDetailModel.value.galleries!.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  orientation == Orientation.portrait ? 2 : 4,
                              mainAxisSpacing: 14,
                              crossAxisSpacing: 14,
                              //childAspectRatio: 1 / 2,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () async {
                                  await onPreviewImage(
                                      isNoIconDownload: false,
                                      heroTag: 'view',
                                      context: context,
                                      imageUrl: preController.shopDetailModel
                                          .value.galleries![index]);
                                },
                                child: imageGalleries(preController
                                    .shopDetailModel.value.galleries![index]),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SafeArea(
                      top: false,
                      minimum: const EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[200]!,
                              blurRadius: 6.0,
                              spreadRadius: 2.0,
                              offset: const Offset(
                                4.0,
                                2.0,
                              ),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.location_on_rounded),
                              color: AppColor.mainColor,
                              onPressed: () async {
                                await launchUrl(
                                  Uri.parse(
                                      'https://goo.gl/maps/vnvBs8BDyjb7dYeb9'),
                                  mode: LaunchMode.platformDefault,
                                );
                              },
                            ),
                            IconButton(
                                icon: SvgPicture.asset(
                                  'assets/images/privilege/calling.svg',
                                ),
                                color: AppColor.mainColor,
                                onPressed: () {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CupertinoActionSheet(
                                      actions: <Widget>[
                                        CupertinoActionSheetAction(
                                          child: const Text(
                                            '+855 17 600 050',
                                          ),
                                          onPressed: () {},
                                        ),
                                        CupertinoActionSheetAction(
                                          //isDestructiveAction: true,
                                          onPressed: () {},
                                          child: const Text(
                                            '+855 96 886 1168',
                                          ),
                                        )
                                      ],
                                      cancelButton: CupertinoActionSheetAction(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.pop(context, 'Cancel');
                                        },
                                      ),
                                    ),
                                  );
                                }),
                            IconButton(
                              icon: SvgPicture.asset(
                                'assets/images/privilege/telegram.svg',
                              ),
                              color: AppColor.mainColor,
                              onPressed: () async {
                                await launchUrl(
                                  Uri.parse('https://t.me/+855964776129'),
                                  mode: LaunchMode.platformDefault,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget servicesDetail({PrivilegeShopModel? storeDitDesc}) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 20.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               storeDitDesc!.legalCompanyName ?? 'Our Service',
  //               style: Theme.of(context).textTheme.headline6!.copyWith(
  //                     color: Colors.black,
  //                   ),
  //             ),
  //             const SizedBox(
  //               height: 10,
  //             ),
  //             Text(
  //               storeDitDesc.description ??
  //                   'It is a long established fact that a reader will be distracted by the readable content of',
  //               style: Theme.of(context).textTheme.bodyText2!.copyWith(
  //                     fontWeight: FontWeight.w400,
  //                     letterSpacing: 0.2,
  //                   ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Text(
  //         storeDitDesc.latitude ?? 'Why do we use it?',
  //         style: Theme.of(context).textTheme.headline6!.copyWith(
  //               color: Colors.black,
  //             ),
  //       ),
  //       const SizedBox(
  //         height: 20.0,
  //       ),
  //       Row(
  //         children: [
  //           const Icon(
  //             Icons.fiber_manual_record,
  //             size: 8,
  //           ),
  //           const SizedBox(
  //             width: 10,
  //           ),
  //           Text(
  //             storeDitDesc.thumbnail ?? 'It is a long established ',
  //             style: Theme.of(context).textTheme.bodyText2!.copyWith(
  //                   fontWeight: FontWeight.w600,
  //                   letterSpacing: 0.2,
  //                 ),
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 6),
  //       Row(
  //         children: [
  //           const Icon(
  //             Icons.fiber_manual_record,
  //             size: 8,
  //             color: Colors.transparent,
  //           ),
  //           const SizedBox(
  //             width: 10,
  //           ),
  //           Expanded(
  //             child: Text(
  //               storeDitDesc.productOrService ?? '',
  //               style: Theme.of(context).textTheme.bodyText2!.copyWith(
  //                     fontWeight: FontWeight.w400,
  //                     letterSpacing: 0.2,
  //                   ),
  //             ),
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 20),
  //     ],
  //   );
  // }

  Widget openingDays({
    String? titleDay,
    String? timeMorning,
    String? timeEvening,
    bool istoday = false,
    bool isytd = false,
  }) {
    return Column(
      children: [
        Container(
          height: 68,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: istoday ? Colors.grey[100] : Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              istoday
                  ? const Icon(
                      Icons.fiber_manual_record,
                      size: 8,
                      color: AppColor.lightblue,
                    )
                  : const SizedBox(),
              const SizedBox(
                width: 5,
              ),
              Text(
                titleDay ?? '',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    timeMorning ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    timeEvening ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        istoday || isytd
            ? const SizedBox()
            : const Divider(
                height: 0,
                thickness: 1,
              ),
      ],
    );
  }

  Widget imageGalleries(String? imgUrl) {
    return Container(
      // height: MediaQuery.of(context).size.width / 2,
      // width: MediaQuery.of(context).size.width / 1.4,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        image: DecorationImage(
          image: NetworkImage(imgUrl!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
