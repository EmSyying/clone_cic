// import 'dart:io';
// import 'dart:ui';

// import 'package:cicgreenloan/configs/route_management/route_name.dart';
// import 'package:cicgreenloan/Utils/app_settings/controllers/appsetting_controller.dart';
// import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
// import 'package:cicgreenloan/modules/event_module/controller/event_controller.dart';
// import 'package:cicgreenloan/modules/event_module/models/event_ticket.dart';
// import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
// import 'package:cicgreenloan/modules/event_module/models/event_data.dart';
// import 'package:cicgreenloan/modules/event_module/models/event_detail_argument.dart';
// import 'package:cicgreenloan/modules/event_module/screen/event_detail.dart';
// import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
// import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
// import 'package:cicgreenloan/widgets/events/custom_ticket_card.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../../Utils/helper/container_partern.dart';
// import '../../Utils/helper/screen_agrument/member_screen_argument.dart';
// import '../../Utils/helper/show_myqr_code.dart';
// import '../../Utils/app_settings/controllers/appsetting_controller.dart';
// import '../../Utils/pin_code_controller/set_pin_code_controller.dart';

// class QrCodeScreen extends StatefulWidget {
//   final String? pageName;
//   const QrCodeScreen({Key? key, this.pageName}) : super(key: key);
//   @override
//   _QrCodeScreenState createState() => _QrCodeScreenState();
// }

// class _QrCodeScreenState extends State<QrCodeScreen> {
//   // String testValue = '163';
//   // final _userProfile = Get.put(CustomerController());
//   final cusController = Get.put(CustomerController());
//   final _memberCon = Get.put(MemberController());
//   final _eventCon = Get.put(EventController());
//   static GlobalKey printScreenKey = GlobalKey();
//   final _settingCon = Get.put(SettingController());
//   final setPinCon = Get.put(SetPINCodeController());
//   Future<void> onCaptureAndSave(BuildContext context) async {
//     try {
//       RenderRepaintBoundary boundary = printScreenKey.currentContext!
//           .findRenderObject() as RenderRepaintBoundary;
//       var image = await boundary.toImage(pixelRatio: 5);
//       var byteData = await image.toByteData(
//         format: ImageByteFormat.png,
//       );
//       var pngBytes = byteData!.buffer.asUint8List();
//       final directory = await getTemporaryDirectory();
//       final file = File('${directory.path}/screenshot.png');
//       await file.writeAsBytes(pngBytes);
//       await [Permission.storage].request();
//       final time = DateTime.now()
//           .toIso8601String()
//           .replaceAll(".", "-")
//           .replaceAll(":", "-");
//       final name = 'Ticket $time';
//       final result = await ImageGallerySaver.saveImage(
//         pngBytes,
//         name: name,
//         isReturnImagePathOfIOS: true,
//       );
//       if (result != null) {
//         Get.snackbar("", "",
//             borderRadius: 8,
//             duration: const Duration(seconds: 2),
//             backgroundColor: const Color(0xff60AD00),
//             colorText: Colors.white,
//             icon: const Icon(
//               Icons.done,
//               color: Colors.white,
//             ),
//             snackPosition: SnackPosition.TOP,
//             margin: const EdgeInsets.all(10),
//             overlayBlur: 3.0,
//             titleText: const Text(
//               'Done',
//               style: TextStyle(color: Colors.white),
//             ),
//             messageText: const Text(
//               'Your ticket has been saved to gallery!',
//               style: TextStyle(color: Colors.white),
//             ),
//             snackStyle: SnackStyle.FLOATING);
//       } else {}
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   @override
//   void initState() {
//     // result.code = testValue;
//     Permission.camera.request().isGranted;
//     // showModalBottomSheet(
//     //   backgroundColor: Colors.transparent,
//     //   context: context,
//     //   builder: (context) {
//     //     return CustomPopupbuttonSheet(
//     //       assetImage: 'assets/images/svgfile/underDevelopment.svg',
//     //       description: 'This feature is under development at the moment',
//     //       title: 'This feature not available yet',
//     //     );
//     //   },
//     // );

//     super.initState();
//   }

//   bool isInvalid = false;
//   Uri? uri;
//   String? param;

//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoScaffold(
//       body: Builder(
//         builder: (context) => CupertinoPageScaffold(
//           child: WillPopScope(
//             onWillPop: () {
//               return Future.value(false); // if true allow back else block it
//             },
//             child: Scaffold(
//               body: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Column(
//                     children: <Widget>[
//                       Expanded(flex: 4, child: _buildQrView(context)),
//                       Container(
//                         margin: const EdgeInsets.symmetric(vertical: 10),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 30),
//                               child: Text(
//                                 "Scanning will start automatically",
//                                 style: Theme.of(context).textTheme.bodyMedium,
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 30),
//                               child: Text(
//                                 "Use Scan QR to view other CiC Member's profile.",
//                                 style: Theme.of(context).textTheme.bodyLarge,
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 30,
//                             ),
//                             // if (result != null)
//                             //   Text(
//                             //     'Format: ${result.format.formatName} Data: ${result.code}',
//                             //     style: Theme.of(context).textTheme.bodyLarge,
//                             //   ),
//                             if (uri != null)
//                               Text(
//                                 'Url: ${uri!} and param : $param',
//                                 style: const TextStyle(color: Colors.red),
//                               ),
//                             if (result != null &&
//                                 result!.code!.contains('event'))
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 20, vertical: 30),
//                                 child: CustomButton(
//                                   isDisable: false,
//                                   isOutline: false,
//                                   onPressed: () async {
//                                     int event = int.parse(
//                                       result!.code!.replaceAll('event', ''),
//                                     );

//                                     await _eventCon
//                                         .onFetchEventTicket(event)
//                                         .then(
//                                       (EventTicket ticket) {
//                                         if (ticket.ticket != null) {
//                                           onShowCustomCupertinoModalSheet(
//                                             context: context,
//                                             title: 'Your Ticket',
//                                             icon: const Icon(Icons.clear),
//                                             child: SizedBox(
//                                               width: double.infinity,
//                                               height: double.infinity,
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.start,
//                                                 children: [
//                                                   Expanded(
//                                                     child:
//                                                         SingleChildScrollView(
//                                                       child: Column(
//                                                         children: [
//                                                           Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .all(
//                                                                     padding),
//                                                             child:
//                                                                 RepaintBoundary(
//                                                               key:
//                                                                   printScreenKey,
//                                                               child:
//                                                                   CustomTicketCard(
//                                                                 eventTicket:
//                                                                     ticket,
//                                                                 onViewMap: () {
//                                                                   EventData eventData = EventData(
//                                                                       latitude: ticket
//                                                                           .ticket!
//                                                                           .latitude,
//                                                                       longitude: ticket
//                                                                           .ticket!
//                                                                           .longitude,
//                                                                       title: ticket
//                                                                           .ticket!
//                                                                           .event);

//                                                                   Navigator.pushNamed(
//                                                                       context,
//                                                                       RouteName
//                                                                           .GOOGLEMAPPAGE,
//                                                                       arguments:
//                                                                           eventData);
//                                                                 },
//                                                                 onViewListing:
//                                                                     () {
//                                                                   EventDetailArgument
//                                                                       argument =
//                                                                       EventDetailArgument(
//                                                                           id: event);
//                                                                   Navigator
//                                                                       .push(
//                                                                     context,
//                                                                     MaterialPageRoute(
//                                                                         builder:
//                                                                             (context) =>
//                                                                                 const EventDetail(),
//                                                                         settings:
//                                                                             RouteSettings(arguments: argument)),
//                                                                   );
//                                                                 },
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .symmetric(
//                                                                     horizontal:
//                                                                         60,
//                                                                     vertical:
//                                                                         padding),
//                                                             child: CustomButton(
//                                                               isDisable: false,
//                                                               isOutline: true,
//                                                               title:
//                                                                   'Save ticket as image',
//                                                               onPressed: () {
//                                                                 setState(() {});
//                                                                 onCaptureAndSave(
//                                                                     context);
//                                                               },
//                                                             ),
//                                                           ),
//                                                           const SizedBox(
//                                                               height: padding -
//                                                                   borderRaduis),
//                                                           SvgPicture.asset(
//                                                               'assets/images/svgfile/cic_logo.svg'),
//                                                           const SizedBox(
//                                                               height: padding),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Container(
//                                                     width: double.infinity,
//                                                     margin:
//                                                         const EdgeInsets.only(
//                                                             left: 0,
//                                                             right: 0,
//                                                             bottom: 20),
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             padding),
//                                                     child: CustomButton(
//                                                       title: 'Confirm',
//                                                       isDisable: false,
//                                                       isOutline: false,
//                                                       onPressed: () {
//                                                         Navigator.pop(context);
//                                                       },
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           );
//                                         }
//                                       },
//                                     );
//                                   },
//                                   title: 'Join Event',
//                                 ),
//                               ),

//                             if (result != null &&
//                                 result!.code!.contains('https'))
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 20, vertical: 30),
//                                 child: CustomButton(
//                                   isDisable: false,
//                                   isOutline: false,
//                                   onPressed: () async {
//                                     // print('Test Result Code:======>$')
//                                     // uri = Uri.parse(result!.code);
//                                     // param = uri!.queryParameters['memberID'];

//                                     final agument = MemberDetailAgrument(
//                                         id: int.parse(param!),
//                                         pageName: 'memberList');
//                                     if (setPinCon.isLogin.value) {
//                                       Navigator.pushNamed(
//                                           Get.context!, RouteName.MEMBERDETAIL,
//                                           arguments: agument);
//                                     }

//                                     // launch(result!.code);

//                                     launchUrl(Uri.parse(result!.code!));
//                                     // Navigator.pushNamed(
//                                     //   context,
//                                     //   RouteName.MEMBERDETAIL,
//                                     //   arguments: MemberDetailAgrument(
//                                     //     isNavigator: true,
//                                     //     id: _memberCon
//                                     //         .personalProfilemember.value.id,
//                                     //     // customer: _memberCon
//                                     //     // .personalProfilemember.value,
//                                     //     pageName: 'memberList',
//                                     //   ),
//                                     // );
//                                   },
//                                   title: 'View Profile Detail',
//                                 ),
//                               ),

//                             // Raisedbutton(
//                             //   onPressed: () async {
//                             //     await controller?.toggleFlash();
//                             //     setState(() {});
//                             //   },
//                             //   child: Text('Flash'),
//                             // ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   Obx(
//                     () => _eventCon.isLoadingTicket.value ||
//                             _memberCon.isLoadingQRCode.value
//                         ? Container(
//                             padding: const EdgeInsets.all(30),
//                             width: 100,
//                             height: 100,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: const CircularProgressIndicator(),
//                           )
//                         : Container(),
//                   ),
//                   isInvalid
//                       ? BackdropFilter(
//                           filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                           child: Container(
//                             height: double.infinity,
//                             width: double.infinity,
//                             color: Colors.black54,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Expanded(
//                                     child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: const [
//                                     Icon(Icons.report_problem_outlined,
//                                         size: 70, color: Colors.white),
//                                     SizedBox(
//                                       height: 20,
//                                     ),
//                                     Text(
//                                       'Invalid QR Code',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ],
//                                 )),
//                                 InkWell(
//                                   splashColor: Colors.transparent,
//                                   onTap: () {
//                                     setState(() {
//                                       isInvalid = false;
//                                     });
//                                   },
//                                   child: Container(
//                                     height: 50,
//                                     margin: const EdgeInsets.symmetric(
//                                         horizontal: 20),
//                                     width: double.infinity,
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         border: Border.all(
//                                             width: 1, color: Colors.white)),
//                                     child: const Text(
//                                       'Rescan',
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 30,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       : Container(),
//                   Positioned(
//                     top: 40,
//                     left: 20,
//                     child: IconButton(
//                       onPressed: widget.pageName == 'eventDetail'
//                           ? () {
//                               Navigator.pop(context);
//                             }
//                           : () {
//                               _settingCon.selectedIndex = 0;
//                               _settingCon.onHideBottomNavigationBar(false);
//                               _settingCon.update();
//                             },
//                       icon: const Icon(
//                         Icons.close,
//                         color: Colors.white,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildQrView(BuildContext context) {
//     // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
//     // var scanArea = (MediaQuery.of(context).size.width < 400 ||
//     //         MediaQuery.of(context).size.height < 400)
//     //     ? 150.0
//     //     : 300.0;
//     // To ensure the Scanner view is properly sizes after rotation
//     // we need to listen for Flutter SizeChanged notification and update controller
//     return Stack(
//       alignment: Alignment.bottomCenter,
//       children: [
//         QRView(
//           key: qrKey,
//           onQRViewCreated: _onQRViewCreated,
//           overlay: QrScannerOverlayShape(
//               borderColor: Colors.red,
//               borderRadius: 10,
//               borderLength: 30,
//               borderWidth: 10,
//               cutOutSize: 300),
//         ),
//         GestureDetector(
//           onTap: () {
//             showBarModalBottomSheet(
//                 context: context,
//                 builder: (contex) {
//                   return const ShowMyQRCode();
//                 });
//           },
//           child: Container(
//             width: 170,
//             margin: const EdgeInsets.symmetric(vertical: 30),
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             decoration: BoxDecoration(
//                 color: Colors.black.withAlpha(80),
//                 borderRadius: BorderRadius.circular(10)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child:
//                       SvgPicture.asset('assets/images/svgfile/qrCodeIcon.svg'),
//                 ),
//                 const Text(
//                   'My QR Code',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//             top: 40,
//             right: 20,
//             child: IconButton(
//               icon: SvgPicture.asset('assets/images/svgfile/flashIcon.svg'),
//               onPressed: () async {
//                 await controller?.toggleFlash();
//                 setState(() {});
//               },
//             )),
//       ],
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//         if (!result!.code!.contains('event') &&
//             !result!.code!.contains('https')) {
//           isInvalid = true;
//         } else {
//           isInvalid = false;
//         }
//       });
//     });
//   }}


//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class QrCodeScreen extends StatefulWidget {
//   final String? pageName;
//   const QrCodeScreen({Key? key, this.pageName}) : super(key: key);

//   @override
//   State<QrCodeScreen> createState() => _QrCodeScreenState();
// }

// class _QrCodeScreenState extends State<QrCodeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         height: 200,
//         width: 200,
//         child: MobileScanner(
//           allowDuplicates: false,
//           controller: MobileScannerController(
//               facing: CameraFacing.back, torchEnabled: false),
//           onDetect: (barcode, args) {
//             if (barcode.rawValue == null) {
//               debugPrint('Failed to scan Barcode');
//             } else {
//               final String code = barcode.rawValue!;
//               debugPrint('here is code $code');
//               // showDialog(
//               //   context: context,
//               //   builder: (context) {
//               //     return Text("Hellow $code");
//               //   },
//               // );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }