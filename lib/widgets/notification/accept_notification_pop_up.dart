import 'package:cicgreenloan/modules/notification_modules/controllers/notification_controller.dart';
import 'package:cicgreenloan/modules/notification_modules/models/notification.dart';
import 'package:cicgreenloan/modules/notification_modules/screens/reject_reason.dart';
import 'package:cicgreenloan/widgets/notification/custom_confirm_button.dart';
import 'package:cicgreenloan/widgets/notification/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceptNotificationPopup extends StatefulWidget {
  final NotificationModel? notificationModel;
  const AcceptNotificationPopup({Key? key, this.notificationModel})
      : super(key: key);

  @override
  State<AcceptNotificationPopup> createState() =>
      _AcceptNotificationPopupState();
}

class _AcceptNotificationPopupState extends State<AcceptNotificationPopup> {
  final _con = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    // final _notificationCon = Get.put(NotificationController());
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetAnimationCurve: Curves.ease,
      insetAnimationDuration: const Duration(seconds: 0),
      insetPadding:
          const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
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
                    NotificationWidget(
                      notification: widget.notificationModel,
                      fromPage: 'acceptNotification',
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomConfirmbutton(
                                onTap: () {
                                  _con.onReadNotification(
                                      widget.notificationModel!.id!);
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return RejectReason(
                                        notificationModel:
                                            widget.notificationModel,
                                      );
                                    },
                                  );
                                },
                                title: 'Reject'),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CustomConfirmbutton(
                                onTap: () {
                                  _con.onReadNotification(
                                      widget.notificationModel!.id!);

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
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
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
              : Container()),
        ],
      ),
    );
  }
}
