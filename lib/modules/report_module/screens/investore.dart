import 'package:cicgreenloan/modules/report_module/controllers/documentation_controller.dart';
import 'package:cicgreenloan/modules/report_module/models/documentation_model.dart';
import 'package:cicgreenloan/widgets/report/no_report_found.dart';
import 'package:cicgreenloan/widgets/report/custom_document_card.dart';
import 'package:cicgreenloan/widgets/report/report_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../Utils/helper/firebase_analytics.dart';

class InvestorPage extends StatefulWidget {
  final String? tabLabel;
  final int? currentIndex;

  const InvestorPage({Key? key, this.tabLabel, this.currentIndex})
      : super(key: key);
  @override
  State<InvestorPage> createState() => _InvestorPageState();
}

class _InvestorPageState extends State<InvestorPage> {
  final docCon = Get.put(DocumentationController());

  Future? documentList;

  final _keyRefresh = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    documentList = docCon.getDocumentList("investor");
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
          body: GetBuilder<DocumentationController>(
        init: DocumentationController(),
        builder: (controller) {
          return RefreshIndicator(
            key: _keyRefresh,
            onRefresh: onRefresh,
            child: FutureBuilder<List<DocumentationModel>>(
              future: controller.getDocumentList(widget.tabLabel!),
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
                        ListView.separated(
                          itemCount: items!.length,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          // padding: EdgeInsets.symmetric(vertical: 10),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                      'View Report ${items[index].title}');
                                  context.push(
                                      '/report/${widget.currentIndex}/view-report?attachedFile=${items[index].attachedFile}&title=${items[index].title}&url=${items[index].url}');
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
                        ),
                        // Divider(
                        //   thickness: 0.5,
                        //   height: 1,
                        // ),
                      ],
                    ),
                  );
                  //  ListView.builder(
                  //     padding: EdgeInsets.only(top: 10),
                  //     itemBuilder: (context, index) {
                  //       return GestureDetector(
                  //           onTap: () {
                  //             Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) => ViewReport(
                  //                           documentationModel: items![index],
                  //                         )));
                  //           },
                  //           child:
                  //            DocumentList(
                  //             documentationModel: items![index],
                  //           ));
                  //     },
                  //     itemCount: items!.length);
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
    await docCon.getDocumentList(widget.tabLabel!);
  }
}
