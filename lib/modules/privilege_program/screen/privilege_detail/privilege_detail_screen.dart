import 'package:cicgreenloan/Utils/helper/color.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Utils/image_view/image_view_file.dart';
import '../../../../widgets/bonus/custom_empty_state.dart';
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
  final pageController = PageController();
  int segmentedControlValue = 0;
  bool innerBoxIsScrolled = false;
  final priController = Get.put(PrivilegeController());
  final eventController = Get.put(EventController());

  @override
  void initState() {
    priController.onFetchShopDetail(widget.id);

    if (widget.id != 0 && widget.id != null) {
      priController.onFetchShopDetail(widget.id).then((value) {
        debugPrint('pro code = ${priController.shopId.value}');
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => priController.isLoadingShopDetail.value
            ? const SafeArea(
                child: LinearProgressIndicator(),
              )
            : NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool isBoxIsScroll) {
                  innerBoxIsScrolled = isBoxIsScroll;

                  return <Widget>[
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverAppBar(
                        backgroundColor: AppColor.mainColor,
                        centerTitle: true,
                        systemOverlayStyle: const SystemUiOverlayStyle(
                          statusBarBrightness: Brightness.dark,
                        ),
                        pinned: true,
                        floating: true,
                        expandedHeight: 320.0,
                        elevation: 0.0,
                        actions: [
                          Row(
                            children: [
                              CustomFovarite(
                                isFav: priController
                                    .shopDetailModel.value.isFavorite!,
                                isBoxIsScrolled: isBoxIsScroll,
                                onPressed: () {
                                  priController
                                      .setFavouriteStore(
                                          id: widget.id!,
                                          boolFav: priController.shopDetailModel
                                              .value.isFavorite!)
                                      .then((value) {
                                    if (priController
                                        .shopDetailModel.value.isFavorite!) {
                                      priController.shopDetailModel.value =
                                          priController.shopDetailModel.value
                                              .copyWith(isFavorite: false);
                                    } else {
                                      priController.shopDetailModel.value =
                                          priController.shopDetailModel.value
                                              .copyWith(isFavorite: true);
                                    }
                                    priController.onFetchAllStore(1);
                                    priController.onFetchFavouriteStore();

                                    priController.update();
                                  });
                                  // preController.shopDetailModel.refresh();
                                },
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 20),
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: isBoxIsScroll
                                      ? Colors.transparent
                                      : Colors.white.withOpacity(0.6),
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.ios_share_outlined,
                                    color: isBoxIsScroll
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  onPressed: () {
                                    onShowChoice(
                                      context,
                                      (value) {},
                                    );
                                  },
                                ),
                              ),
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
                                color:
                                    isBoxIsScroll ? Colors.white : Colors.black,
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
                            color: Colors.grey[50],
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      color: Colors.transparent,
                                      child: Image.network(
                                        priController
                                                .shopDetailModel.value.cover ??
                                            '',
                                        fit: BoxFit.cover,
                                        height: 250,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 18.0,
                                        right: 18.0,
                                        bottom: 8.0,
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
                                              priController.shopDetailModel
                                                  .value.fullAddress!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w200,
                                                    color:
                                                        const Color(0xff464646),
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
                                  bottom: 70,
                                  child: CustomCardPrivilegeDetail(
                                    sloganLogo: priController
                                        .shopDetailModel.value.shopLogo,
                                    status: priController
                                        .shopDetailModel.value.status,
                                    titile: priController.shopDetailModel.value
                                        .shopNameInEnglish,
                                    slogan: priController
                                        .shopDetailModel.value.slogan,
                                    discount: priController
                                        .shopDetailModel.value.discountRate,
                                  ),
                                ),
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
                          margin: const EdgeInsets.only(
                            bottom: 20.0,
                          ),
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
                                segmentedControlValue = value!;
                                pageController.animateToPage(
                                    segmentedControlValue,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.fastOutSlowIn);
                                setState(() {});
                              }),
                        ),
                        Expanded(
                          child: PageView(
                            controller: pageController,
                            onPageChanged: (page) {
                              segmentedControlValue = page;
                              setState(() {});
                            },
                            children: [
                              buildService(),
                              buildSchedule(),
                              buildGridImage(),
                            ],
                          ),
                        ),

                        ///
                        SafeArea(
                          top: false,
                          minimum: const EdgeInsets.only(bottom: 20.0),
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
                                          'https://maps.google.com/?q=${priController.shopDetailModel.value.latitude},${priController.shopDetailModel.value.longitude}'),
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
                                          actions: priController
                                              .shopDetailModel.value.contacts!
                                              .asMap()
                                              .entries
                                              .map(
                                                (e) => cupertinoActionSheet(
                                                  phone: e.value.phone,
                                                  mobile: e.value.mobile,
                                                ),
                                              )
                                              .toList(),
                                          cancelButton:
                                              CupertinoActionSheetAction(
                                            child: const Text(
                                              'Cancel',
                                              style: TextStyle(
                                                color: AppColor.mainColor,
                                              ),
                                            ),
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
                                      Uri.parse(
                                        priController.shopDetailModel.value
                                                .telegramLink ??
                                            '',
                                      ),
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
    );
  }

  Widget cupertinoActionSheet({String? phone, String? mobile}) {
    return CupertinoActionSheetAction(
      child: Column(
        verticalDirection: VerticalDirection.up,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            phone ?? '',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w200,
                  fontSize: 20.0,
                ),
          ),
          Text(
            mobile ?? '',
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontWeight: FontWeight.w200,
                  fontSize: 20.0,
                ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }

  Widget buildService() => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
            ),
            const SizedBox(height: 10),
            HtmlWidget(
              priController.shopDetailModel.value.description ?? '',
              textStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'Our Service',
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const SizedBox(height: 10),
            HtmlWidget(
              priController.shopDetailModel.value.productOrService ?? '',
              textStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.2,
                  ),
            ),
          ],
        ),
      );

  Widget buildSchedule() =>
      priController.shopDetailModel.value.openingDays!.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: priController.shopDetailModel.value.openingDays!
                    .asMap()
                    .entries
                    .map(
                      (e) => openingDays(
                        titleDay: e.value.dayName,
                        timeMorning: e.value.shiftAHours,
                        timeEvening: e.value.shiftBHours,
                      ),
                    )
                    .toList(),
              ),
            )
          : const SingleChildScrollView(
              child: CustomEmptyState(
                title: 'No Opending Days',
                description: 'It seems you have no opending days yet',
              ),
            );

  Widget buildGridImage() => GridView.builder(
        padding: const EdgeInsets.only(top: 30.0),
        itemCount: priController.shopDetailModel.value.galleries!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              await onPreviewImage(
                isNoIconDownload: false,
                heroTag: 'view',
                context: context,
                imageUrl: priController.shopDetailModel.value.galleries![index],
              );
            },
            child: imageGalleries(
              priController.shopDetailModel.value.galleries![index],
            ),
          );
        },
      );

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
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 16,
          ),
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
