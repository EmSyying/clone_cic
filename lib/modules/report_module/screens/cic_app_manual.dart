import 'package:cicgreenloan/utils/helper/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/option_controller/option_controller.dart';
import '../../../widgets/report/custom_document_card.dart';
import '../../../widgets/report/no_report_found.dart';
import '../../../widgets/report/report_shimmer.dart';
import '../controllers/documentation_controller.dart';
import '../models/documentation_model.dart';

class CiCAppManual extends StatefulWidget {
  const CiCAppManual({
    Key? key,
  }) : super(key: key);

  @override
  State<CiCAppManual> createState() => _CiCAppManualState();
}

class _CiCAppManualState extends State<CiCAppManual> {
  final docCon = Get.put(DocumentationController());
  final optionCon = Get.put(DocumentCategory());

  Future? documentList;

  final _keyRefresh = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    documentList = docCon.getDocumentList(optionCon.documentTypeId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        docCon.documentationList.clear();
        return true;
      },
      child: Scaffold(
          appBar: CustomAppBar(
              title: "CiC App Manual",
              isLeading: true,
              context: context,
              elevation: 1.0,
              isLogo: false),
          body: GetBuilder<DocumentationController>(
            init: DocumentationController(),
            builder: (controller) {
              return RefreshIndicator(
                key: _keyRefresh,
                onRefresh: onRefresh,
                child: FutureBuilder<List<DocumentationModel>>(
                  future: controller
                      .getDocumentList(optionCon.documentTypeId.toString()),
                  builder: (context, snapshot) {
                    var items = snapshot.data;
                    if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done &&
                        docCon.documentationList.isNotEmpty) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const Divider(
                              thickness: 0.5,
                              height: 1,
                            ),
                            items!.isEmpty
                                ? const Center(child: NoReportFound())
                                : ListView.separated(
                                    physics: const ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            debugPrint(
                                                "Url: ${items[index].attachedFile}");
                                            context.push(
                                                '/setting/cic-app-manual/view-report?attachedFile=${items[index].attachedFile}&url=${items[index].attachedFile}&title=CiC App Manual');
                                          },
                                          child: CustomDocumentCard(
                                            documentationModel: items[index],
                                          ));
                                    },
                                    separatorBuilder: (context, index) {
                                      return const Divider(
                                        thickness: 0.5,
                                        height: 1,
                                      );
                                    },
                                    itemCount: items.length),
                          ],
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListView.builder(
                          padding: const EdgeInsets.only(top: 0),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 0),
                              child: ReportShimmer(),
                            );
                          });
                    }
                    if (snapshot.connectionState == ConnectionState.done &&
                        docCon.documentationList.isEmpty) {
                      return const Center(child: NoReportFound());
                    }
                    return Container();
                  },
                ),
              );
            },
          )),
    );
  }

  Future<void> onRefresh() async {
    await docCon.getDocumentList("CiC App Manual");
  }
}
