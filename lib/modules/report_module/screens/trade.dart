import 'package:cicgreenloan/modules/report_module/controllers/documentation_controller.dart';
import 'package:cicgreenloan/widgets/report/document_list.dart';
import 'package:cicgreenloan/widgets/report/report_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Trade extends StatefulWidget {
  const Trade({Key? key}) : super(key: key);

  @override
  State<Trade> createState() => _TradeState();
}

class _TradeState extends State<Trade> {
  final docCon = Get.put(DocumentationController());

  final _keyRefresh = GlobalKey<RefreshIndicatorState>();

  Future<void> onRefresh() async {
    await docCon.getDocumentList("trade");
  }

  @override
  void initState() {
    docCon.getDocumentList("trade");
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
        body: Obx(
          () => !docCon.isLoading.value
              ? RefreshIndicator(
                  key: _keyRefresh,
                  onRefresh: onRefresh,
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      itemBuilder: (context, index) {
                        var item = docCon.documentationList[index];

                        return GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ViewReport(
                              //               documentationModel: item,
                              //             )));
                            },
                            child: DocumentList(
                              documentationModel: item,
                            ));
                      },
                      itemCount: docCon.documentationList.length),
                )
              : ListView.builder(
                  itemCount: 10,
                  padding: const EdgeInsets.only(top: 10),
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: ReportShimmer(),
                    );
                  }),
        ),
      ),
    );
  }
}
