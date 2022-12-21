import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/helper/color.dart';
import 'custom_card_guest_ticket.dart';
import '../../modules/event_module/controller/event_controller.dart';

// ignore: must_be_immutable
class CustomViewTicket extends StatelessWidget {
  final GestureTapCallback? onSaveTicket;
  int countNum = 0;
  CustomViewTicket({Key? key, this.onSaveTicket}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final contro = Get.put(EventController());
    contro.onCheckSelected();
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 0.1,
                    offset: const Offset(0, 2),
                    blurRadius: 8),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: DottedDecoration(
                    strokeWidth: 2,
                    shape: Shape.line,
                    color: const Color(0xffDBDBDB),
                  ),
                ),

                ///===
                ExpansionTile(
                  iconColor: Theme.of(context).primaryColor,
                  collapsedIconColor: Theme.of(context).primaryColor,
                  tilePadding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  title: Text(
                    'Guests',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 15.0,
                        ),
                  ),
                  children: [
                    Obx(
                      () => ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, e) {
                          countNum += 1;
                          return CustomCardGuestsTicket(
                            guest: 'Guest $countNum',
                            nameGuest: contro.getRegisterModel.value.guest![e]
                                .participantName,
                            who: contro
                                .getRegisterModel.value.guest![e].relationship,
                          );
                        },
                        itemCount: contro.getRegisterModel.value.guest!.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Padding(
                          padding: EdgeInsets.only(top: 16, bottom: 16),
                          child: Divider(
                            height: 1,
                            color: Colors.black12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(
    textStyle, {
    String? text,
    Widget? icon,
    GestureTapCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColor.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: icon,
          ),
          const SizedBox(height: 5),
          Text(
            text ?? '',
            style: textStyle.copyWith(
              fontSize: 12.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
