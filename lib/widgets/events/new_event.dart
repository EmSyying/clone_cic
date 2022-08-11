import 'package:cicgreenloan/modules/event_module/controller/event_controller.dart';
import 'package:cicgreenloan/modules/event_module/models/event_data.dart';
import 'package:cicgreenloan/modules/event_module/models/event_detail_argument.dart';
import 'package:cicgreenloan/modules/event_module/screen/event_detail.dart';
import 'package:cicgreenloan/widgets/events/new_event_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          child: Text("$title", style: Theme.of(context).textTheme.caption),
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
                EventDetailArgument argument =
                    EventDetailArgument(id: evenData.id, eventData: evenData);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EventDetail(),
                      settings: RouteSettings(arguments: argument)),
                );
              },
            );
          },
        )
      ],
    );
  }
}