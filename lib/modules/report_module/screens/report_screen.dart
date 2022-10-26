import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import '../../../Utils/helper/custom_appbar.dart';
import '../../../widgets/report/custom_report_catigories_card.dart';
import '../controllers/documentation_controller.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contr = Get.put(DocumentationController());
    return Scaffold(
      appBar: CustomAppBar(
        isLogo: false,
        isLeading: true,
        context: context,
        backgroundColor: context.theme.backgroundColor,
        elevation: 1,
        title: 'Report',
      ),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: contr.listCategoriesReport.length,
          itemBuilder: (BuildContext _, index) {
            return CustomReportCatigoriesCard(
              onTap: () {
                context.push(
                    '/report_screen/report-filed?tabLabel=${contr.listCategoriesReport[index].title}');
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => FileCategoriesReport(
                //         tabLabel: contr.listCategoriesReport[index].title,
                //       ),
                //     ));
              },
              title: contr.listCategoriesReport[index].title,
              icons: contr.listCategoriesReport[index].icons,
              item: contr.listCategoriesReport[index].item,
            );
          }),
    );
  }
}
