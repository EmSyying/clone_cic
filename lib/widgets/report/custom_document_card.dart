import 'package:cicgreenloan/Utils/function/convert_fromhex_color.dart';
import 'package:cicgreenloan/modules/report_module/models/documentation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDocumentCard extends StatelessWidget {
  final DocumentationModel? documentationModel;
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
              color: fromHex(documentationModel!.color!).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
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
                child: Text(
                  documentationModel!.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  documentationModel!.publishedAt ?? '',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
