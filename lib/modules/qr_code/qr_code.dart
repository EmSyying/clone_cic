import 'dart:io';
import 'dart:ui';

import 'package:cicgreenloan/configs/route_configuration/route.dart';
import 'package:cicgreenloan/utils/permission/ask_permision_screen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../Utils/app_settings/controllers/appsetting_controller.dart';
import '../../Utils/form_builder/custom_button.dart';
import '../../Utils/helper/custom_route_snackbar.dart';
import '../../Utils/helper/show_myqr_code.dart';
import '../../Utils/pin_code_controller/set_pin_code_controller.dart';
import '../../configs/route_management/route_name.dart';
import '../../utils/form_builder/custom_material_modal_sheet.dart';
import '../../utils/helper/container_partern.dart';
import '../../utils/permission/controller/permision_controller.dart';
import '../../widgets/events/custom_ticket_card.dart';
import '../event_module/controller/event_controller.dart';
import '../event_module/models/event_data.dart';
import '../event_module/models/event_detail_argument.dart';
import '../event_module/models/event_ticket.dart';
import '../event_module/screen/event_detail.dart';
import '../google_map_module/controllers/google_map_controller.dart';
import '../member_directory/controllers/customer_controller.dart';
import '../member_directory/controllers/member_controller.dart';
import '../member_directory/screens/new_profile_ui/new_persional_profile.dart';
import '../privilege_program/controller/privilege_controller.dart';

class QrCodeScreen extends StatefulWidget {
  final String? pageName;
  const QrCodeScreen({
    Key? key,
    this.pageName,
  }) : super(key: key);

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  ///controller
  final cusController = Get.put(CustomerController());
  final memberCon = Get.put(MemberController());
  final eventCon = Get.put(EventController());
  static GlobalKey printScreenKey = GlobalKey();
  final _settingCon = Get.put(SettingController());
  final setPinCon = Get.put(SetPINCodeController());
  final preController = Get.put(PrivilegeController());

  bool isFlashOn = false;
  MobileScannerController cameraController =
      MobileScannerController(facing: CameraFacing.back);

  //result
  String? resultQR;
  String? param;
  Uri? uri;
  bool isInvalid = false;
  bool isGenerateDynamiclink = false;

  ///
  Future<void> _onCaptureAndSave(BuildContext context) async {
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
      debugPrint(e.toString());
    }
  }

  final _permissionController = Get.put(PermissionController());
  @override
  void initState() {
    _permissionController.checkCameraPermission();
    super.initState();
  }

  @override
  void dispose() {
    _permissionController.disposeTimer();
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: CupertinoScaffold(
        body: Builder(builder: (context) {
          return CupertinoPageScaffold(
              child: Center(
            child: Obx(
              () => Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        // flex: 3,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              width: double.infinity,
                              color: Colors.black45,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: SizedBox(
                                      height: width * 0.7,
                                      width: width * 0.7,
                                      child: MobileScanner(
                                        allowDuplicates: false,
                                        controller: cameraController,
                                        onDetect: (barcode, _) async {
                                          try {
                                            setState(() {
                                              isGenerateDynamiclink = true;
                                            });
                                            final PendingDynamicLinkData? url =
                                                await FirebaseDynamicLinks
                                                    .instance
                                                    .getDynamicLink(
                                              Uri.parse(barcode.rawValue!),
                                            );
                                            Future.delayed(
                                                const Duration(seconds: 1), () {
                                              setState(() {
                                                isGenerateDynamiclink = false;
                                                if (url != null) {
                                                  String links = url.link
                                                      .toString()
                                                      .replaceAll(
                                                          'https://cicapp.page.link',
                                                          '');
                                                  if (links.contains('event')) {
                                                    debugPrint("Link: $links");
                                                    int? param = int.tryParse(
                                                        links.replaceAll(
                                                            '/event/', ''));
                                                    // eventCon
                                                    //     .getRegisterWithGuest(param,
                                                    //         isCheckIn: true,
                                                    //         context: context)
                                                    eventCon.eventDetail.value
                                                        .id = param;

                                                    if (widget.pageName !=
                                                        null) {
                                                      eventCon
                                                          .getRegisterWithGuest(
                                                              param,
                                                              isCheckIn: true,
                                                              context: context,
                                                              fromPage: widget
                                                                  .pageName);
                                                    } else {
                                                      eventCon
                                                          .getRegisterWithGuest(
                                                        param,
                                                        isCheckIn: true,
                                                        context: context,
                                                      );
                                                    }
                                                  } else {
                                                    //  claim to discount
                                                    debugPrint(
                                                        "Claim to discount url:$links");
                                                    if (links.contains(
                                                        'privilege-claim')) {
                                                      int? id = int.tryParse(
                                                          links.replaceAll(
                                                              '/privilege-claim/',
                                                              ''));
                                                      debugPrint(
                                                          "Claim discount url:$links::$id");
                                                      preController
                                                          .onPaymentPrivilege(
                                                              context: context,
                                                              id: id)
                                                          .then((value) =>
                                                              router.go(links));
                                                    } else {
                                                      router.go(links);
                                                    }
                                                  }

                                                  settingCon
                                                      .isHideBottomNavigation
                                                      .value = false;
                                                  settingCon.update();
                                                }
                                              });
                                            });
                                            debugPrint(
                                                "Redeem to MVP QR:${barcode.rawValue}");
                                          } catch (ex) {
                                            setState(() {
                                              isGenerateDynamiclink = false;
                                            });
                                            debugPrint("Ex: $ex");
                                          } finally {
                                            isGenerateDynamiclink = false;
                                          }
                                          debugPrint("is Checke Scann");
                                          debugPrint(
                                              "Redeem to MVP QR:${barcode.rawValue}");
                                        },
                                      ),
                                    ),
                                  ),
                                  QRScannerOverlay(
                                    overlayColour: Colors.red.withOpacity(0.5),
                                  ),
                                  Obx(
                                    () => eventCon.isLoadingCheckIn.value
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          )
                                        : const SizedBox(),
                                  ),
                                  if (isGenerateDynamiclink)
                                    Center(
                                      child: Container(
                                          width: 100,
                                          height: 100,
                                          padding: const EdgeInsets.all(30),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                    offset: Offset(0.0, 1),
                                                    blurRadius: 6,
                                                    color: Colors.black12)
                                              ]),
                                          child:
                                              const CircularProgressIndicator()),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: GestureDetector(
                                onTap: () {
                                  showBarModalBottomSheet(
                                    context: context,
                                    builder: (contex) {
                                      return const ShowMyQRCode();
                                    },
                                  );
                                },
                                child: Container(
                                  width: 170,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withAlpha(80),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: SvgPicture.asset(
                                            'assets/images/svgfile/qrCodeIcon.svg'),
                                      ),
                                      const Text(
                                        'My QR Code',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(30),
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Scanning will start automatically",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Scan QR to Register Event, \nScan QR to view other CiC Member's profile.",
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            // if (uri != null)
                            //   Text(
                            //     'Url: $uri and param : $param',
                            //     style: const TextStyle(color: Colors.red),
                            //   ),
                            if (resultQR != null && resultQR!.contains('event'))
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: CustomButton(
                                  isDisable: false,
                                  isOutline: false,
                                  onPressed: () async {
                                    debugPrint("Fetch Event Dertail");
                                    int event = int.parse(
                                      resultQR!.replaceAll('event', ''),
                                    );

                                    await eventCon
                                        .onFetchEventTicket(event)
                                        .then(
                                      (EventTicket ticket) {
                                        if (ticket.ticket != null) {
                                          debugPrint(
                                              'ticket ${ticket.ticket!.date}');
                                          onShowCustomCupertinoModalSheet(
                                            onTap: () {},
                                            context: context,
                                            title: 'Your Ticket',
                                            icon:
                                                const Icon(Icons.clear_rounded),
                                            child: SizedBox(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .all(
                                                                    padding),
                                                            child:
                                                                RepaintBoundary(
                                                              key:
                                                                  printScreenKey,
                                                              child:
                                                                  CustomTicketCard(
                                                                eventTicket:
                                                                    ticket,
                                                                onViewMap: () {
                                                                  EventData eventData = EventData(
                                                                      latitude: ticket
                                                                          .ticket!
                                                                          .latitude,
                                                                      longitude: ticket
                                                                          .ticket!
                                                                          .longitude,
                                                                      title: ticket
                                                                          .ticket!
                                                                          .event);

                                                                  Navigator.pushNamed(
                                                                      context,
                                                                      RouteName
                                                                          .GOOGLEMAPPAGE,
                                                                      arguments:
                                                                          eventData);
                                                                },
                                                                onViewListing:
                                                                    () {
                                                                  EventDetailArgument
                                                                      argument =
                                                                      EventDetailArgument(
                                                                          id: event);
                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                const EventDetail(),
                                                                        settings:
                                                                            RouteSettings(arguments: argument)),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        60,
                                                                    vertical:
                                                                        padding),
                                                            child: CustomButton(
                                                              isDisable: false,
                                                              isOutline: true,
                                                              title:
                                                                  'Save ticket as image',
                                                              onPressed: () {
                                                                _onCaptureAndSave(
                                                                    context);
                                                                setState(() {});
                                                              },
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                              height: padding -
                                                                  borderRaduis),
                                                          SvgPicture.asset(
                                                              'assets/images/svgfile/cic_logo.svg'),
                                                          const SizedBox(
                                                              height: padding),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0,
                                                            right: 0,
                                                            bottom: 20),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            padding),
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
                                  },
                                  title: 'Join Event',
                                ),
                              ),

                            ///member
                            // if (resultQR != null &&
                            //     resultQR!.contains(CiCQr.wallet.key))
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       horizontal: 20, vertical: 5),
                            //   child: CustomButton(
                            //     isDisable: false,
                            //     isOutline: false,
                            //     onPressed: () async {
                            //       _walletController
                            //           .onScanTransfer(resultQR ?? '');
                            //       // debugPrint(CICRoute.i.transferToMMA().path);

                            //       context.go(
                            //           '/${CICRoute.i.transferToMMA().path}');

                            //       Future.delayed(const Duration(seconds: 1),
                            //           () {
                            //         _settingCon.selectedIndex = 0;
                            //         _settingCon
                            //             .onHideBottomNavigationBar(false);
                            //         _settingCon.update();
                            //       });

                            //       // Navigator.pop(context);
                            //     },
                            //     title: 'Confirm',
                            //   ),
                            // ),
                            if (resultQR != null &&
                                resultQR!.contains('member'))
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                child: CustomButton(
                                  isDisable: false,
                                  isOutline: false,
                                  onPressed: () async {
                                    int userId = int.parse(
                                        resultQR!.replaceAll('member', ''));

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NewPeronalProfile(
                                          isDirectory: true,
                                          id: userId,
                                        ),
                                      ),
                                    );
                                  },
                                  title: 'View Profile Detail',
                                ),
                              ),

                            // privilege shop

                            // if (resultQR != null && resultQR!.contains('shop'))
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       horizontal: 20, vertical: 5),
                            //   child: CustomButton(
                            //     isDisable: false,
                            //     isOutline: false,
                            //     onPressed: () async {
                            // int shopId = int.parse(
                            //   resultQR!.replaceAll('shop', ''),
                            // );
                            // context.push('/privilege-payment/$shopId');
                            //     },
                            //     title: 'Enter Amount',
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  ///appbar
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (widget.pageName == 'eventDetail' ||
                                  widget.pageName == 'transfer') {
                                context.pop();
                                _settingCon.onHideBottomNavigationBar(false);
                                _settingCon.update();
                              } else {
                                debugPrint("is Pressed");
                                context.go('/');
                                _settingCon.onHideBottomNavigationBar(false);
                                _settingCon.update();
                              }
                            },
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: cameraController.torchState.value ==
                                    TorchState.on
                                ? const Icon(
                                    Icons.flash_off,
                                    color: Colors.white,
                                  )
                                : const Icon(Icons.flash_on,
                                    color: Colors.white),
                            onPressed: () async {
                              await cameraController.toggleTorch();
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///invalid
                  if (_permissionController.cameraisDenied.value)
                    isInvalid ? _buildInvalidQr() : const SizedBox(),
                ],
              ),
            ),
          ));
        }),
      ),
    );
  }

  Widget _buildInvalidQr() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black54,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.report_problem_outlined,
                    size: 70, color: Colors.white),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Invalid QR Code',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            )),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  isInvalid = false;
                  cameraController.start();
                });
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.white)),
                child: const Text(
                  'Rescan',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

///overlay
class QRScannerOverlay extends StatefulWidget {
  const QRScannerOverlay({Key? key, required this.overlayColour})
      : super(key: key);

  final Color overlayColour;

  @override
  State<QRScannerOverlay> createState() => _QRScannerOverlayState();
}

class _QRScannerOverlayState extends State<QRScannerOverlay> {
  bool? isScanner = false;
  final googleMapCon = Get.put(GoogleMapsController());

  @override
  void initState() {
    isScanner = true;
    googleMapCon.determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 320.0;
    return Stack(children: [
      Align(
        alignment: Alignment.center,
        child: CustomPaint(
          size: const Size.fromRadius(100),
          foregroundPainter: BorderPainter(),

          // backgroundColor:Colors.red,
          child: SizedBox(
            width: scanArea,
            height: scanArea,
          ),
        ),
      ),
    ]);
  }
}

// Creates the white borders Qrcode
class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const width = 3.8;

    const radius = 12.0;
    const tRadius = 3 * radius;

    final rect = Rect.fromLTWH(
      width,
      width,
      size.width - 2 * width,
      size.height - 2 * width,
    );
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(10));
    const clippingRect0 = Rect.fromLTWH(
      0,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect1 = Rect.fromLTWH(
      size.width - tRadius,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect2 = Rect.fromLTWH(
      0,
      size.height - tRadius,
      tRadius,
      tRadius,
    );
    final clippingRect3 = Rect.fromLTWH(
      size.width - tRadius,
      size.height - tRadius,
      tRadius,
      tRadius,
    );

    final path = Path()
      ..addRect(clippingRect0)
      ..addRect(clippingRect1)
      ..addRect(clippingRect2)
      ..addRect(clippingRect3);

    canvas.clipPath(path);
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
