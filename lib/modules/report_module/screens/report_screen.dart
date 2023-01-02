import 'package:cicgreenloan/utils/helper/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import '../../../Utils/helper/custom_appbar.dart';
import '../../../utils/helper/cic/cic_guider.dart';
import '../../../widgets/report/custom_report_catigories_card.dart';
import '../../guilder/guider_controller.dart';
import '../../guilder/local_key.dart/local_guide_key.dart';
import '../controllers/documentation_controller.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  Future<void> _showGuildLine(BuildContext context,
      CiCGuidController guideController, bool allowSkip) async {
    await CiCApp.showOverlays(
      allowSkip: allowSkip,
      itemCount: guideController.reportGuide.length,
      key: (index) => guideController.reportGuide[index].key!,
      titleBuilder: (index) => guideController.reportGuide[index].title,
      descriptionBuilder: (index) =>
          guideController.reportGuide[index].description,
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
    reportCon.fetchCategoriesCardReport();
    // checkOverLay(context, guideController);

    return Scaffold(
      appBar: CustomAppBar(
        isLogo: false,
        isLeading: true,
        context: context,
        backgroundColor: context.theme.backgroundColor,
        elevation: 1,
        title: 'Report',
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () async {
                _showGuildLine(context, guideController, true);

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
                    key: guideController.reportGuide[index].key = GlobalKey(),
                    onTap: () {
                      final reportName = reportCon
                          .listCategoryCardReport[index].category
                          ?.replaceAll('&', '%26');
                      context.push(
                        '/report_screen/report-filed?tabLabel=$reportName&id=${reportCon.listCategoryCardReport[index].id}',
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
