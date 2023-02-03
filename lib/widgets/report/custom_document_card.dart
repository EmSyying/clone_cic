import 'package:cicgreenloan/Utils/function/convert_fromhex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../modules/report_module/models/model_detail_report/reports_group_by_year.model.dart';

class CustomDocumentCard extends StatelessWidget {
  final ReportGroupByYearModel? documentationModel;
  const CustomDocumentCard({Key? key, this.documentationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 0, top: 15, bottom: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      width: 330,
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: fromHex(documentationModel!.color ?? '').withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: SvgPicture.network(
              documentationModel!.cover ?? '',
              color: documentationModel!.color != null &&
                      documentationModel!.color!.isNotEmpty
                  ? fromHex(documentationModel!.color!)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    documentationModel!.title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  documentationModel!.publishedAt ?? '',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
