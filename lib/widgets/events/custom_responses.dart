import 'package:cicgreenloan/widgets/events/custom_responses_info.dart';
import 'package:flutter/material.dart';

class CustomResponses extends StatelessWidget {
  final int? numberOfJoin;
  final int? interested;
  final int? numberOfShare;
  const CustomResponses(
      {Key? key, this.numberOfJoin, this.interested, this.numberOfShare})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child:
              Text("Responses", style: Theme.of(context).textTheme.bodySmall),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                  child: CustomResponsesInfo(
                      title: "Joined", value: numberOfJoin)),
              Expanded(
                  child: CustomResponsesInfo(
                      title: "Interested", value: interested)),
              Expanded(
                  child: CustomResponsesInfo(
                      title: "Shares", value: numberOfShare))
            ],
          ),
        ),
      ],
    );
  }
}
