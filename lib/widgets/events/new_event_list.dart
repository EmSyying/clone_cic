import 'package:cicgreenloan/modules/event_module/models/event_data.dart';
import 'package:cicgreenloan/widgets/events/new_event_card.dart';
import 'package:flutter/material.dart';

class NewEventList extends StatelessWidget {
  final List<EventData>? newListData;
  const NewEventList({Key? key, this.newListData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemBuilder: (context, index) {
        return NewEventCard(
          eventData: newListData![index],
        );
      },
      itemCount: newListData!.length,
    );
  }
}
