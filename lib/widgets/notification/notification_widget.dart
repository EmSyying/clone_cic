import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:cicgreenloan/modules/notification_modules/controllers/notification_controller.dart';
import 'package:cicgreenloan/modules/notification_modules/models/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Utils/function/convert_fromhex_color.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationModel? notification;
  final String? fromPage;
  const NotificationWidget({Key? key, this.notification, this.fromPage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final con = Get.put(NotificationController());

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: notification!.readAt == null && fromPage == null
              ? const Color(0XFFE5E5E5).withOpacity(0.1)
              : Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      fromHex('${notification!.data!.color}').withOpacity(0.2),
                ),
                alignment: Alignment.center,
                child: SvgPicture.network('${notification!.data!.icon}'),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 15,
                          child: Text(
                            notification!.data!.title != ""
                                ? '${notification!.data!.title}'
                                : notification!.data!.message != ""
                                    ? notification!.data!.message!
                                    : "",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'DMSans',
                              color: notification!.readAt == null
                                  ? Colors.black
                                  : const Color(0xff6D7174),
                            ),
                            maxLines: fromPage != '' ? 10 : 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        notification!.data!.status != '' && fromPage == null
                            ? Text(
                                notification!.data!.status == null
                                    ? ''
                                    : '${notification!.data!.status}',
                                style: TextStyle(
                                  color:
                                      notification!.data!.status == 'Rejected'
                                          ? const Color(0xffED1E26)
                                          : notification!.data!.status ==
                                                  'Unmatched'
                                              ? const Color(0xffE28112)
                                              : Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'DMSans',
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )
                            : Container(),
                        if (notification!.readAt == null)
                          const SizedBox(width: 25),
                        notification!.readAt == null && fromPage == null
                            ? Container(
                                height: 8.0,
                                width: 8.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    if (fromPage != 'rejectPopup')
                      Text(
                        '${notification!.data!.body}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'DMSans',
                            color: notification!.readAt == null
                                ? Colors.black87
                                : const Color(0xff6D7174),
                            fontWeight: FontWeight.w100),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        '${FormatDate.notificationDate(notification!.updatedAt)}    ${notification!.humanCreatedAt}',
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                  ],
                ),
              ),
              if (fromPage != null)
                InkWell(
                  child: const Icon(Icons.close),
                  onTap: () {
                    con.onReadNotification(notification!.id!);
                    Navigator.pop(context);
                  },
                )
            ],
          ),
          // if (fromPage != 'rejectPopup')
          //   Text(
          //     '${notification!.data!.body}',
          //     maxLines: 2,
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(
          //         fontSize: 14,
          //         fontFamily: 'DMSans',
          //         color: notification!.readAt == null
          //             ? Colors.black87
          //             : const Color(0xff6D7174),
          //         fontWeight: FontWeight.w100),
          //   ),
        ],
      ),
    );
  }
}
