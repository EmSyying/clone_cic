import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import '../../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../../Utils/helper/custom_appbar.dart';
import '../../../utils/helper/cic/cic_guider.dart';
import '../../../widgets/report/custom_report_catigories_card.dart';
import '../../guilder/guider_controller.dart';
import '../controllers/documentation_controller.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  Future<void> _showGuildLine(BuildContext context,
      DocumentationController reportCon, bool allowSkip) async {
    await CiCApp.showOverlays(
      allowSkip: allowSkip,
      itemCount: reportCon.listCategoryCardReport.length,
      key: (index) => reportCon.listCategoryCardReport[index].key!,
      titleBuilder: (index) => reportCon.listCategoryCardReport[index].category,
      descriptionBuilder: (index) =>
          reportCon.listCategoryCardReport[index].guideline,
      objectSettingBuilder: (index) => ObjectSetting(
        paddingSize: const Size(-2, 2),
      ),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final reportCon = Get.put(DocumentationController());
    final guideController = Get.put(CiCGuidController());
    final settingController = Get.put(SettingController());
    reportCon.fetchCategoriesCardReport();
    // checkOverLay(context, guideController);

    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Get.put(SettingController()).getCurrentTapBottom.value = 0;
            context.pop();
          },
          icon: kIsWeb
              ? const Icon(Icons.arrow_back)
              : Platform.isIOS
                  ? const Icon(Icons.arrow_back_ios)
                  : const Icon(Icons.arrow_back),
        ),
        isLogo: false,
        isLeading: true,
        context: context,
        backgroundColor: context.theme.colorScheme.background,
        elevation: 1,
        title: settingController.isAMMode! ? 'Resource' : 'Report',
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () async {
                _showGuildLine(context, reportCon, true);

                // await LocalData.storeAppTou('appTour', true);
              },
              child: SvgPicture.asset('assets/images/demo.svg'),
            ),
          ),
        ],
      ),
      body: Obx(
        () => reportCon.loadingCardReport.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 4 / 2.5,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: reportCon.listCategoryCardReport.length,
                itemBuilder: (BuildContext _, index) {
                  return CustomReportCatigoriesCard(
                    key: reportCon.listCategoryCardReport[index].key =
                        GlobalKey(),
                    onTap: () {
                      final reportName = reportCon
                          .listCategoryCardReport[index].category
                          ?.replaceAll('&', '%26');
                      context.push(
                        '/report/report-filed?tabLabel=$reportName&id=${reportCon.listCategoryCardReport[index].id}',
                      );
                    },
                    title: reportCon.listCategoryCardReport[index].category,
                    icons: reportCon.listCategoryCardReport[index].icon,
                    item: reportCon.listCategoryCardReport[index].reportCount
                        .toString(),
                  );
                }),
      ),
    );
  }
}
