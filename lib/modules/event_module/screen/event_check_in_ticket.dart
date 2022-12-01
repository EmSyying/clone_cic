import 'dart:io';

import 'package:cicgreenloan/modules/event_module/models/guest_model/guest_model.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../Utils/form_builder/custom_button.dart';
import '../../../Utils/helper/color.dart';
import '../../../Utils/helper/custom_route_snackbar.dart';
import '../../../widgets/events/custom_card_guest_ticket.dart';
import '../../../widgets/events/custom_event_title_check_in.dart';
import '../../../widgets/wallets/custom_positioned_boxshape_circle.dart';
import '../controller/event_controller.dart';
import '../../../widgets/events/custom_event_ticket_screen.dart';
import '../models/card_guests_model.dart';

class EventCheckInTicket extends StatelessWidget {
  final String? selectCheckIn;
  final BuildContext? contextTicket;
  const EventCheckInTicket({
    Key? key,
    this.selectCheckIn = '',
    this.contextTicket,
  }) : super(key: key);
  static GlobalKey printScreenKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final contro = Get.put(EventController());
    List<Map>? guest = [];
    return Container(
      padding: const EdgeInsets.only(top: 15),
      color: AppColor.mainColor,
      child: Obx(
        () => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                //  padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: RepaintBoundary(
                  key: printScreenKey,
                  child: Column(
                    children: [
                      Stack(
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
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Image.asset(
                                      "assets/images/Ticket.png",
                                    ),
                                  ),
                                ),

                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 10.0,
                                      top: 20.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Text('Ticket Number',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18.0,
                                                )),
                                        Text(
                                            '${contro.getRegisterModel.value.id}'),
                                        // Container(
                                        //   padding: const EdgeInsets.all(10),
                                        //   child: Center(
                                        //     child: RichText(
                                        //       text: TextSpan(
                                        //           text: 'Ticket Number',
                                        //           style: Theme.of(context)
                                        //               .textTheme
                                        //               .headline2!
                                        //               .copyWith(
                                        //                 fontWeight: FontWeight.w700,
                                        //                 fontSize: 18.0,
                                        //               ),
                                        //           children: <TextSpan>[
                                        //             TextSpan(
                                        //               text:
                                        //                   '\n ${contro.getRegisterModel.value.id}',
                                        //               style: const TextStyle(
                                        //                 color: AppColor.mainColor,
                                        //                 fontSize: 16,
                                        //                 fontWeight: FontWeight.w700,
                                        //               ),
                                        //             )
                                        //           ]),
                                        //     ),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  decoration: DottedDecoration(
                                    strokeWidth: 2,
                                    shape: Shape.line,
                                    color: const Color(0xffDBDBDB),
                                  ),
                                ),
                                const SizedBox(height: 15),

                                ///===
                                // selectCheckIn == 'view_ticket'
                                //     ? Column(
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           CustomTitleEventCheckIn(
                                //             title: 'Name',
                                //             descript: contro
                                //                 .getRegisterModel.value.name,
                                //           ),
                                //           CustomTitleEventCheckIn(
                                //             title: 'Event',
                                //             descript: contro
                                //                 .getRegisterModel.value.event,
                                //           ),
                                //           CustomTitleEventCheckIn(
                                //             title: 'Date and Time',
                                //             descript:
                                //                 '${contro.getRegisterModel.value.date} - ${contro.getRegisterModel.value.fromTime} - ${contro.getRegisterModel.value.toTime}',
                                //           ),
                                //           CustomTitleEventCheckIn(
                                //             title: 'Location',
                                //             descript: contro.getRegisterModel
                                //                 .value.location,
                                //           ),
                                //         ],
                                //       )
                                //     :
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTitleEventCheckIn(
                                      title: 'Name',
                                      descript:
                                          contro.getRegisterModel.value.name,
                                    ),
                                    CustomTitleEventCheckIn(
                                      title: 'Event',
                                      descript:
                                          contro.getRegisterModel.value.event,
                                    ),
                                    CustomTitleEventCheckIn(
                                      title: 'Date and Time',
                                      descript:
                                          '${contro.getRegisterModel.value.date} - ${contro.getRegisterModel.value.fromTime} - ${contro.getRegisterModel.value.toTime}',
                                    ),
                                    CustomTitleEventCheckIn(
                                      title: 'Location',
                                      descript: contro
                                          .getRegisterModel.value.location,
                                    ),
                                  ],
                                ),

                                // Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: contro.eventCheckIn
                                //       .asMap()
                                //       .entries
                                //       .map(
                                //         (e) => CustomTitleEventCheckIn(
                                //           title: e.value.title,
                                //           descript: e.value.description,
                                //         ),
                                //       )
                                //       .toList(),
                                // ),

                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                          //PositionedBoxShapCircle =shap border=====
                          const CustomPositionedBoxShapCircle(
                            boxShapCircleColor: true,
                            top: 216,
                            left: 6,
                          ),
                          const CustomPositionedBoxShapCircle(
                            boxShapCircleColor: true,
                            top: 216,
                            right: 6,
                          ),
                        ],
                      ),
                      //==========Column Guests card====
                      if (contro.getListGest.isNotEmpty)
                        selectCheckIn == 'check_in'
                            ? Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
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

                                    ///===
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 10.0, bottom: 20.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Guests',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 15.0,
                                                ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              debugPrint("is selected all");
                                              contro.getListGest
                                                  .asMap()
                                                  .entries
                                                  .map((e) {
                                                GuestListModel guestListModel =
                                                    GuestListModel();
                                                if (contro.getListGest[e.key]
                                                        .isCheckBox ==
                                                    true) {
                                                  contro.getListGest[e.key] =
                                                      guestListModel.copyWith(
                                                          id: contro
                                                              .getRegisterModel
                                                              .value
                                                              .guest![e.key]
                                                              .id,
                                                          participantName: contro
                                                              .getRegisterModel
                                                              .value
                                                              .guest![e.key]
                                                              .participantName,
                                                          relationship: contro
                                                              .getRegisterModel
                                                              .value
                                                              .guest![e.key]
                                                              .relationship,
                                                          isCheckBox: false);
                                                } else {
                                                  contro.getListGest[e.key] =
                                                      guestListModel.copyWith(
                                                          id: contro
                                                              .getRegisterModel
                                                              .value
                                                              .guest![e.key]
                                                              .id,
                                                          participantName: contro
                                                              .getRegisterModel
                                                              .value
                                                              .guest![e.key]
                                                              .participantName,
                                                          relationship: contro
                                                              .getRegisterModel
                                                              .value
                                                              .guest![e.key]
                                                              .relationship,
                                                          isCheckBox: true);
                                                }
                                                contro.getListGest.map((e) {
                                                  if (e.isCheckBox == true) {
                                                    guest.add(
                                                      {
                                                        "check_in": '1',
                                                        "guest_id": e.id
                                                      },
                                                    );
                                                  }
                                                }).toList();

                                                debugPrint(
                                                    "is checkbox1${guest.length}");
                                                contro.getRegisterModel
                                                    .refresh();
                                                contro.update();
                                              }).toList();
                                            },
                                            child: Text(
                                              'Select all',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2!
                                                  .copyWith(
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
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (_, e) =>
                                            CustomCardGuestsTicket(
                                          viewTicket: 'check_in',
                                          guest:
                                              "Guest ${contro.getListGest.length}",
                                          nameGuest: contro
                                              .getListGest[e].participantName,
                                          who: contro
                                              .getListGest[e].relationship,
                                          isCheckBox:
                                              contro.getListGest[e].isCheckBox!,
                                          onTapSelect: () {
                                            debugPrint("is checkbox");
                                            GuestListModel guestListModel =
                                                GuestListModel();

                                            if (contro.getListGest[e]
                                                    .isCheckBox ==
                                                true) {
                                              contro.getListGest[e] =
                                                  guestListModel.copyWith(
                                                      id: contro
                                                          .getRegisterModel
                                                          .value
                                                          .guest![e]
                                                          .id,
                                                      participantName: contro
                                                          .getRegisterModel
                                                          .value
                                                          .guest![e]
                                                          .participantName,
                                                      relationship: contro
                                                          .getRegisterModel
                                                          .value
                                                          .guest![e]
                                                          .relationship,
                                                      isCheckBox: false);
                                            } else {
                                              contro.getListGest[e] =
                                                  guestListModel.copyWith(
                                                      id: contro
                                                          .getRegisterModel
                                                          .value
                                                          .guest![e]
                                                          .id,
                                                      participantName: contro
                                                          .getRegisterModel
                                                          .value
                                                          .guest![e]
                                                          .participantName,
                                                      relationship: contro
                                                          .getRegisterModel
                                                          .value
                                                          .guest![e]
                                                          .relationship,
                                                      isCheckBox: true);
                                            }

                                            contro.getListGest
                                                .asMap()
                                                .entries
                                                .map((e) {
                                              if (e.value.isCheckBox == true) {
                                                guest.add(
                                                  {
                                                    "check_in": '1',
                                                    "guest_id": e.value.id
                                                  },
                                                );
                                              } else {
                                                guest.removeAt(e.key);
                                              }
                                            }).toList();

                                            debugPrint("is checkbox1$guest");
                                            contro.getRegisterModel.refresh();
                                            contro.update();
                                          },
                                        ),
                                        itemCount: contro.getListGest.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                const Padding(
                                          padding: EdgeInsets.only(
                                              top: 16, bottom: 16),
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
                              )
                            : selectCheckIn == 'view_ticket'
                                ? EventTicketScreen(
                                    onSaveTicket: () {
                                      _onCaptureAndSave();
                                    },
                                  )
                                : Container(),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              top: false,
              minimum: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: CustomButton(
                width: double.infinity,
                backgroundColor: Colors.white,
                colorText: AppColor.mainColor,
                onPressed: selectCheckIn == 'view_ticket'
                    ? () {
                        Navigator.pop(context);
                      }
                    : () {
                        Navigator.pop(context);
                        contro.onCheckInEvent(
                            context: contextTicket,
                            eventId: contro.eventDetail.value.id,
                            guestList: guest);
                      },
                isDisable: false,
                isOutline: false,
                title: selectCheckIn == 'view_ticket' ? 'Done' : 'Submit',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onCaptureAndSave() async {
    try {
      RenderRepaintBoundary boundary = printScreenKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 5);
      var byteData = await image.toByteData(
        format: ImageByteFormat.png,
      );
      var pngBytes = byteData!.buffer.asUint8List();
      final directory = await getTemporaryDirectory();
      final file = File('${directory.path}/screenshot.png');
      await file.writeAsBytes(pngBytes);
      await [Permission.storage].request();
      final time = DateTime.now()
          .toIso8601String()
          .replaceAll(".", "-")
          .replaceAll(":", "-");
      final name = 'MMA-$time';

      final result = await ImageGallerySaver.saveFile(file.path,
          name: name, isReturnPathOfIOS: true);
      // final result = await ImageGallerySaver
      // .saveImage(
      //   pngBytes,
      //   name: name,
      //   isReturnImagePathOfIOS: true,
      // );
      if (result != null) {
        customRouterSnackbar(
            description: 'Ticket Saved.', suffix: false, prefix: true);
      } else {}
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

List<CardGuestsModel> guestList = [];
onDisable() {}
