import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/modules/privilege_program/screen/privilege_detail/privilege_photo_views.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../widgets/bonus/custom_empty_state.dart';
import '../../../../widgets/privilege/custom_fovarite.dart';
import '../../../../widgets/privilege/privilege_detail/custom_card_allstores_datil.dart';
import '../../../../widgets/privilege/privilege_detail/custom_card_point.dart';
import '../../../event_module/controller/event_controller.dart';
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

  final today = DateTime.now().weekday;

  final dayOfWeek = {
    'monday': 1,
    'tuesday': 2,
    'wednesday': 3,
    'thursday': 4,
    'friday': 5,
    'saturday': 6,
    'sunday': 7,
  };

  int? dayBeforeToday;

  void _checkDay() {
    int? todayIndex;
    priController.shopDetailModel.value.openingDays?.asMap().entries.map((e) {
      if (_isToday(e.value.dayName ?? '')) {
        todayIndex = e.key;
      }
    }).toList();

    if (todayIndex != null && todayIndex! > 0) {
      dayBeforeToday = todayIndex! - 1;
    }
  }

  bool _isToday(String day) => today == dayOfWeek[day.toLowerCase()];

  @override
  void initState() {
    priController.onFetchShopDetail(widget.id).then((value) {
      _checkDay();
    });
    _controller.addListener(() {});
    super.initState();
  }

  bool get _isAppBarExpanded {
    return _controller.hasClients &&
        _controller.offset > (300 - kToolbarHeight);
  }

  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => priController.isLoadingShopDetail.value
            ? const SafeArea(
                child: LinearProgressIndicator(),
              )
            : NotificationListener<ScrollUpdateNotification>(
                onNotification: ((scrollNotification) {
                  setState(() {
                    _controller.addListener(() {
                      priController.update(['title']);
                    });
                  });
                  return false;
                }),
                child: NestedScrollView(
                  controller: _controller,
                  headerSliverBuilder:
                      (BuildContext context, bool isBoxIsScroll) {
                    innerBoxIsScrolled = isBoxIsScroll;
                    return <Widget>[
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverAppBar(
                          forceElevated: innerBoxIsScrolled,
                          title: GetBuilder(
                            id: 'title',
                            init: PrivilegeController(),
                            builder: (controller) => Text(
                              _isAppBarExpanded
                                  ? priController
                                      .shopDetailModel.value.shopNameInEnglish!
                                  : '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                          centerTitle: true,
                          systemOverlayStyle: const SystemUiOverlayStyle(
                            statusBarBrightness: Brightness.dark,
                          ),
                          pinned: true,
                          floating: true,
                          expandedHeight: 385.0,
                          elevation: 0.0,
                          actions: [
                            Row(
                              children: [
                                CustomFovarite(
                                  iconColor: _isAppBarExpanded
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _isAppBarExpanded
                                      ? Colors.transparent
                                      : Colors.white.withOpacity(0.6),
                                  isFav: priController
                                      .shopDetailModel.value.isFavorite!,
                                  // isBoxIsScrolled: isBoxIsScroll,
                                  onPressed: () {
                                    priController
                                        .setFavouriteStore(
                                            id: widget.id!,
                                            boolFav: priController
                                                .shopDetailModel
                                                .value
                                                .isFavorite!)
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
                                color: _isAppBarExpanded
                                    ? Colors.transparent
                                    : Colors.white.withOpacity(0.8),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: _isAppBarExpanded
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);

                                  if (priController.categoriesId.value != 0 ||
                                      priController.locationCode.value != "") {
                                    priController
                                        .onFilterByCategoriesByLocation(
                                            location: priController
                                                .locationCode.value,
                                            categoryId: priController
                                                .categoriesId.value);
                                  }
                                  priController.onRefreshPrivilege();
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
                                        alignment: Alignment.center,
                                        height: 240,
                                        decoration: BoxDecoration(
                                            color: AppColor.secondaryColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                8.0,
                                              ),
                                              bottomRight: Radius.circular(
                                                8.0,
                                              ),
                                            ),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                priController.shopDetailModel
                                                        .value.cover ??
                                                    '',
                                              ),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 20.0, top: 20),
                                        child: CustomCardPoint(
                                          point: '100',
                                          onTap: () {
                                            context.push(
                                                '/profile/setting/privilege/all-store/redeem-point-to-pay');
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20.0,
                                          right: 20.0,
                                          bottom: 18.0,
                                          top: 18.0,
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.room,
                                              size: 21,
                                              color: Colors.grey,
                                            ),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            Expanded(
                                              child: Text(
                                                priController.shopDetailModel
                                                    .value.fullAddress!,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: const Color(
                                                          0xff464646),
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
                                    left: 15.0,
                                    right: 15.0,
                                    top: 185.0,
                                    child: CustomCardPrivilegeDetail(
                                      sloganLogo: priController
                                          .shopDetailModel.value.shopLogo,
                                      status: priController
                                          .shopDetailModel.value.status,
                                      titile: priController.shopDetailModel
                                          .value.shopNameInEnglish,
                                      slogan: priController
                                          .shopDetailModel.value.slogan,
                                      discount: priController
                                          .shopDetailModel.value.discountRate,
                                    ),
                                  ),
                                  // Positioned(
                                  //   left: 20,
                                  //   right: 20,
                                  //   bottom: 100,
                                  //   child:
                                  // ),
                                  // Positioned(
                                  //   left: 20.0,
                                  //   right: 20.0,
                                  //   bottom: 10.0,
                                  //   child:
                                  // ),
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
                            padding: const EdgeInsets.only(
                              right: 20.0,
                              left: 20.0,
                              top: 20.0,
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
                                      duration:
                                          const Duration(milliseconds: 200),
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

                          ///Bottom Button
                          SafeArea(
                            top: false,
                            minimum: const EdgeInsets.only(
                                bottom: 20.0, left: 20, right: 20),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.location_on_rounded),
                                    color: Theme.of(context).primaryColor,
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
                                    color: Theme.of(context).primaryColor,
                                    onPressed: () {
                                      showCupertinoModalPopup(
                                        context: context,
                                        builder: (_) => CupertinoActionSheet(
                                          actions: priController
                                              .shopDetailModel.value.contacts!
                                              .map(
                                                (e) => _cupertinoActionSheet(
                                                  phone: e.mobile ?? e.phone,
                                                ),
                                              )
                                              .toList(),
                                          cancelButton:
                                              CupertinoActionSheetAction(
                                            child: Text(
                                              'Cancel',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                            ),
                                            onPressed: () {
                                              context.pop();
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      'assets/images/privilege/telegram.svg',
                                    ),
                                    color: Theme.of(context).primaryColor,
                                    onPressed: () async {
                                      await launchUrl(
                                        Uri.parse(
                                          priController.shopDetailModel.value
                                                  .telegramLink ??
                                              '',
                                        ),
                                        mode: LaunchMode.externalApplication,
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

  Widget _cupertinoActionSheet({String? phone}) {
    return CupertinoActionSheetAction(
      child: Text(
        phone ?? '',
        style: Theme.of(context).textTheme.headline3!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              color: Theme.of(context).primaryColor,
              // color: const Color(0xff007AFF)
            ),
      ),
      onPressed: () {
        launchUrl(
          Uri.parse('tel://$phone'),
        );
      },
    );
  }

  Widget buildService() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    fontSize: 14),
              ),
            ],
          ),
        ),
      );

  Widget buildSchedule() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: priController.shopDetailModel.value.openingDays!.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Open Hours',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: priController
                              .shopDetailModel.value.openingDays?.length ??
                          0,
                      itemBuilder: (_, index) => _openingDays(
                        istoday: _isToday(
                          priController.shopDetailModel.value
                                  .openingDays?[index].dayName ??
                              "",
                        ),
                        titleDay: priController
                            .shopDetailModel.value.openingDays?[index].dayName,
                        shiftAhours: priController.shopDetailModel.value
                            .openingDays?[index].shiftAHours,
                        shiftBhours: priController.shopDetailModel.value
                            .openingDays?[index].shiftBHours,
                      ),
                      separatorBuilder: (_, index) => dayBeforeToday == index ||
                              _isToday(
                                priController.shopDetailModel.value
                                        .openingDays?[index].dayName ??
                                    '',
                              )
                          ? const SizedBox.shrink()
                          : const Divider(
                              thickness: 1,
                              height: 0,
                            ),
                    ),
                  ),
                ],
              )
            : const SingleChildScrollView(
                child: CustomEmptyState(
                  title: 'No Opending Days',
                  description: 'It seems you have no opending days yet',
                ),
              ),
      );

  Widget buildGridImage() =>
      priController.shopDetailModel.value.galleries!.isNotEmpty
          ? GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: priController.shopDetailModel.value.galleries!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    await _onPreviewImage(
                      context,
                      id: index,
                      heroTag: 'view',
                      imageUrl: priController.shopDetailModel.value.galleries,
                    );
                  },
                  child: imageGalleries(
                    priController.shopDetailModel.value.galleries![index],
                  ),
                );
              },
            )
          : const SingleChildScrollView(
              child: CustomEmptyState(
                title: 'No Galleries Days',
                description: 'It seems you have no galleries days yet',
              ),
            );

  Future<void> _onPreviewImage(
    BuildContext context, {
    int? id,
    String? heroTag,
    List<String>? imageUrl,
  }) async {
    await showMaterialModalBottomSheet(
      context: context,
      builder: (context) => PrivilegePhotoViews(
        index: id,
        imageUrl: imageUrl,
      ),
    );
  }

  Widget _openingDays({
    String? titleDay,
    String? shiftAhours,
    String? shiftBhours,
    bool istoday = false,
  }) {
    return Container(
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
            style: istoday
                ? Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )
                : Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                shiftAhours ?? '',
                style: istoday
                    ? const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)
                    : const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
              ),
              const SizedBox(
                height: 6,
              ),
              if (shiftBhours != null && shiftBhours.isNotEmpty)
                Text(
                  shiftBhours,
                  style: istoday
                      ? const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)
                      : const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                ),
            ],
          )
        ],
      ),
    );
  }

  Widget imageGalleries(String? imgUrl) {
    return Container(
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
