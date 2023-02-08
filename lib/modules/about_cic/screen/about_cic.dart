// ignore_for_file: must_be_immutable

import 'package:cicgreenloan/Utils/web_view/web_view.dart';
import 'package:cicgreenloan/modules/about_cic/controller/about_cic_controller.dart';
import 'package:flutter/material.dart';
import 'package:cicgreenloan/widgets/aboutCIC/custom_card_about_cic.dart';
import 'package:cicgreenloan/modules/about_cic/model/about_cic_model.dart';
import 'package:cicgreenloan/widgets/aboutCIC/custom_card_about_cic_shimmer.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';

class AboutCIC extends StatelessWidget {
  bool? isNavigator;
  AboutCIC({Key? key, this.isNavigator}) : super(key: key);
  final aboutCicController = Get.put(AboutCICController());
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: CustomAppBar(
            isLeading: true,
            context: context,
            elevation: 1.0,
            title: 'About CiC'),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 22.0, right: 20.0, top: 15.0, bottom: 15.0),
              child: const Text(
                'CiC is the first local initiative investment platform which contributes to the sustainability of the local economy.',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  color: Color(0xff6D7174),
                ),
              ),
            ),
            const Divider(
              height: 5,
              // color: Colors.black,
            ),
            Expanded(
              child: RefreshIndicator(
                key: refreshKey,
                onRefresh: onRefresh,
                child: GetBuilder<AboutCICController>(
                  init: AboutCICController(),
                  builder: (controller) {
                    return FutureBuilder<List<AboutCICModel>>(
                      future: controller.fetchAboutCicList(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            controller.aboutCicList.isNotEmpty) {
                          return ListView.separated(
                            // physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => const Divider(
                              height: 0,
                              endIndent: 20,
                              indent: 20,
                              thickness: 1,
                            ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewWebsite(
                                              url: snapshot
                                                  .data![index].conpamyLink!,
                                              title: snapshot
                                                  .data![index].conpamyName!,
                                            )));
                              },
                              child: CustomAboutCIC(
                                aboutCICModel: snapshot.data![index],
                              ),
                            ),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return const CustomAboutCICShimmer();
                              },
                            ),
                            // child: CircularProgressIndicator(),
                          );
                        }
                        return Container();
                      },
                    );
                  },
                ),
              ),
            ),

            // Divider(
            //   height: 5,
            //   // color: Colors.black,
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> onRefresh() async {
    aboutCicController.update();
  }
}
