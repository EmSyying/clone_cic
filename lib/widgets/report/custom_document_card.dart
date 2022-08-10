import 'package:cicgreenloan/modules/report_module/models/documentation_model.dart';
import 'package:flutter/material.dart';

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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: DecorationImage(
                    image: NetworkImage(documentationModel!.cover!),
                    fit: BoxFit.fill)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    documentationModel!.title!,
                    style: Theme.of(context).textTheme.bodyText2,
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
                    documentationModel!.publishedAt!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black54, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
