import 'package:cicgreenloan/modules/event_module/controller/event_controller.dart';
import 'package:cicgreenloan/modules/event_module/models/event_data.dart';
import 'package:cicgreenloan/widgets/events/new_event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../modules/event_module/screen/event_search_screen.dart';

class NewEvent extends StatelessWidget {
  final String? title;
  final List<EventData> newDataList;
  NewEvent({Key? key, this.title, this.newDataList = const []})
      : super(key: key);
  final eventCon = Get.put(EventController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$title", style: Theme.of(context).textTheme.caption),
              if (eventCon.featureDataList.isEmpty)
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
            ],
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: newDataList.length,
          itemBuilder: (context, index) {
            var evenData = newDataList[index];
            return GestureDetector(
              child: NewEventCard(
                eventData: evenData,
              ),
              onTap: () {
                context.go('/event/${evenData.id}');
              },
            );
          },
        )
      ],
    );
  }
}
