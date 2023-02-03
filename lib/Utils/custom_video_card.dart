import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class VideoCard extends StatelessWidget {
  final String? videoDuration;
  final String? title;
  final String? vidoeURL;
  final GestureTapCallback? onTap;
  final String? thumnail;
  final String? trainerName;
  final String? pitching;
  const VideoCard(
      {Key? key,
      this.onTap,
      this.videoDuration,
      this.title,
      this.vidoeURL,
      this.thumnail,
      this.trainerName,
      this.pitching})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 3.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: _buildCard(context),
    );
  }

  _buildCard(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: thumnail!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 18,
                      left: 18,
                      right: 18,
                      bottom: 18,
                      child: Icon(
                        Icons.play_circle_fill_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.grey[500],
                          size: 18,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (trainerName != null)
                      Row(
                        children: [
                          const Text(
                            'Trainer: ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                trainerName!,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                    if (trainerName != null)
                      const SizedBox(
                        height: 5,
                      ),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: Colors.grey[500],
                          size: 17,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          videoDuration!,
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        // Expanded(
                        //   child: Text(
                        //     pitching!,
                        //     maxLines: 1,
                        //     overflow: TextOverflow.ellipsis,
                        //     style: TextStyle(fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
