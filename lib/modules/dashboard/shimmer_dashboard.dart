import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../Utils/app_settings/controllers/appsetting_controller.dart';

class ShimmerDashboadScreen extends StatelessWidget {
  ShimmerDashboadScreen({super.key});
  final _settingCon = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          enabled: true,
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.white,
          child: Container(
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          ),
        ),
        AspectRatio(
          aspectRatio: 3 / 3.37,
          child: Container(
            margin:
                const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1.0, 0.0),
                    blurRadius: 4)
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              // key: key1,
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Obx(
                    () => GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2.35,
                        children: _settingCon.appSettingDataList.map((value) {
                          return customMenu(
                              icon: value.icon, label: value.label);
                        }).toList()),
                  ),
                  AspectRatio(
                    aspectRatio: 6.20 / 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      ],
    );
  }
}

Widget customMenu({
  final String? icon,
  final String? label,
}) {
  return AspectRatio(
    aspectRatio: 2 / 1.55,
    child: Container(
      // width: double.infinity,
      color: Colors.white,
      child: Shimmer.fromColors(
        enabled: true,
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 50,
              height: 5,
              color: Colors.grey,
            )
            // Text(
            //   label!,
            //   style: const TextStyle(
            //       fontFamily: 'DMSans',
            //       fontSize: 13,
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold),
            // ),
          ],
        ),
      ),
    ),
  );
}
