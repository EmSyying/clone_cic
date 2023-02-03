import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/learning_platform_module/controllers/learning_controller.dart';
import 'package:cicgreenloan/Utils/custom_indicatior.dart';
import 'package:cicgreenloan/modules/learning_platform_module/screens/module_page.dart';
import 'package:cicgreenloan/widgets/learning/custom_text_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:readmore/readmore.dart';

import '../../../Utils/helper/custom_appbar.dart';

class ChannelProfile extends StatefulWidget {
  final int? channelId;
  const ChannelProfile({Key? key, this.channelId}) : super(key: key);

  @override
  State<ChannelProfile> createState() => _ChannelProfileState();
}

class _ChannelProfileState extends State<ChannelProfile> {
  final _learingCon = Get.put(LearningController());
  final _settingCon = Get.put(SettingController());
  final _userCon = Get.put(CustomerController());

  int? currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _learingCon.getChannelDetail(channelId: widget.channelId!);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: CupertinoScaffold(
          body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: Scaffold(
            appBar: CustomAppBar(
              isLeading: true,
              context: context,
              title: 'Online Learning',
              action: [
                Obx(
                  () => Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                      ),
                      CircleAvatar(
                        radius: 18,
                        backgroundImage:
                            NetworkImage(_userCon.customer.value.profile!),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            body: RefreshIndicator(
              key: _learingCon.refreshKeyChannel,
              onRefresh: () {
                return _learingCon.onRefreshChannelDetail(widget.channelId!);
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => !_settingCon.isLoading.value &&
                            _settingCon.slideList!.isNotEmpty
                        ? Container(
                            height: 180,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            width: double.infinity,
                            child: Swiper(
                                loop: true,
                                index: currentIndex!,
                                itemBuilder: (context, index) {
                                  if (_settingCon.slideList![index].status ==
                                      'Display') {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: _settingCon
                                            .slideList![index].image!,
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
                                itemCount: _settingCon.slideList!.length,
                                viewportFraction: 1,
                                scale: 0.9))
                        : const SizedBox(
                            height: 180,
                            width: double.infinity,
                          )),
                    Obx(() => !_settingCon.isLoading.value
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: _settingCon.slideList!
                                .asMap()
                                .entries
                                .where((element) =>
                                    element.value.status == 'Display')
                                .map(
                                  (e) => CustomIndicator(
                                    isSelect: e.key == currentIndex,
                                  ),
                                )
                                .toList(),
                          )
                        : Container()),
                    const SizedBox(height: 20),
                    _learingCon.isLoadingChannelDetail.value
                        ? const CustomTextShimmer()
                        : _learingCon.channelDetail.value.data!.description! !=
                                ''
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'About this course',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              )
                            : Container(),
                    const SizedBox(height: 8),
                    _learingCon.isLoadingChannelDetail.value
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomTextShimmer(),
                                CustomTextShimmer(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                ),
                                CustomTextShimmer(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                ),
                              ],
                            ),
                          )
                        : _learingCon.channelDetail.value.data!.description !=
                                ''
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: ReadMoreText(
                                  _learingCon
                                      .channelDetail.value.data!.description!,
                                  trimLines: 4,
                                  trimMode: TrimMode.Line,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              )
                            : Container(),
                    const SizedBox(
                      height: 10,
                    ),
                    TabBar(
                      isScrollable: true,
                      labelColor: Theme.of(context).primaryColor,
                      automaticIndicatorColorAdjustment: true,
                      unselectedLabelColor: Colors.black54,
                      indicatorColor: Theme.of(context).primaryColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/svgfile/module.svg'),
                              const SizedBox(width: 8),
                              const Text(
                                'Modules',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        // Tab(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       SvgPicture.asset(
                        //           'assets/images/svgfile/voucher.svg'),
                        //       SizedBox(width: 8),
                        //       Text(
                        //         'Voucher',
                        //         style: TextStyle(fontSize: 12),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Tab(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       SvgPicture.asset(
                        //           'assets/images/svgfile/certificate.svg'),
                        //       SizedBox(width: 8),
                        //       Text(
                        //         'Certificate',
                        //         style: TextStyle(fontSize: 12),
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: TabBarView(
                        children: [
                          Obx(
                            () => !_learingCon.isLoadingChannelDetail.value
                                ? ModulePage(
                                    channelDetail:
                                        _learingCon.channelDetail.value)
                                : Container(),
                          ),
                          // VoucherPage(),
                          // CertificatePage()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
