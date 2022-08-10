import 'package:cicgreenloan/Utils/custom_video_card.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/post_data.dart';
import 'package:flutter/material.dart';

class MoreRelatedVideo extends StatelessWidget {
  final List<VideoPost>? videoList;
  final Function? onTap;
  const MoreRelatedVideo({Key? key, this.videoList, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: videoList!.map((e) {
        return VideoCard(
          onTap: () {
            onTap!(e);
          },
          videoDuration: e.duration!,
          title: e.title!,
          vidoeURL: e.video!,
          trainerName: e.trainer!,
          pitching: e.module!.title!,
          thumnail: e.image!,
        );
      }).toList(),
    );
  }
}
