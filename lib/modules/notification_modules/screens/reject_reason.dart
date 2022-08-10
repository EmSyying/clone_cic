import 'package:cicgreenloan/modules/notification_modules/controllers/notification_controller.dart';
import 'package:cicgreenloan/modules/notification_modules/models/notification.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/notification/custom_reason_choice.dart';

import 'package:cicgreenloan/widgets/notification/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RejectReason extends StatefulWidget {
  final NotificationModel? notificationModel;
  const RejectReason({Key? key, this.notificationModel}) : super(key: key);

  @override
  State<RejectReason> createState() => _RejectReasonState();
}

class _RejectReasonState extends State<RejectReason> {
  final _con = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetAnimationCurve: Curves.ease,
      insetAnimationDuration: const Duration(seconds: 0),
      insetPadding:
          const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
      backgroundColor: Colors.white,
      elevation: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: 500,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NotificationWidget(
                          notification: widget.notificationModel,
                          fromPage: 'rejectPopup'),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'You rejected the request, Please tell us why',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => _con.reasonList.isNotEmpty
                            ? CustomReasonChoice(
                                onSelect: (value) {
                                  if (value.isSelected!) {
                                    if (!_con.selectedReasonList
                                        .contains(value)) {
                                      _con.selectedReasonList.add(value.id!);
                                    }
                                  } else {
                                    _con.selectedReasonList.remove(value.id);
                                  }
                                },
                                reasonList: _con.reasonList,
                              )
                            : Container(),
                      ),
                    ],
                  )),
                  const Divider(),
                  Obx(
                    () => Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                          left: 20, bottom: 20, right: 20, top: 10),
                      child: CustomButton(
                        onPressed: () {
                          _con.onAcceptTradeRequest(
                              type: 'rejected',
                              reason: _con.selectedReasonList,
                              transactionId:
                                  widget.notificationModel!.data!.transactionId,
                              notificationId: widget.notificationModel!.id);
                        },
                        title: 'Submit',
                        isOutline: false,
                        isDisable:
                            _con.selectedReasonList.isNotEmpty ? false : true,
                      ),
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
    );
  }
}
