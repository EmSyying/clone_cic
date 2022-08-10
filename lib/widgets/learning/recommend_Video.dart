import 'package:cicgreenloan/Utils/custom_video_card.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/post_data.dart';
import 'package:flutter/material.dart';

class RecommendVideo extends StatelessWidget {
  final String? channelTitle;
  final GestureTapCallback? onTapSeeAll;
  final Function? onTapVideo;
  final List<VideoPost>? videoList;

  const RecommendVideo(
      {Key? key,
      this.channelTitle,
      this.onTapSeeAll,
      this.onTapVideo,
      this.videoList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Recommend Video',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                channelTitle!,
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
              const Text(
                'See all',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              )
            ],
          ),
        ),
        Column(
          children: videoList!.map(
            (e) {
              return VideoCard(
                onTap: () {
                  onTapVideo!(e);
                },
                videoDuration: e.duration!,
                title: e.title!,
                vidoeURL: e.video!,
                trainerName: e.trainer!,
                pitching: e.module!.title!,
                thumnail: e.image!,
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
