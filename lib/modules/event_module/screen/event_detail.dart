import 'dart:io';
import 'dart:ui';

import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/configs/route_management/route_name.dart';
import 'package:cicgreenloan/main.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/event_module/controller/event_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/modules/event_module/models/event_data.dart';
import 'package:cicgreenloan/modules/event_module/models/event_detail_argument.dart';
import 'package:cicgreenloan/modules/event_module/models/event_ticket.dart';
import 'package:cicgreenloan/modules/event_module/screen/pop_up_dialog.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/widgets/events/about_event_description.dart';
import 'package:cicgreenloan/widgets/events/custom_register_form.dart';
import 'package:cicgreenloan/widgets/events/custom_ticket_card.dart';
import 'package:cicgreenloan/widgets/events/customevent_interested.dart';
import 'package:cicgreenloan/widgets/events/event_shimmer.dart';
import 'package:cicgreenloan/widgets/events/invite_member_botton.dart';
import 'package:cicgreenloan/widgets/events/registered_member_amout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Utils/helper/container_partern.dart';
import '../../../Utils/helper/custom_route_snackbar.dart';
import '../../../utils/helper/custom_loading_button.dart';
import '../../qr_code/qr_code.dart';

class EventDetail extends StatefulWidget {
  final int? eventId;
  final bool? isRegister;
  const EventDetail({Key? key, this.eventId, this.isRegister = false})
      : super(key: key);

  // final EventData? eventData;

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  final memberController = Get.put(MemberController());
  final customerController = Get.put(CustomerController());
  final eventController = Get.put(EventController());
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    eventController.fetchEventDetail(widget.eventId!);
    eventController.onFetchRelationShip();
    // eventController.getCheckInGuest(eventId: widget.eventId);
    // eventController.getRegisterWithGuest(widget.eventId);

    super.initState();
  }

  Event buildEvent({Recurrence? recurrence}) {
    return Event(
      title: eventController.eventDetail.value.title!,
      description: eventController.eventDetail.value.description != null ||
              eventController.eventDetail.value.description != ""
          ? eventController.eventDetail.value.description!
          : "",
      location: eventController.eventDetail.value.location != null
          ? eventController.eventDetail.value.location!
          : "",
      startDate: DateTime.parse(eventController.eventDetail.value.startDate!),
      endDate: DateTime.parse(eventController.eventDetail.value.endDate!),
      allDay: false,
      iosParams: const IOSParams(
        reminder: Duration(minutes: 40),
      ),
      androidParams: const AndroidParams(
        emailInvites: ["hornchhanny@gmail.com"],
      ),
      recurrence: recurrence,
    );
  }

  bool isInterested = false;
  bool isGoing = false;
  bool isUninterested = false;
  final printScreenKey = GlobalKey();
  Future<void> onCaptureAndSave(BuildContext context) async {
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
      final name = 'Ticket $time';
      final result = await ImageGallerySaver.saveImage(
        pngBytes,
        name: name,
        isReturnImagePathOfIOS: true,
      );
      if (result != null) {
        customRouterSnackbar(
            title: 'Done',
            description: 'Your ticket has been saved to gallery!');
      } else {}
    } catch (e) {
      debugPrint("$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Obx(
        () => IgnorePointer(
          ignoring: eventController.isLoadingTicket.value ? true : false,
          child: Builder(builder: (BuildContext context) {
            return CupertinoPageScaffold(
              child: Scaffold(
                body: Stack(
                  // alignment: Alignment.center,
                  children: [
                    Obx(
                      () => NotificationListener<ScrollNotification>(
                        onNotification: (ScrollNotification scrollNotifiation) {
                          if (scrollNotifiation.metrics.pixels >= 80) {
                            eventController.scrollTop.value = true;
                          } else {
                            eventController.scrollTop.value = false;
                          }
                          return true;
                        },
                        child: RefreshIndicator(
                          key: refreshKey,
                          onRefresh: () => eventController.onRefreshEventDetail(
                              id: widget.eventId),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 270,
                                      decoration: eventController
                                              .isLoadingEventDetail.value
                                          ? null
                                          : BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      eventController
                                                          .eventDetail
                                                          .value
                                                          .cover!),
                                                  fit: BoxFit.cover),
                                            ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 10, sigmaY: 10),
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Colors.black38,
                                          child: AppBar(
                                            title: const Text(""),
                                            backgroundColor: Colors.transparent,
                                            actions: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 10.0,
                                                    top: 10.0,
                                                    right: 15),
                                                decoration: const BoxDecoration(
                                                    color: Color(0xFF4A4A4A),
                                                    shape: BoxShape.circle),
                                                alignment: Alignment.center,
                                                child: IconButton(
                                                  icon: const Icon(
                                                    Icons.more_vert,
                                                    color: Colors.white,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () {
                                                    onShowChoice(context,
                                                        (value) {
                                                      if (value ==
                                                          'Add to calendar') {
                                                        Add2Calendar
                                                            .addEvent2Cal(
                                                          buildEvent(),
                                                        );
                                                      }
                                                      if (value ==
                                                          'Contact to organiser') {
                                                        launchUrl(Uri.parse(
                                                            eventController
                                                                .eventDetail
                                                                .value
                                                                .telegramLink
                                                                .toString()));
                                                      }
                                                      if (value ==
                                                          'share event') {
                                                        final RenderBox box =
                                                            context.findRenderObject()
                                                                as RenderBox;

                                                        Share.share(
                                                            eventController
                                                                .eventShortenUrl
                                                                .value,
                                                            subject: '',
                                                            sharePositionOrigin:
                                                                box.localToGlobal(
                                                                        Offset
                                                                            .zero) &
                                                                    box.size);
                                                      }
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                            leading: Container(
                                              margin:
                                                  const EdgeInsets.all(10.0),
                                              padding: const EdgeInsets.only(
                                                  left: 4.0),
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFF4A4A4A),
                                                  shape: BoxShape.circle),
                                              alignment: Alignment.center,
                                              child: IconButton(
                                                  icon: const Icon(
                                                    Icons.arrow_back_ios,
                                                    color: Colors.white,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    if (eventController
                                                        .isAfterRegister
                                                        .value) {
                                                      eventController
                                                          .getNewEvent(
                                                              customerController
                                                                  .customer
                                                                  .value
                                                                  .customerId!);
                                                      eventController
                                                          .isAfterRegister
                                                          .value = false;
                                                    }
                                                    Navigator.pop(context);
                                                  }),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 120.0,
                                      left: 15.0,
                                      right: 15.0,
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          child: SizedBox(
                                            height: 180.0,
                                            width: 350.0,
                                            child: eventController
                                                    .isLoadingEventDetail.value
                                                ? Container()
                                                : Image.network(
                                                    eventController.eventDetail
                                                        .value.cover!,
                                                    fit: BoxFit.cover,
                                                  ),
                                          )),
                                    ),
                                  ],
                                ),
                                !eventController.isLoadingEventDetail.value
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                top: 50.0,
                                                left: 15.0,
                                                right: 15.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    eventController.eventDetail
                                                        .value.title!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall),
                                                const SizedBox(
                                                  height: 5.0,
                                                ),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/images/svgfile/online.svg'),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                        '${eventController.eventDetail.value.hostAt!.capitalize.toString()} Event',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayMedium!
                                                            .copyWith(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400)),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 8),
                                                        child: const Text(
                                                          '.',
                                                        )),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                        '${eventController.eventDetail.value.posted!.capitalize.toString()} Event',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineSmall!
                                                            .copyWith(
                                                                color: eventController
                                                                            .eventDetail
                                                                            .value
                                                                            .posted!
                                                                            .capitalize
                                                                            .toString() ==
                                                                        'today'
                                                                    ? AppColor
                                                                        .mainColor
                                                                    : eventController.eventDetail.value.posted ==
                                                                            'upcoming'
                                                                        ? const Color(
                                                                            0xffE28112)
                                                                        : Colors
                                                                            .black,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400)),
                                                  ],
                                                ),
                                                if (eventController.eventDetail
                                                        .value.isRegister ==
                                                    true)
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                if (eventController.eventDetail
                                                        .value.isRegister ==
                                                    true)
                                                  GestureDetector(
                                                    onTap: eventController
                                                            .isLoadingViewTicket
                                                            .value
                                                        ? () {}
                                                        : () async {
                                                            // view ticket (updated by Chhany)
                                                            await eventController
                                                                .getRegisterWithGuest(
                                                                    widget
                                                                        .eventId,
                                                                    isViewTicket:
                                                                        true,
                                                                    context:
                                                                        context);
                                                          },
                                                    child: Container(
                                                      width: 120,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10,
                                                          horizontal: 12),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: Theme.of(context)
                                                            .primaryColor
                                                            .withOpacity(0.1),
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/images/svgfile/ticket_star.svg',
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            'View Ticket',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displaySmall!
                                                                .copyWith(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 15.0,
                                                      right: 15.0,
                                                      top: 10.0,
                                                      bottom: 10.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GetBuilder(
                                                        builder:
                                                            (EventController
                                                                controller) {
                                                          return CustomEventInterested(
                                                            title: 'Interested',
                                                            widget:
                                                                GestureDetector(
                                                                    child: controller
                                                                            .eventDetail
                                                                            .value
                                                                            .isInterested!
                                                                        ? SvgPicture
                                                                            .asset(
                                                                            'assets/images/svgfile/interest_fill.svg',
                                                                            color:
                                                                                Theme.of(context).primaryColor,
                                                                          )
                                                                        : SvgPicture
                                                                            .asset(
                                                                            'assets/images/svgfile/interest.svg',
                                                                            color:
                                                                                Theme.of(context).primaryColor,
                                                                          ),
                                                                    onTap:
                                                                        () async {
                                                                      controller
                                                                              .eventDetail
                                                                              .value
                                                                              .isInterested =
                                                                          !controller
                                                                              .eventDetail
                                                                              .value
                                                                              .isInterested!;
                                                                      if (controller
                                                                              .eventDetail
                                                                              .value
                                                                              .isUnterest ==
                                                                          true) {
                                                                        controller
                                                                            .eventDetail
                                                                            .value
                                                                            .isUnterest = false;
                                                                      }
                                                                      controller
                                                                          .update();

                                                                      controller.onInterested(
                                                                          context:
                                                                              context,
                                                                          eventid: controller
                                                                              .eventDetail
                                                                              .value
                                                                              .id);
                                                                    }),
                                                          );
                                                        },
                                                        init: EventController(),
                                                      ),
                                                      CustomEventInterested(
                                                        title: 'Going',
                                                        widget: GestureDetector(
                                                            onTap: eventController
                                                                        .eventDetail
                                                                        .value
                                                                        .isRegister ==
                                                                    true
                                                                ? null
                                                                : () {
                                                                    onShowCustomCupertinoModalSheet(
                                                                      context:
                                                                          context,
                                                                      title:
                                                                          'Register',
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .clear),
                                                                      child:
                                                                          CustomRegisterForm(
                                                                        eventID:
                                                                            widget.eventId,
                                                                        contextRegisterTicket:
                                                                            context,
                                                                      ),
                                                                    );
                                                                  },
                                                            child: eventController
                                                                        .eventDetail
                                                                        .value
                                                                        .isRegister ==
                                                                    false
                                                                ? SvgPicture
                                                                    .asset(
                                                                    'assets/images/svgfile/going.svg',
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                  )
                                                                : SvgPicture
                                                                    .asset(
                                                                    'assets/images/svgfile/going_fill.svg',
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                  )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: GetBuilder(
                                                          builder:
                                                              (EventController
                                                                  controller) {
                                                            return CustomEventInterested(
                                                              title: 'Ignore',
                                                              widget:
                                                                  GestureDetector(
                                                                      child: !controller
                                                                              .eventDetail
                                                                              .value
                                                                              .isUnterest!
                                                                          ? SvgPicture
                                                                              .asset(
                                                                              'assets/images/svgfile/not_interest.svg',
                                                                              color: Theme.of(context).primaryColor,
                                                                            )
                                                                          : SvgPicture
                                                                              .asset(
                                                                              'assets/images/svgfile/not_interest_fill.svg',
                                                                              color: Theme.of(context).primaryColor,
                                                                            ),
                                                                      onTap:
                                                                          () async {
                                                                        controller
                                                                            .eventDetail
                                                                            .value
                                                                            .isUnterest = !controller.eventDetail.value.isUnterest!;
                                                                        if (controller.eventDetail.value.isInterested ==
                                                                            true) {
                                                                          controller
                                                                              .eventDetail
                                                                              .value
                                                                              .isInterested = false;
                                                                        }

                                                                        await controller.onUninterested(
                                                                            context:
                                                                                context,
                                                                            eventid:
                                                                                controller.eventDetail.value.id);
                                                                      }),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  'Details',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium!
                                                      .copyWith(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                _customDateDetail(
                                                  context: context,
                                                  title: 'Event by',
                                                  content: eventController
                                                          .eventDetail
                                                          .value
                                                          .eventBy ??
                                                      '',
                                                  imageSVG:
                                                      'assets/images/svgfile/profile-border.svg',
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: _customDateDetail(
                                                    context: context,
                                                    title: 'Date and time',
                                                    content:
                                                        '${eventController.eventDetail.value.fromTime} - ${eventController.eventDetail.value.toTime}',
                                                    imageSVG:
                                                        'assets/images/svgfile/calendar-border.svg',
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: eventController
                                                              .eventDetail
                                                              .value
                                                              .hostAt ==
                                                          'online'
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            launchUrl(Uri.parse(
                                                                eventController
                                                                    .eventDetail
                                                                    .value
                                                                    .livestreamLink
                                                                    .toString()));
                                                          },
                                                          child: _customDateDetail(
                                                              context: context,
                                                              title: 'Via Zoom',
                                                              content:
                                                                  'Link Here',
                                                              imageSVG:
                                                                  'assets/images/svgfile/video.svg',
                                                              textColor: AppColor
                                                                  .mainColor))
                                                      : GestureDetector(
                                                          onTap: () {
                                                            context.go(
                                                                '/event/${widget.eventId}/view-map?title=${eventController.eventDetail.value.title}&longtitude=${eventController.eventDetail.value.longitude}&latitude=${eventController.eventDetail.value.latitude}');
                                                          },
                                                          child: _customDateDetail(
                                                              context: context,
                                                              title: 'Location',
                                                              content:
                                                                  '${eventController.eventDetail.value.place}',
                                                              imageSVG:
                                                                  'assets/images/svgfile/location_border.svg',
                                                              textColor: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (eventController.eventDetail.value
                                                  .description !=
                                              '')
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20, top: 10),
                                              child: Divider(
                                                thickness: 1.2,
                                                color: Colors.grey[200],
                                              ),
                                            ),
                                          // Padding(
                                          //     padding: const EdgeInsets.only(
                                          //         left: 20, top: 10),
                                          //     child: ReadMoreText(
                                          //       'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                                          //       trimLines: 2,
                                          //       colorClickableText: Colors.pink,
                                          //       trimMode: TrimMode.Line,
                                          //       trimCollapsedText: 'Read more',
                                          //       trimExpandedText: 'Read less',
                                          //       style: Theme.of(context)
                                          //           .textTheme
                                          //           .headlineSmall!
                                          //           .copyWith(
                                          //               fontSize: 14,
                                          //               fontWeight:
                                          //                   FontWeight.w500),
                                          //       moreStyle: const TextStyle(
                                          //           fontSize: 14,
                                          //           fontWeight:
                                          //               FontWeight.bold),
                                          //     )

                                          AboutEventDescription(
                                            title: 'About Events',
                                            description:
                                                "${eventController.eventDetail.value.description}",
                                          ),
                                          // if (eventController
                                          //         .eventDetail.value.posted!
                                          //         .toLowerCase() ==
                                          //     "past")
                                          //   const CustomResponses(
                                          //       numberOfJoin: 23,
                                          //       interested: 753,
                                          //       numberOfShare: 453),
                                          RegisterMemberAmount(
                                            eventID: eventController
                                                .eventDetail.value.id,
                                            registerNumber: eventController
                                                .eventDetail
                                                .value
                                                .registerNumber!,
                                            registerProfile: eventController
                                                .eventDetail
                                                .value
                                                .registerProfile!,
                                          ),
                                          CustomInviteMemberBottom(
                                            eventId: eventController
                                                .eventDetail.value.id!,
                                            posted: eventController
                                                .eventDetail.value.posted!,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      )
                                    : SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width: double.infinity,
                                        child: ListView.builder(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, top: 50),
                                          itemBuilder: (context, index) {
                                            return const EventShimmerCard();
                                          },
                                          itemCount: 20,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => eventController.scrollTop.value
                          ? ClipRect(
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                                child: SizedBox(
                                    height: 100,
                                    child: AppBar(
                                      title: Text(eventController
                                          .eventDetail.value.title!),
                                      backgroundColor: Colors.black38,
                                      actions: [
                                        IconButton(
                                            onPressed: () async {
                                              onShowChoice(context, (value) {
                                                if (value ==
                                                    'Add to calendar') {
                                                  Add2Calendar.addEvent2Cal(
                                                    buildEvent(),
                                                  );
                                                }
                                                if (value ==
                                                    'Contact to organiser') {
                                                  launchUrl(Uri.parse(
                                                      eventController
                                                          .eventDetail
                                                          .value
                                                          .telegramLink
                                                          .toString()));
                                                }

                                                if (value == 'share event') {
                                                  final RenderBox box =
                                                      context.findRenderObject()
                                                          as RenderBox;
                                                  debugPrint(
                                                      'Is Link share link');
                                                  Share.share(
                                                      eventController
                                                          .eventShortenUrl
                                                          .value,
                                                      subject: '',
                                                      sharePositionOrigin:
                                                          box.localToGlobal(
                                                                  Offset.zero) &
                                                              box.size);
                                                }
                                              });
                                            },
                                            icon: const Icon(Icons.more_vert))
                                      ],
                                    )),
                              ),
                            )
                          : Container(),
                    ),
                    Obx(
                      () => eventController.isLoadingTicket.value
                          ? Center(
                              child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(1.0, 0.0),
                                            blurRadius: 6,
                                            color: Colors.black12)
                                      ]),
                                  padding: const EdgeInsets.all(30),
                                  child: const CircularProgressIndicator()),
                            )
                          : Container(),
                    ),
                  ],
                ),
                bottomNavigationBar:
                    // eventController.eventDetail.value.isRegister == true &&
                    //         eventController.eventDetail.value.isCheckin == true
                    //     ? null
                    //     :
                    Obx(() => !eventController.isLoadingEventDetail.value
                        ? eventController.eventDetail.value.posted != 'past'
                            ? Container(
                                decoration: const BoxDecoration(
                                  border: BorderDirectional(
                                    top: BorderSide(
                                        color: Colors.grey,
                                        width: 0.2,
                                        style: BorderStyle.solid),
                                  ),
                                ),
                                child: Container(
                                  height: 50.0,
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                    right: 15.0,
                                    top: 10.0,
                                    bottom: 10.0,
                                    left: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      if (eventController
                                              .eventDetail.value.isRegister ==
                                          true)
                                        // if (eventController
                                        //         .eventDetail.value.isRegister ==
                                        //     true)

                                        !eventController
                                                    .isLoadingCheckIn.value &&
                                                eventController.getRegisterModel
                                                        .value.guest?.length !=
                                                    1 &&
                                                eventController.eventDetail
                                                        .value.isCheckin ==
                                                    false
                                            ? Expanded(
                                                child: CustomButton(
                                                  title: 'Add Guest',
                                                  onPressed: () {
                                                    onShowCustomCupertinoModalSheet(
                                                      context: context,
                                                      title: 'Register',
                                                      icon: const Icon(
                                                          Icons.clear),
                                                      child: CustomRegisterForm(
                                                        eventID: widget.eventId,
                                                        contextRegisterTicket:
                                                            context,
                                                      ),
                                                    );
                                                  },
                                                  isDisable: false,
                                                  isOutline: true,
                                                ),
                                              )
                                            : Expanded(
                                                child: CustomButton(
                                                  title: 'Add Guest',
                                                  onPressed: () {},
                                                  isDisable: true,
                                                  isOutline: true,
                                                ),
                                              ),
                                      if (eventController
                                              .eventDetail.value.isRegister ==
                                          true)
                                        const SizedBox(
                                          width: 15,
                                        ),
                                      Expanded(
                                        child:
                                            eventController
                                                        .isLoadingGetRegisterCheckIn
                                                        .value ==
                                                    true
                                                ? const CustomLoadingButton()
                                                : CustomButton(
                                                    title: eventController.eventDetail.value.isRegister == true
                                                        ? 'Check in'
                                                        : 'Register Now',
                                                    isOutline: false,
                                                    isDisable: !eventController
                                                            .eventDetail
                                                            .value
                                                            .isRegister!
                                                        ? false
                                                        : eventController
                                                                .eventDetail
                                                                .value
                                                                .isOpen!
                                                            ? false
                                                            : true,
                                                    onPressed: eventController
                                                                    .eventDetail
                                                                    .value
                                                                    .posted !=
                                                                "past" &&
                                                            !eventController
                                                                .eventDetail
                                                                .value
                                                                .isRegister!
                                                        ? () {
                                                            //  Clear guest list model before add new guest updated by Chhany
                                                            eventController
                                                                    .guestlistmodel
                                                                    .value =
                                                                <GuestModel>[
                                                              GuestModel()
                                                            ];

                                                            onShowCustomCupertinoModalSheet(
                                                              context: context,
                                                              title: 'Register',
                                                              icon: const Icon(
                                                                  Icons.clear),
                                                              child:
                                                                  CustomRegisterForm(
                                                                eventID: widget
                                                                    .eventId,
                                                                contextRegisterTicket:
                                                                    context,
                                                              ),
                                                            );
                                                          }
                                                        : eventController.eventDetail.value.posted != "past" &&
                                                                eventController
                                                                    .eventDetail
                                                                    .value
                                                                    .isRegister!
                                                            ? eventController.eventDetail.value.hostAt == 'online'
                                                                ? () {
                                                                    launchUrl(Uri.parse(eventController
                                                                        .eventDetail
                                                                        .value
                                                                        .livestreamLink
                                                                        .toString()));
                                                                  }
                                                                :
                                                                // eventController.eventDetail.value.hostAt != 'online' &&
                                                                eventController.eventDetail.value.isRegister! && eventController.eventDetail.value.isCheckin!
                                                                    ? () async {
                                                                        await eventController
                                                                            .onFetchEventTicket(eventController.eventDetail.value.id!)
                                                                            .then(
                                                                          (EventTicket
                                                                              ticket) {
                                                                            if (ticket.ticket !=
                                                                                null) {
                                                                              onShowCustomCupertinoModalSheet(
                                                                                context: context,
                                                                                title: 'Your Ticket',
                                                                                icon: const Icon(Icons.clear),
                                                                                child: SizedBox(
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: SingleChildScrollView(
                                                                                          child: Column(
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.all(padding),
                                                                                                child: RepaintBoundary(
                                                                                                  key: printScreenKey,
                                                                                                  child: CustomTicketCard(
                                                                                                    eventTicket: ticket,
                                                                                                    onViewMap: () {
                                                                                                      EventData eventData = EventData(latitude: ticket.ticket!.latitude, longitude: ticket.ticket!.longitude, title: ticket.ticket!.event);

                                                                                                      Navigator.pushNamed(context, RouteName.GOOGLEMAPPAGE, arguments: eventData);
                                                                                                    },
                                                                                                    onViewListing: () {
                                                                                                      EventDetailArgument argument = EventDetailArgument(id: eventController.eventDetail.value.id);
                                                                                                      Navigator.push(
                                                                                                        context,
                                                                                                        MaterialPageRoute(builder: (context) => const EventDetail(), settings: RouteSettings(arguments: argument)),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: padding),
                                                                                                child: CustomButton(
                                                                                                  isDisable: false,
                                                                                                  isOutline: true,
                                                                                                  title: 'Save ticket as image',
                                                                                                  onPressed: () {
                                                                                                    setState(() {});
                                                                                                    onCaptureAndSave(context);
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                              const SizedBox(height: padding - borderRaduis),
                                                                                              SvgPicture.asset('assets/images/svgfile/cic_logo.svg'),
                                                                                              const SizedBox(height: padding),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: double.infinity,
                                                                                        margin: const EdgeInsets.only(left: 0, right: 0, bottom: 10),
                                                                                        padding: const EdgeInsets.all(padding),
                                                                                        child: CustomButton(
                                                                                          title: 'Confirm',
                                                                                          isDisable: false,
                                                                                          isOutline: false,
                                                                                          onPressed: () {
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                          },
                                                                        );
                                                                      }
                                                                    : eventController.eventDetail.value.hostAt != 'online' && eventController.eventDetail.value.isRegister! && !eventController.eventDetail.value.isCheckin!
                                                                        ? () async {
                                                                            settingCon.isHideBottomNavigation.value =
                                                                                true;
                                                                            settingCon.update();
                                                                            showMaterialModalBottomSheet(
                                                                                context: context,
                                                                                enableDrag: false,
                                                                                builder: (context) {
                                                                                  return SingleChildScrollView(
                                                                                    physics: const NeverScrollableScrollPhysics(),
                                                                                    child: Column(
                                                                                      children: [
                                                                                        Container(
                                                                                          height: MediaQuery.of(context).size.height,
                                                                                          color: Colors.white,
                                                                                          child: const QrCodeScreen(
                                                                                            pageName: 'eventDetail',
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                });
                                                                          }
                                                                        : () {}
                                                            : () {
                                                                showMaterialModalBottomSheet(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Container(
                                                                              height: MediaQuery.of(context).size.height,
                                                                              color: Colors.white,
                                                                              child: const QrCodeScreen(
                                                                                pageName: 'eventDetail',
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    });
                                                              }),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const Text('')
                        : const Text('')),
              ),
            );
          }),
        ),
      ),
    );
  }
}

Widget _customDateDetail({
  final String? title,
  final String? content,
  final String? imageSVG,
  final Color? textColor,
  @required final BuildContext? context,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SvgPicture.asset('$imageSVG'),
      const SizedBox(
        width: 10,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title',
              style: Theme.of(context!).textTheme.headlineSmall!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            Text(
              '$content',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: textColor ?? Colors.black),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    ],
  );
}
