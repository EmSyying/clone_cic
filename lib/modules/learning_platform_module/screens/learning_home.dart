import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/learning_platform_module/controllers/learning_controller.dart';
import 'package:cicgreenloan/modules/dashboard/buttom_navigation_bar.dart';
import 'package:cicgreenloan/Utils/custom_indicatior.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/channel_model.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/post_data.dart';
import 'package:cicgreenloan/modules/learning_platform_module/screens/channel.dart';
import 'package:cicgreenloan/modules/learning_platform_module/screens/video_list_by_module.dart';
import 'package:cicgreenloan/widgets/learning/channel_block.dart';
import 'package:cicgreenloan/widgets/learning/custom_player_bottom_sheet.dart';
import 'package:cicgreenloan/widgets/learning/custom_text_shimmer.dart';
import 'package:cicgreenloan/widgets/learning/custom_video_shimmer.dart';
import 'package:cicgreenloan/widgets/learning/recommend_video.dart';
import 'package:cicgreenloan/Utils/offline_widget.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Utils/helper/custom_appbar.dart';

class LearningHome extends StatefulWidget {
  final bool? isNavigator;
  const LearningHome({Key? key, this.isNavigator}) : super(key: key);
  @override
  State<LearningHome> createState() => _LearningHomeState();
}

class _LearningHomeState extends State<LearningHome> {
  final _learningCon = Get.put(LearningController());
  final _cusCon = Get.put(CustomerController());
  int currentIndex = 0;
  bool isHideAppBar = false;

  @override
  void initState() {
    super.initState();
    _learningCon.getVideoList(memberId: _cusCon.customer.value.customerId);
    _learningCon.getChannel(memberId: _cusCon.customer.value.customerId!);
    _learningCon.fetchSlide();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          widget.isNavigator != null && widget.isNavigator! ? true : false,
      child: CupertinoScaffold(
        body: Builder(
          builder: (context) => CupertinoPageScaffold(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: isHideAppBar
                  ? null
                  : CustomAppBar(
                      leading: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentSchedule(
                                fromPage: 'loginPage',
                              ),
                            ),
                          );
                        },
                        icon: kIsWeb
                            ? const Icon(Icons.arrow_back)
                            : Platform.isIOS
                                ? const Icon(Icons.arrow_back_ios)
                                : const Icon(Icons.arrow_back),
                      ),
                      context: context,
                      title: 'Learning',
                      action: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const VideoListByModule(
                                    pageName: 'Learning',
                                  ),
                                ),
                              );
                            },
                            child: const Icon(Icons.bookmark)),
                        const SizedBox(width: 20)
                      ],
                    ),
              body: ConnectivityWidgetWrapper(
                stacked: false,
                alignment: Alignment.bottomCenter,
                offlineWidget: Column(
                  children: [
                    CustomAppBar(
                        context: context,
                        backgroundColor: Theme.of(context).backgroundColor,
                        elevation: 0.0,
                        title: 'Learning'),
                    const Expanded(child: OfflineWidget()),
                  ],
                ),
                child: Stack(
                  children: [
                    RefreshIndicator(
                      key: _learningCon.refreshKey,
                      onRefresh: _learningCon.onRefresh,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => !_learningCon.isLoadingSlide.value &&
                                    _learningCon.slideList.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: AspectRatio(
                                      aspectRatio: 5 / 2.3,
                                      child: Swiper(
                                          loop: true,
                                          index: currentIndex,
                                          itemBuilder: (context, index) {
                                            if (_learningCon
                                                    .slideList[index].status ==
                                                'Active') {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  imageUrl: _learningCon
                                                      .slideList[index].image!,
                                                  fit: BoxFit.cover,
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
                                          itemCount:
                                              _learningCon.slideList.length,
                                          viewportFraction: 1,
                                          scale: 0.9),
                                    ))
                                : const SizedBox(
                                    height: 180,
                                    width: double.infinity,
                                  )),
                            Obx(() => !_learningCon.isLoadingSlide.value
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: _learningCon.slideList
                                        .asMap()
                                        .entries
                                        .where((element) =>
                                            element.value.status == 'Display')
                                        .map((e) => CustomIndicator(
                                              isSelect: e.key == currentIndex,
                                            ))
                                        .toList(),
                                  )
                                : Container()),
                            Container(
                              margin: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.88,
                                    height: 50,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/svgfile/search.svg',
                                          height: 20,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            onChanged: (value) {},
                                            decoration: InputDecoration(
                                                hintText:
                                                    'Search By First Name , Last Name, . . . ',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[300]),
                                                border: InputBorder.none,
                                                fillColor: Colors.grey[300],
                                                contentPadding:
                                                    const EdgeInsets.all(10)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // LearningProfileWidget(
                            //   profile: 'assets/images/profile.png',
                            //   name: 'Selena',
                            //   title: 'Learning Profile',
                            //   onTap: () {
                            //     print('Go to view');
                            //   },
                            // ),

                            Obx(
                              () => _learningCon.isLoadingChannel.value
                                  ? const CustomTextShimmer()
                                  : _learningCon.channel.value.data!.isNotEmpty
                                      ? ChannelBlock(
                                          cardTitle: 'Channel',
                                          channelData:
                                              _learningCon.channel.value.data!,
                                          onTap: (ChannelData channelData) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChannelProfile(
                                                          channelId:
                                                              channelData.id)),
                                            );
                                          },
                                        )
                                      : Container(),
                            ),
                            Obx(
                              () => _learningCon.isLoading.value
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey[100]!,
                                          highlightColor: Colors.white,
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            height: 15,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey[100]!,
                                          highlightColor: Colors.white,
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            height: 15,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        const CustomVideoShimmer(),
                                      ],
                                    )
                                  : _learningCon
                                          .postModel.value.data!.isNotEmpty
                                      ? RecommendVideo(
                                          channelTitle: 'BIO SME',
                                          onTapSeeAll: () {},
                                          videoList: _learningCon
                                              .postModel.value.data!,
                                          onTapVideo: (VideoPost value) {
                                            LocalData.userLogin(
                                                'userLogin', false);
                                            customPlayerBottomSheet(
                                                context: context, video: value);
                                          },
                                        )
                                      : Container(),
                            ),
                            const SizedBox(
                              height: 20,
                            )
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
}
