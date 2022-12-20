import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/widgets/report/custom_document_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../modules/report_module/models/model_detail_report/reports_group_by_year.model.dart';

class CustomListWithTitle extends StatelessWidget {
  final String? year;
  final List<ReportGroupByYearModel> items;
  // final void Function(ReportGroupByYearModel value)? onTap;
  const CustomListWithTitle({
    Key? key,
    this.year,
    this.items = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 20.0,
            bottom: 16.0,
            top: 16.0,
          ),
          child: Text(
            year ?? '',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColor.chartLabelColor,
                  fontSize: 14,
                ),
          ),
        ),
        ListView.separated(
          padding: const EdgeInsets.all(0.0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              context.push(
                  '/report_screen/view-report-list?attachedFile=${items[index].attachedFile}&title=${items[index].title}&url=${items[index].url}');
            },
            child: CustomDocumentCard(
              documentationModel: items[index],
            ),
          ),
          separatorBuilder: (context, index) => const Divider(
            height: 1,
          ),
          itemCount: items.length,
        ),
      ],
    );
  }
}
