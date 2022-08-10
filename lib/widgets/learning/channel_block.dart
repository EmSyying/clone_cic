import 'package:cicgreenloan/modules/learning_platform_module/models/channel_model.dart';
import 'package:cicgreenloan/widgets/learning/module_card.dart';
import 'package:flutter/material.dart';

class ChannelBlock extends StatelessWidget {
  final String? cardTitle;
  final List<ChannelData>? channelData;
  final Function? onTap;
  const ChannelBlock({Key? key, this.cardTitle, this.channelData, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            cardTitle!,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: channelData!.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  onTap!(channelData![index]);
                },
                child: ModuleCard(
                  channelData: channelData![index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
