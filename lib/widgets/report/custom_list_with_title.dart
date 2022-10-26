import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/modules/report_module/models/documentation_model.dart';
import 'package:cicgreenloan/widgets/report/custom_document_card.dart';
import 'package:flutter/material.dart';

class CustomListWithTitle extends StatelessWidget {
  final String? year;
  final List<DocumentationModel> items;
  final void Function(DocumentationModel value)? onTap;
  const CustomListWithTitle(
      {Key? key, this.year, this.items = const [], this.onTap})
      : super(key: key);

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
              if (onTap != null) {
                onTap!(items[index]);
              }
            },
            child: CustomDocumentCard(
              documentationModel: items[index],
              // documentationModel: DocumentationModel(
              //   title: items[index].title,
              //   attachedFile: items[index].attachedFile,
              //   type: items[index].type,
              //   color: items[index].color,
              // ),
            ),
          ),
          separatorBuilder: (context, index) => const Divider(
            height: 0,
          ),
          itemCount: items.length,
        ),
      ],
    );
  }
}
