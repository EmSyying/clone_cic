import 'package:cicgreenloan/modules/event_module/models/event_data.dart';
import 'package:cicgreenloan/modules/event_module/models/event_detail_argument.dart';

import 'package:cicgreenloan/widgets/events/feature_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatureEvent extends StatelessWidget {
  final String? title;
  final List<EventData> featureDataList;
  const FeatureEvent({Key? key, this.title, this.featureDataList = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
          child: Text("$title", style: Theme.of(context).textTheme.caption),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: featureDataList.asMap().entries.map((e) {
                return GestureDetector(
                  onTap: () {
                    EventDetailArgument argument =
                        EventDetailArgument(id: e.value.id);
                    context.go('/event-detail/${e.value.id}');
                  },
                  child: FeatureCard(
                    eventData: e.value,
                  ),
                );
              }).toList()),
        ),
      ],
    );
  }
}
