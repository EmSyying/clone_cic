import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/configs/route_management/route_name.dart';
import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/market_place/Screens/item_detail.dart';
import 'package:cicgreenloan/modules/market_place/models/recommend.dart';
import 'package:cicgreenloan/modules/market_place/models/shop_menu.dart';
import 'package:cicgreenloan/Utils/custom_indicatior.dart';
import 'package:cicgreenloan/widgets/marketplace/custom_category.dart';
import 'package:cicgreenloan/widgets/marketplace/custom_list_item.dart';
import 'package:cicgreenloan/widgets/marketplace/custom_shop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/screen_agrument/member_screen_argument.dart';
import '../models/nearest.dart';

class MarketPlace extends StatefulWidget {
  final bool? isNavigator;
  const MarketPlace({Key? key, this.isNavigator}) : super(key: key);

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  final cusController = Get.put(CustomerController());
  final _settingCon = Get.put(SettingController());
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isLeading: true,
        context: context,
        title: 'Marketplace',
        action: [
          Row(
            children: [
              Obx(
                () => GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => MemberDetail(
                    //               memberDetailAgrument:
                    //             )));
                    Navigator.pushNamed(
                      context,
                      RouteName.MEMBERDETAIL,
                      arguments: MemberDetailAgrument(
                        // customer: cusController.customer.value,
                        id: cusController.customer.value.id,
                        pageName: 'user',
                        isNavigator: true,
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: cusController.customer.value.profile != null
                            ? BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        cusController.customer.value.profile!),
                                    fit: BoxFit.cover),
                              )
                            : const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/profile.png'),
                                    fit: BoxFit.contain),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => !_settingCon.isLoading.value &&
                    _settingCon.slideList!.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: Obx(
                        () => !_settingCon.isLoading.value
                            ? Swiper(
                                loop: true,
                                index: currentIndex,
                                scrollDirection: Axis.horizontal,
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
                                scale: 0.9)
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                      ),
                    ),
                  )
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
                        .where((element) => element.value.status == 'Display')
                        .map((e) => CustomIndicator(
                              isSelect: e.key == currentIndex,
                            ))
                        .toList(),
                  )
                : Container()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
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
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Colors.grey[300]),
                                border: InputBorder.none,
                                fillColor: Colors.grey[300],
                                contentPadding: const EdgeInsets.all(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/learningPlatform/filterIcon.svg',
                    height: 25,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: shopList
                        .map((e) => GestureDetector(
                              onTap: () => debugPrint(
                                  '_________Shop Name : ${e.shopName}'),
                              child: CustomShopCard(
                                shopModel: e,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomItemList(
              rearest: nearest,
              title: 'Nearest to you',
              onTap: (currentItem) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemDatail(
                              nearestItem: currentItem,
                              isRecommend: false,
                            )));
              },
            ),
            // SizedBox(
            //   height: 5,
            // ),
            CustomCategory(
              title: 'Recommended for you',
              recommendItem: recommend,
              onTap: (currentItem) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemDatail(
                        recommendItem: currentItem!,
                        isRecommend: true,
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
