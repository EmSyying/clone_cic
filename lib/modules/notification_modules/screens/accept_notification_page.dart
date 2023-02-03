import 'package:cicgreenloan/modules/notification_modules/controllers/notification_controller.dart';
import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/notification_modules/models/notification.dart';
import 'package:cicgreenloan/widgets/notification/custom_confirm_button.dart';
import 'package:cicgreenloan/widgets/notification/notification_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Utils/helper/custom_appbar.dart';

class AcceptNotificationPage extends StatefulWidget {
  final NotificationModel? notificationModel;
  const AcceptNotificationPage({Key? key, this.notificationModel})
      : super(key: key);
  @override
  State<AcceptNotificationPage> createState() => _AcceptNotificationPageState();
}

class _AcceptNotificationPageState extends State<AcceptNotificationPage> {
  final _con = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(
                isLeading: true,
                context: context,
                title: S.of(context).notificationMenu,
                elevation: 1.0),
            body: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    NotificationWidget(
                      notification: widget.notificationModel,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomConfirmbutton(
                                onTap: () {
                                  // onShowCustomCupertinoModalSheet(
                                  //   context: context,
                                  //   child:
                                  //   title: 'UT Trading',
                                  // );
                                },
                                title: 'Reject'),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CustomConfirmbutton(
                                onTap: () {
                                  _con.onAcceptTradeRequest(
                                      type: 'accepted',
                                      reason: [0],
                                      transactionId: widget.notificationModel!
                                          .data!.transactionId,
                                      notificationId:
                                          widget.notificationModel!.id);
                                },
                                title: 'Accept'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Obx(() => _con.isLoading.value
                    ? Container(
                        height: 100,
                        width: 100,
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(1.0, 0.0),
                                  color: Colors.black12,
                                  blurRadius: 6)
                            ]),
                        child: const CircularProgressIndicator())
                    : Container())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
