import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/option_controller/option_controller.dart';
import '../../../widgets/privilege/privilege/custom_formfield_search.dart';
import '../../../widgets/report/custom_list_with_title.dart';
import '../controllers/documentation_controller.dart';
import '../models/documentation_model.dart';

class FileCategoriesReport extends StatefulWidget {
  final int currentTabIndex;
  final String? tabLabel;
  const FileCategoriesReport(
      {Key? key, this.currentTabIndex = 0, this.tabLabel})
      : super(key: key);

  @override
  State<FileCategoriesReport> createState() => _FileCategoriesReportState();
}

class _FileCategoriesReportState extends State<FileCategoriesReport> {
  final docTypeCon = Get.put(DocumentCategory());
  final contr = Get.put(DocumentationController());

  int selectIndex = 0;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 38,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 11,
              ),
              margin: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomFormFieldSearch(
                onSaved: (e) {},
                onChanged: (v) {},
                //  controller: privilegController.textSearchController,
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
              children: year
                  .map(
                    (e) => CustomListWithTitle(
                      onTap: (value) {
                        debugPrint(value.title);
                      },
                      year: e['year'],
                      items: e['items'],
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

List year = [
  {
    'year': '2022',
    'items': [
      DocumentationModel(
        title: 'ID Report 01',
        publishedAt: '10/10/2022',
        color: '#B9F3FE',
        cover: 'assets/images/svgfile/pdfIcon.svg',
      ),
      DocumentationModel(
          title: 'ID Report 02',
          color: '#DF5249',
          publishedAt: '10/05/2022',
          cover: 'assets/images/svgfile/pdfIcon.svg'),
    ]
  },
  {
    'year': '2022',
    'items': [
      DocumentationModel(
          title: 'ID Report 03',
          color: '#B9F3FE',
          publishedAt: '2/06/2022',
          cover: 'assets/images/svgfile/pdfIcon.svg'),
      DocumentationModel(
          title: 'ID Report 04',
          color: '#EFD5FC',
          publishedAt: '1/07/2022',
          cover: 'assets/images/svgfile/pdfIcon.svg'),
    ]
  },
];
