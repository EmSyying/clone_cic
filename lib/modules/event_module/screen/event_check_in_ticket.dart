import 'dart:io';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../Utils/form_builder/custom_button.dart';
import '../../../Utils/helper/color.dart';
import '../../../Utils/helper/custom_route_snackbar.dart';
import '../../../widgets/events/custom_checkin_guest.dart';
import '../../../widgets/events/custom_event_title_check_in.dart';
import '../../../widgets/events/custom_view_ticket.dart';
import '../../../widgets/wallets/custom_positioned_boxshape_circle.dart';
import '../controller/event_controller.dart';
import '../models/card_guests_model.dart';

class EventCheckInTicket extends StatelessWidget {
  final String? selectCheckIn;
  final BuildContext? contextTicket;
  final GestureTapCallback? onTapDone;
  final GestureTapCallback? onTapSubmit;
  final String? fromPage;
  const EventCheckInTicket({
    Key? key,
    this.selectCheckIn = '',
    this.contextTicket,
    this.onTapDone,
    this.onTapSubmit,
    this.fromPage,
  }) : super(key: key);
  static GlobalKey printScreenKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final contro = Get.put(EventController());

    return Container(
      // padding: const EdgeInsets.only(top: 15),
      color: Theme.of(context).primaryColor,
      child: Obx(
        () => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                //  padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: RepaintBoundary(
                  key: printScreenKey,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
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
                                            '${contro.getRegisterModel.value.ticketNumber}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3!
                                                .copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12.0,
                                                ),
                                          ),
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        descript:
                                            contro.getRegisterModel.value.place,
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                            //PositionedBoxShapCircle shap border

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
                        //Guests List(updated by Chhany)
                        selectCheckIn == 'check_in' &&
                                contro.getListGest.isNotEmpty
                            ? CustomCheckInGuest()
                            : contro.getListGest.isNotEmpty
                                ? CustomViewTicket(
                                    onSaveTicket: () {
                                      _onCaptureAndSave();
                                    },
                                  )
                                : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              top: false,
              minimum: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _onCaptureAndSave();
                    },
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
                          child: SvgPicture.asset('assets/images/save.svg'),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Save',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                  // loading while user sumitting updated by Chhany
                  contro.isLoadingCheckIn.value == true
                      ? Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SpinKitThreeBounce(
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : CustomButton(
                          width: double.infinity,
                          backgroundColor: Colors.white,
                          colorText: Theme.of(context).primaryColor,
                          onPressed: selectCheckIn == 'view_ticket'
                              ? () {
                                  onTapDone != null
                                      ? onTapDone!()
                                      : context.pop();
                                }
                              : () {
                                  if (fromPage != null) {
                                    contro.onCheckInEvent(
                                        context: contextTicket,
                                        eventId: contro.eventDetail.value.id,
                                        fromPage: fromPage);
                                  } else {
                                    contro.onCheckInEvent(
                                      context: contextTicket,
                                      eventId: contro.eventDetail.value.id,
                                    );
                                  }
                                },
                          isDisable: false,
                          isOutline: false,
                          title: selectCheckIn == 'view_ticket'
                              ? 'Done'
                              : 'Submit',
                        ),
                ],
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
