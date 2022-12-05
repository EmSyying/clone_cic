import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/helper/color.dart';
import '../../modules/event_module/controller/event_controller.dart';
import '../../modules/event_module/models/guest_model/guest_model.dart';
import '../../modules/event_module/models/select_checkin/select_checkin_model.dart';
import 'custom_card_guest_ticket.dart';

class CustomCheckInGuest extends StatelessWidget {
  const CustomCheckInGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contro = Get.put(EventController());
    // List<Map>? guest = [];
    return Container(
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
                color: const Color(0xffDBDBDB)),
          ),
          const SizedBox(height: 15),

          ///=== list guest
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
            child: Row(
              children: [
                Text(
                  'Guests',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0,
                      ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    GuestListModel guestListModel = GuestListModel();
                    contro.getListGest.asMap().entries.map((e) {
                      if (contro.getListGest[e.key].isCheckBox == true) {
                        contro.getListGest[e.key] = guestListModel.copyWith(
                            // id: contro.getRegisterModel.value.guest![e.key].id,
                            // participantName: contro.getRegisterModel.value
                            //     .guest![e.key].participantName,
                            // relationship: contro.getRegisterModel.value
                            //     .guest![e.key].relationship,
                            isCheckBox: false);

                        contro.selectCheckInModel
                            .removeWhere((v) => v.guestId == e.value.id);
                        debugPrint(
                            'After remove = ${contro.selectCheckInModel.length}');
                      } else {
                        contro.getListGest[e.key] = guestListModel.copyWith(
                            // id: contro.getRegisterModel.value.guest![e.key].id,
                            // participantName: contro.getRegisterModel.value
                            //     .guest![e.key].participantName,
                            // relationship: contro.getRegisterModel.value
                            //     .guest![e.key].relationship,
                            isCheckBox: true);

                        contro.selectCheckInModel
                            .add(SelectCheckInModel(guestId: e.value.id));
                        debugPrint(
                            'After Added = ${contro.selectCheckInModel.length}');
                      }

                      //===============ying code
                      // if (e.value.isCheckBox == true) {
                      //   contro.guestListModel.value =
                      //       e.value.copyWith(isCheckBox: false);

                      //   contro.selectCheckInModel
                      //       .removeWhere((v) => v.guestId == e.value.id);
                      //   debugPrint(
                      //       'After removeeeee = ${contro.selectCheckInModel.length}');
                      // } else {
                      //   contro.guestListModel.value = e.value.copyWith(
                      //     isCheckBox: true,
                      //   );
                      //   contro.selectCheckInModel
                      //       .add(SelectCheckInModel(guestId: e.value.id));
                      //   debugPrint(
                      //       'After Addedddddd = ${contro.selectCheckInModel.length}');
                      // }
                      //=======================
                      // debugPrint(
                      //     'remove====:${contro.selectCheckInModel.length}');
                      // contro.getListGest.map((e) {
                      //   if (e.isCheckBox == true) {
                      //     guest.add(
                      //       {"guest_id": e.id},
                      //     );
                      //   }
                      // }).toList();
                      //=====================
                      //
                      //   contro.getRegisterModel.refresh();
                      //   contro.update();
                      // }).toList();
                      //=====================

                      // contro.getListGest.asMap().entries.map((e) {
                      //   if (e.value.isCheckBox == true) {
                      //     e.value = e.value.copyWith(isCheckBox: false);
                      //     contro.selectCheckInModel
                      //         .removeWhere((v) => v.guestId == e.value.id);

                      //     debugPrint(
                      //         'After Removed = ${contro.selectCheckInModel.length}');
                      //   } else {
                      //     e.key = e.value.copyWith(
                      //       isCheckBox: true,
                      //     );
                      //     contro.selectCheckInModel
                      //         .add(SelectCheckInModel(guestId: e.value.id));
                      //     debugPrint(
                      //         'After Added = ${contro.selectCheckInModel.length}');
                      //   }
                    }).toList();
                  },
                  child: Text(
                    'Select all',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: AppColor.mainColor,
                        ),
                  ),
                ),
              ],
            ),
          ),

          ///all Guests======

          Obx(
            () => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, e) => CustomCardGuestsTicket(
                viewTicket: 'check_in',
                guest: "Guest ${contro.getListGest.length}",
                nameGuest: contro.getListGest[e].participantName,
                who: contro.getListGest[e].relationship,
                isCheckBox: contro.getListGest[e].isCheckBox!,
                onTapSelect: () {
                  // GuestListModel guestListModel = GuestListModel();

                  // if (contro.getListGest[e].isCheckBox == true) {
                  //   contro.getListGest[e] = guestListModel.copyWith(
                  //       id: contro.getRegisterModel.value.guest![e].id,
                  //       participantName: contro
                  //           .getRegisterModel.value.guest![e].participantName,
                  //       relationship: contro
                  //           .getRegisterModel.value.guest![e].relationship,
                  //       isCheckBox: false);
                  // } else {
                  //   contro.getListGest[e] = guestListModel.copyWith(
                  //       id: contro.getRegisterModel.value.guest![e].id,
                  //       participantName: contro
                  //           .getRegisterModel.value.guest![e].participantName,
                  //       relationship: contro
                  //           .getRegisterModel.value.guest![e].relationship,
                  //       isCheckBox: true);
                  // }
                  // contro.getListGest.asMap().entries.map((e) {
                  //   if (e.value.isCheckBox == true) {
                  //     guest.add(
                  //       {"check_id": '1', "guest_id": e.value.id},
                  //     );
                  //   } else {
                  //     guest.removeAt(e.key);
                  //   }
                  // }).toList();

                  // debugPrint("is checkbox1$guest");
                  // contro.getRegisterModel.refresh();
                  // contro.update();
                  // ====================================+======>
                  debugPrint('Test id : ${contro.getListGest[e].id}');

                  if (contro.getListGest[e].isCheckBox == true) {
                    contro.getListGest[e] =
                        contro.getListGest[e].copyWith(isCheckBox: false);

                    contro.selectCheckInModel.removeWhere(
                        (v) => v.guestId == contro.getListGest[e].id);
                  } else {
                    contro.getListGest[e] = contro.getListGest[e].copyWith(
                      isCheckBox: true,
                    );
                    contro.selectCheckInModel.add(
                        SelectCheckInModel(guestId: contro.getListGest[e].id));
                    debugPrint(
                        'After Added = ${contro.selectCheckInModel.length}');
                  }
                  // debugPrint(contro.selectCheckInModel.length.toString());
                },
              ),
              itemCount: contro.getListGest.length,
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
