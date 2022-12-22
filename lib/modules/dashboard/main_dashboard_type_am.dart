import 'package:cicgreenloan/configs/firebase_deeplink/deeplink_service.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/link.dart';

import '../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../Utils/custom_indicatior.dart';
import '../../Utils/function/convert_fromhex_color.dart';
import '../member_directory/controllers/customer_controller.dart';
import '../report_module/controllers/documentation_controller.dart';
import '../report_module/models/documentation_model.dart';
import '../report_module/screens/report_screen.dart';
import '../report_module/screens/view_report.dart';

class MainDashBoardTypeAM extends StatefulWidget {
  const MainDashBoardTypeAM({Key? key}) : super(key: key);

  @override
  State<MainDashBoardTypeAM> createState() => _MainDashBoardTypeAMState();
}

class _MainDashBoardTypeAMState extends State<MainDashBoardTypeAM> {
  Future<List<DocumentationModel>>? futureList;
  final customerUser = Get.put(CustomerController());
  final documentCon = Get.put(DocumentationController());
  final settingCon = Get.put(SettingController());
  int currentIndex = 0;
  var timeNow = int.parse(DateFormat('kk').format(DateTime.now()));
  var message = '';
  bool? switchIcon = false;
  final widgetKey = GlobalKey();

  onInitFirebaseDynamicLinks() async {
    await DynamicLinkService.initDynamicLinks();
  }

  @override
  void initState() {
    onInitFirebaseDynamicLinks();
    if (timeNow <= 12) {
      message = 'Good Morning!';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      message = 'Good Afternoon!';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      message = 'Good Evening!';
    } else {
      message = 'Good Night!';
    }
    customerUser.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Obx(
        () => Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 75,
                  margin: const EdgeInsets.only(top: 35),
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
                      width: 80,
                      height: 80,
                      margin: const EdgeInsets.only(left: 20),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          boxShadow: const [],
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${customerUser.customer.value.profile}'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          customerUser.isloading.value == true
                              ? const Text('...')
                              : Text('${customerUser.customer.value.fullName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: const Color(0xffF8F8F8),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: AspectRatio(
                          aspectRatio: 7 / 2.8,
                          child: Swiper(
                            loop: true,
                            index: currentIndex,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              // if (settingCon.slideList![index].status ==
                              //     'Display') {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                        ///////static image
                                        child: Image.asset(
                                      documentListTest[index],
                                      fit: BoxFit.cover,
                                    )
                                        // CachedNetworkImage(
                                        //   imageUrl:
                                        //       settingCon.slideList![index].image!,
                                        //   fit: BoxFit.cover,
                                        // ),
                                        ),
                                    ///////buitton on banner slide
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
                                                            BorderRadius
                                                                .circular(8),
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
                                                                    fontSize:
                                                                        12,
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
                              // }
                              // return Container();
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
                            .where(
                                (element) => element.value.status == 'Display')
                            .map((e) => CustomIndicator(
                                  isSelect: e.key == currentIndex,
                                ))
                            .toList(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AspectRatio(
                        aspectRatio: 3 / 3.37,
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 10,
                            right: 20,
                            left: 20,
                            bottom: 20,
                          ),
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
                                color: Colors.grey[100]!,
                              )
                            ],
                          ),
                          child: ClipRRect(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ReportScreen(),
                                      ),
                                    );
                                  },
                                  child: GridView.count(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    crossAxisCount: 2,
                                    childAspectRatio: 3 / 2.35,
                                    children: menuListTest
                                        .asMap()
                                        .entries
                                        .map((e) => Center(
                                              child: customMenu(
                                                context: context,
                                                icon: e.value.url,
                                                label: e.value.title,
                                                onTap: () {},
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ),
                                AspectRatio(
                                  aspectRatio: 6.20 / 7,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 3 / 0.1,
                                        child: SvgPicture.asset(
                                          'assets/images/svgfile/horizontal_divider.svg',
                                        ),
                                      ),
                                      AspectRatio(
                                        aspectRatio: 3 / 0.1,
                                        child: SvgPicture.asset(
                                          'assets/images/svgfile/horizontal_divider.svg',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 5.11 / 6,
                                      child: SvgPicture.asset(
                                        'assets/images/svgfile/vertical_divider.svg',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 80,
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
                                      margin: const EdgeInsets.only(left: 10),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
            ),
          ],
        ),
      ),
    );
  }
}

customMenu({
  String? icon,
  String? label,
  BuildContext? context,
  GestureTapCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          '$icon',
          width: 32,
          height: 23,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '$label',
          style: Theme.of(context!)
              .textTheme
              .headline2!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}

List<String> documentListTest = [
  'assets/images/banner1.png',
  'assets/images/banner2.png',
];

List<DocumentationModel> menuListTest = [
  DocumentationModel(
    title: 'My Investment',
    url: 'assets/images/svgfile/static_invesment.svg',
  ),
  DocumentationModel(
    title: 'Get Funding',
    url: 'assets/images/svgfile/static_getfunding.svg',
  ),
  DocumentationModel(
    title: 'Program',
    url: 'assets/images/svgfile/static_program.svg',
  ),
  DocumentationModel(
    title: 'Learning',
    url: 'assets/images/svgfile/static_learning.svg',
  ),
  DocumentationModel(
    title: 'Directory',
    url: 'assets/images/svgfile/static_directory.svg',
  ),
  DocumentationModel(
    title: 'Events',
    url: 'assets/images/svgfile/static_event.svg',
  ),
];
