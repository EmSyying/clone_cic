import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import '../../../Utils/helper/custom_appbar.dart';
import '../../../utils/helper/cic/cic_guider.dart';
import '../../../widgets/report/custom_report_catigories_card.dart';
import '../../guilder/guider_controller.dart';
import '../controllers/documentation_controller.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  _showGuildLine(BuildContext context, CiCGuidController guideController) {
    CiCApp.showOverlays(
      itemCount: guideController.reportGuide.length,
      key: (index) => guideController.reportGuide[index].key!,
      titleBuilder: (index) => guideController.reportGuide[index].title,
      descriptionBuilder: (index) =>
          guideController.reportGuide[index].description,
      objectSettingBuilder: (index) => ObjectSetting(),
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final reportCon = Get.put(DocumentationController());
    final guideController = Get.put(CiCGuidController());
    reportCon.fetchCategoriesCardReport();

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
                _showGuildLine(context, guideController);
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
                    horizontal: 20.0, vertical: 20.0),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: reportCon.listCategoryCardReport.length,
                itemBuilder: (BuildContext _, index) {
                  return CustomReportCatigoriesCard(
                    key: guideController.reportGuide[index].key = GlobalKey(),
                    onTap: () {
                      context.push(
                        '/report_screen/report-filed?tabLabel=${reportCon.listCategoryCardReport[index].category}&id=${reportCon.listCategoryCardReport[index].id}',
                      );
                    },
                    title: reportCon.listCategoryCardReport[index].category,
                    //icons: reportCon.listCategoryCardReport[index].icon,
                    // item: reportCon.listCategoryCardReport[index].reportCount
                    //     .toString(),
                  );
                }),
      ),
    );
  }
}
