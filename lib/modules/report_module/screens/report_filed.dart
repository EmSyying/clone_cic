import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/option_controller/option_controller.dart';
import '../../../widgets/bonus/custom_empty_state.dart';
import '../../../widgets/privilege/privilege/custom_formfield_search.dart';
import '../../../widgets/report/custom_list_with_title.dart';
import '../../../widgets/report/report_shimmer.dart';
import '../controllers/documentation_controller.dart';

class FileCategoriesReport extends StatefulWidget {
  final int currentTabIndex;
  final int? id;
  final String? tabLabel;
  const FileCategoriesReport(
      {Key? key, this.currentTabIndex = 0, this.tabLabel, this.id})
      : super(key: key);

  @override
  State<FileCategoriesReport> createState() => _FileCategoriesReportState();
}

class _FileCategoriesReportState extends State<FileCategoriesReport> {
  final docTypeCon = Get.put(DocumentCategory());
  final documentCon = Get.put(DocumentationController());
  Timer? searchOnStoppedTyping;
  @override
  void dispose() {
    documentCon.onClearSearch();
    super.dispose();
  }

  @override
  void initState() {
    documentCon.fetchReportFileByYear(widget.id, '');

    super.initState();
  }

  onChangeHandler(value) {
    const duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping!.cancel());
    }
    setState(
      () => searchOnStoppedTyping = Timer(duration, () => searchText(value)),
    );
  }

  searchText(textSearch) async {
    await documentCon
        .fetchReportFileByYear(widget.id, textSearch)
        .then((value) {
      documentCon.textSearchController.text = textSearch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isLogo: false,
        isLeading: true,
        context: context,
        backgroundColor: context.theme.backgroundColor,
        elevation: 1,
        title: widget.tabLabel,
        //'Report',
      ),
      body: Obx(
        () => documentCon.isLoadingReportFile.value
            ? ListView.builder(
                padding: const EdgeInsets.only(top: 20),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: ReportShimmer(),
                  );
                })
            : documentCon.modelReportGroupByYear.isNotEmpty
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 38,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11,
                          ),
                          margin: const EdgeInsets.only(
                              top: 20.0, right: 20.0, left: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomFormFieldSearch(
                            onSaved: (e) {},
                            onChanged: (v) {
                              onChangeHandler(v);
                            },
                            controller: documentCon.textSearchController,
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        // Expanded(
                        //   child: InvestorPage(
                        //     tabLabel: docTypeCon.documentTypeList[widget.currentTabIndex].id
                        //         .toString(),
                        //   ),
                        // ),
                        Column(
                          children: documentCon.modelReportGroupByYear
                              .map(
                                (e) => CustomListWithTitle(
                                  year: e.date.toString(),
                                  items: e.reports ?? [],
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  )
                : const CustomEmptyState(
                    title: 'Report',
                    description: 'No File Report !',
                  ),
      ),
    );
  }
}
