import 'package:cicgreenloan/Utils/helper/custom_appbar_colorswhite.dart';
import 'package:cicgreenloan/modules/news/screen/news_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../../Utils/custom_indicatior.dart';
import '../../../widgets/news/custom_breaking_new_card.dart';
import '../../../widgets/news/custom_current_news_card.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final settingCon = Get.put(SettingController());
  int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        title: 'News',
        context: context,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: AspectRatio(
                aspectRatio: 5 / 2.3,
                child: Swiper(
                  loop: true,
                  index: settingCon.currentIndex.value,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewsDetailScreen(),
                          ),
                        );
                        // context.push('/news-screen');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, bottom: 15),
                          alignment: Alignment.bottomLeft,
                          width: double.infinity,
                          height: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://www.jobstreet.com.my/career-resources/wp-content/uploads/sites/4/2021/11/How-to-Write-Meeting-Minutes-7-Easy-Steps-to-Follow-Templates.jpg',
                                ),
                                fit: BoxFit.cover),
                          ),
                          child: Text(
                            'Cambodian Investors Community Association (CiC) is providing invest',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),

                        // Stack(
                        //   children: [
                        //     Positioned.fill(
                        //         ///////static image
                        //         child: Image.network(
                        //       settingCon.slideList![index].image!,
                        //       fit: BoxFit.cover,
                        //     )),
                        //     ///////buitton on banner slide
                        //     Positioned(
                        //       bottom: 20,
                        //       left: 25,
                        //       child: settingCon.slideList![index].button != null
                        //           ? Row(
                        //               children: [
                        //                 GestureDetector(
                        //                     onTap: () {
                        //                       context.go(
                        //                           '/slide-news-detail-screen');
                        //                     },
                        //                     child: Expanded(
                        //                       child: Text(
                        //                           'Cambodian Investors Community Association (CiC) is providing invest',
                        //                           style: Theme.of(context)
                        //                               .textTheme
                        //                               .headline6!
                        //                               .copyWith(
                        //                                   fontSize: 16,
                        //                                   fontWeight:
                        //                                       FontWeight.w700)),
                        //                     )),
                        //               ],
                        //             )
                        //           : Container(),
                        //     )
                        //   ],
                        // ),
                      ),
                    );
                    // }
                    // return Container();
                  },
                  onIndexChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                    setState(() {});
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
              height: 15,
            ),
            Obx(() => !settingCon.isLoadingSlide.value &&
                    settingCon.slideList!.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: settingCon.slideList!
                        .asMap()
                        .entries
                        .where((element) => element.value.status == 'Display')
                        .map((e) {
                      return CustomIndicator(
                        isSelect: e.key == settingCon.currentIndex.value,
                      );
                    }).toList(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CustomIndicator(
                        isSelect: true,
                      )
                    ],
                  )),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'Breaking News',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: breakingModelList
                    .asMap()
                    .entries
                    .map((e) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NewsDetailScreen(),
                              ),
                            );
                          },
                          child: CustomBreakingNewCard(
                            title: e.value.title,
                            img: e.value.img,
                            date: e.value.date,
                            estimate: e.value.estimate,
                          ),
                        ))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text(
                'Current News',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
            Column(
              children: currentNewsList
                  .asMap()
                  .entries
                  .map((e) => GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const SlideDetailScreen(),
                          //   ),
                          // );
                          context.push('/news-screen');
                        },
                        child: CustomCurrentNewCard(
                          title: e.value.title,
                          img: e.value.img,
                          estimate: e.value.estimate,
                          date: e.value.date,
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
