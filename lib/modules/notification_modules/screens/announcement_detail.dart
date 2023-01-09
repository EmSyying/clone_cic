import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/form_builder/custom_button.dart';

class AnnouncementDetail extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subTitle;
  final String? url;
  const AnnouncementDetail(
      {Key? key, this.imageUrl, this.title, this.subTitle, this.url})
      : super(key: key);

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
                      if (imageUrl != '')
                        AspectRatio(
                          aspectRatio: 5 / 2.3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: imageUrl!,
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
                    title ?? '',
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
                    subTitle ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
          Text(url.toString()),
          if (url != "null" && url != "" && url != null)
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
              child: CustomButton(
                isDisable: false,
                isOutline: false,
                onPressed: () {
                  launchUrl(
                    Uri.parse('$url'),
                    mode: LaunchMode.externalApplication,
                  );
                },
                title: "Update Now",
              ),
            )
        ],
      ),
    );
  }
}
