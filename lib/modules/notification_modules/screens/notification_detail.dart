import 'package:cicgreenloan/modules/notification_modules/models/notification.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Utils/helper/custom_appbar.dart';

class NotificationDetailPage extends StatefulWidget {
  final NotificationModel? notificationData;
  const NotificationDetailPage({Key? key, this.notificationData})
      : super(key: key);

  @override
  State<NotificationDetailPage> createState() => _NotificationDetailPageState();
}

class _NotificationDetailPageState extends State<NotificationDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Notification', context: context, isLeading: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                    'assets/images/svgfile/utNotificationIcon.svg'),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.notificationData!.data!.title}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'DMSans',
                      ),
                    ),
                    Text(
                      widget.notificationData!.humanCreatedAt!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontFamily: 'DMSans',
                      ),
                    )
                  ],
                ),
                const Spacer(),
                widget.notificationData!.data!.status != 'Unmatch'
                    ? Text(
                        '${widget.notificationData!.data!.status}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DMSans',
                        ),
                      )
                    : Text(
                        '${widget.notificationData!.data!.status}',
                        style: const TextStyle(
                          color: Color(0xffE28112),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DMSans',
                        ),
                      ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: Text(
              '${widget.notificationData!.data!.body}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomButton(
              onPressed: () {},
              title: 'View Detail',
              isOutline: false,
              isDisable: false,
            ),
          )
        ],
      ),
    );
  }
}
