import 'package:cicgreenloan/modules/event_module/models/event_data.dart';
import 'package:cicgreenloan/modules/event_module/screen/event_search_screen.dart';

import 'package:cicgreenloan/widgets/events/feature_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          margin: const EdgeInsets.only(
              top: 10.0, bottom: 5.0, left: 20, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$title", style: Theme.of(context).textTheme.bodySmall),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EventSearchScreen(),
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/images/svgfile/search.svg',
                      height: 20,
                    ),
                  ),

                  // GestureDetector(
                  //   onTap: () {},
                  //   child: SvgPicture.asset(
                  //     'assets/images/svgfile/eventFilter.svg',
                  //     height: 18,
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: featureDataList.asMap().entries.map((e) {
                return GestureDetector(
                  onTap: () {
                    // EventDetailArgument argument =
                    //     EventDetailArgument(id: e.value.id);
                    context.go('/event/${e.value.id}');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: FeatureCard(
                      eventData: e.value,
                    ),
                  ),
                );
              }).toList()),
        ),
      ],
    );
  }
}
