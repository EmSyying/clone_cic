import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/event_module/controller/event_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/widgets/events/custom_invite_member.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Utils/helper/color.dart';

class CustomInviteMemberBottom extends StatelessWidget {
  final memberController = Get.put(MemberController());
  final customerController = Get.put(CustomerController());
  final registerMemberController = Get.put(EventController());
  final String? posted;
  final int? eventId;
  CustomInviteMemberBottom({Key? key, this.eventId, this.posted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return posted != "past"
        ? Container(
            margin: const EdgeInsets.only(left: 15.0, top: 20.0),
            width: 150.0,
            height: 35.0,
            // ignore: deprecated_member_use
            child: OutlinedButton(
              // color: Theme.of(context).primaryColor,
              // borderSide:
              //     BorderSide(width: 1, color: Theme.of(context).primaryColor),
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(
              //     8.0,
              //   ),
              // ),
              // padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/svgfile/register.svg",
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Invite Member",
                    style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              onPressed: () async {
                memberController.invitedMemberList.clear();
                memberController.memberList.clear();
                memberController.eventId = eventId;
                await onShowCustomCupertinoModalSheet(
                  context: context,
                  dynamicTitle: Obx(() => Text(
                        memberController.invitedMemberList.isNotEmpty
                            ? "${memberController.invitedMemberList.length} Selected"
                            : "Invite",
                      )),
                  icon: const Icon(Icons.clear),
                  trailing: Obx(
                    () => memberController.invitedMemberList.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              memberController.onClearInvitedMember();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15.0),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 17, color: AppColor.mainColor),
                              ),
                            ),
                          )
                        : Container(),
                  ),
                  child: CustomInviteMember(eventID: eventId),
                );
              },
            ),
          )
        : Container();
  }
}
