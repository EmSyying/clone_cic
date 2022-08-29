import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/modules/notification_modules/controllers/notification_controller.dart';
import 'package:cicgreenloan/modules/notification_modules/models/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/link.dart';

import '../../utils/helper/color.dart';

class PopUpAnnouncement extends StatelessWidget {
  final NotificationModel? notificationModel;
  final Function? onCancel;
  final Function? onNext;

  const PopUpAnnouncement(
      {Key? key, this.notificationModel, this.onCancel, this.onNext})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final notificationCon = Get.put(NotificationController());
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetAnimationCurve: Curves.ease,
      insetAnimationDuration: const Duration(seconds: 0),
      insetPadding:
          const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      backgroundColor: Colors.red,
      elevation: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 5 / 2.3,
                  child: Stack(
                    children: [
                      const SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      Positioned.fill(
                        child: CachedNetworkImage(
                          imageUrl: notificationModel!.data!.image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              notificationCon
                                  .onReadNotification(notificationModel!.id!);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black26),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(notificationModel!.data!.title!,
                      style: Theme.of(context).textTheme.caption),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    notificationModel!.data!.message!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14),
                  ),
                ),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                //   child: Text(
                //       'Real Estate & Building Technology Conference Leading in India became theepicenters of growth and Urbanization is the most prominent demographic trend.',
                //       style: Theme.of(context).textTheme.bodyText2),
                // ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: notificationModel!.data!.button!
                      .map(
                        (data) => Link(
                          target: LinkTarget.self,
                          uri: Uri.parse(data.target!),
                          builder: (context, followLink) => InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              notificationCon
                                  .onReadNotification(notificationModel!.id!);
                              followLink!();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: Text(
                                data.title!,
                                style: const TextStyle(
                                  fontFamily: 'DMSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.mainColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
