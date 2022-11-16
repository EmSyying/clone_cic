import 'dart:io';

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

  const EventCheckInTicket({
    Key? key,
    this.selectCheckIn = '',
  }) : super(key: key);
  static GlobalKey printScreenKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final contro = Get.put(EventController());

    return Container(
      padding: const EdgeInsets.only(top: 15),
      color: AppColor.mainColor,
      child: Column(
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

                              Container(
                                margin: const EdgeInsets.only(
                                  bottom: 10.0,
                                  top: 20.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(
                                                text: 'Ticket Number',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 18.0,
                                                    ),
                                                children: const <TextSpan>[
                                                  TextSpan(
                                                    text: '\n #CiC0534532',
                                                    style: TextStyle(
                                                      color: AppColor.mainColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  )
                                                ]),
                                          ),
                                        )),
                                  ],
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomTitleEventCheckIn(
                                    title: 'Name',
                                    descript: 'Syying',
                                  ),
                                  CustomTitleEventCheckIn(
                                    title: 'Event',
                                    descript: contro.eventDetail.value.title,
                                  ),
                                  CustomTitleEventCheckIn(
                                    title: 'Date and Time',
                                    descript:
                                        '${contro.eventDetail.value.date} - ${contro.eventDetail.value.toTime}',
                                  ),
                                  CustomTitleEventCheckIn(
                                    title: 'Location',
                                    descript: contro.eventDetail.value.location,
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
                    selectCheckIn == 'check_in'
                        ? Container(
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
                                          // for (var e = 0;
                                          //     e < contro.cardGuestsList.length;
                                          //     e++) {
                                          //   contro.cardGuestsList[e]
                                          //       .isCheckBox = true;
                                          //   guestList
                                          //       .addAll(contro.cardGuestsList);
                                          // }
                                          contro.cardGuestsList
                                              .asMap()
                                              .entries
                                              .map((e) => contro
                                                      .cardGuestsList[e.key]
                                                      .isCheckBox =
                                                  !contro.cardGuestsList[e.key]
                                                      .isCheckBox)
                                              .toList();
                                          guestList
                                              .addAll(contro.cardGuestsList);
                                          contro.cardGuestsList.refresh();
                                          //  contro.cardGuestsList[e].isCheckBox =
                                          //   !contro
                                          //       .cardGuestsList.isCheckBox;
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
                                      guest: contro.cardGuestsList[e].guest,
                                      nameGuest:
                                          contro.cardGuestsList[e].nameGuest,
                                      who: contro.cardGuestsList[e].who,
                                      isCheckBox:
                                          contro.cardGuestsList[e].isCheckBox,
                                      onTap: () {
                                        contro.cardGuestsList[e].isCheckBox =
                                            !contro
                                                .cardGuestsList[e].isCheckBox;

                                        contro.cardGuestsList.refresh();
                                      },
                                    ),
                                    itemCount: contro.cardGuestsList.length,
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const Padding(
                                      padding:
                                          EdgeInsets.only(top: 16, bottom: 16),
                                      child: Divider(
                                        height: 1,
                                        color: Colors.black12,
                                      ),
                                    ),
                                  ),
                                ),
                                // Obx(
                                //   () => Column(
                                //     children: contro.cardGuestsList
                                //         .asMap()
                                //         .entries
                                //         .map(
                                //           (e) => _customCardGuest(
                                //             context,
                                //             guest: e.value.guest,
                                //             nameGuest: e.value.nameGuest,
                                //             who: e.value.who,
                                //             isCheckBox: e.value.isCheckBox,
                                //             onTap: () {
                                // contro.cardGuestsList[e.key].isCheckBox =
                                //     !contro
                                //         .cardGuestsList[e.key].isCheckBox;

                                // contro.cardGuestsList.refresh();
                                //             },
                                //           ),
                                //         )
                                //         .toList(),
                                //   ),
                                // ),

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
              backgroundColor: guestList.isEmpty ? Colors.grey : Colors.white,
              colorText: guestList.isEmpty ? Colors.white : AppColor.mainColor,
              onPressed: guestList.isEmpty ? null : () {},
              isDisable: false,
              isOutline: false,
              title: 'Submit',
            ),
          ),
        ],
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
