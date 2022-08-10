import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/channel_model.dart';
import 'package:flutter/material.dart';

class ModuleCard extends StatelessWidget {
  final ChannelData? channelData;
  const ModuleCard({Key? key, this.channelData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      margin: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              offset: Offset(1.0, 0.0), color: Colors.black12, blurRadius: 6)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 130,
            width: double.infinity,
            child: Stack(
              children: [
                const SizedBox(height: double.infinity, width: double.infinity),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: SizedBox(
                      height: 110,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: channelData!.image!,
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(channelData!.logo!),
                    // backgroundColor: Colors.blue,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              channelData!.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              '${channelData!.numberOfModule} Modules',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
