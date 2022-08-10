import 'package:cicgreenloan/modules/report_module/models/documentation_model.dart';
import 'package:flutter/material.dart';

class DocumentList extends StatelessWidget {
  final DocumentationModel? documentationModel;
  const DocumentList({Key? key, this.documentationModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 0, top: 10, bottom: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(1.0, 0.0), color: Colors.black12, blurRadius: 4)
          ]),
      width: 330,
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    documentationModel!.publishedAt!,
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey[500],
            size: 18,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
