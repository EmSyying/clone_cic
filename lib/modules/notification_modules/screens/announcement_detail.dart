import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/notification_data.dart';

class AnnouncementDetail extends StatelessWidget {
  final NotificationData? notificationData;
  const AnnouncementDetail({Key? key, this.notificationData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Announcement',
        isLeading: true,
        isLogo: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Stack(
                    children: [
                      if (notificationData!.image != '')
                        AspectRatio(
                          aspectRatio: 5 / 2.3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: notificationData!.image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    notificationData!.title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    notificationData!.body ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          // if (notificationData!.button!.isNotEmpty)
          //   Row(
          //     children: notificationData!.button!
          //         .asMap()
          //         .entries
          //         .map(
          //           (button) => SizedBox(
          //             height: 50,
          //             child: CustomButton(
          //               isDisable: false,
          //               isOutline: false,
          //               onPressed: () {
          //                 launchUrl(
          //                   Uri.parse('${button.value.target}'),
          //                   mode: LaunchMode.externalApplication,
          //                 );
          //               },
          //               title: "Update Now",
          //             ),
          //           ),
          //         )
          //         .toList(),
          //   )

          if (notificationData!.button!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: CustomButton(
                isDisable: false,
                isOutline: false,
                onPressed: () {
                  launchUrl(
                    Uri.parse("${notificationData!.button![0].target}"),
                    mode: LaunchMode.externalApplication,
                  );
                },
                title: "${notificationData!.button![0].label}",
              ),
            ),
        ],
      ),
    );
  }
}
