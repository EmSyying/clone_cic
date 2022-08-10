import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class AboutEventDescription extends StatelessWidget {
  final String? description;
  final String? title;
  const AboutEventDescription({Key? key, this.description, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      description != ''
          ? Container(
              margin: const EdgeInsets.only(left: 15.0, top: 20.0),
              child: Text("$title", style: Theme.of(context).textTheme.caption),
            )
          : Container(),
      Container(
        margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
        child: ExpandableText(
          description!,
          expandText: 'show more',
          collapseText: 'show less',
          maxLines: 3,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      )
    ]);
  }
}
