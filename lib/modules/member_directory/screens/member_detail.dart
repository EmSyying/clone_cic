import 'dart:convert';
import 'dart:io';
import 'package:cicgreenloan/modules/member_directory/screens/tabBar/company.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/generated/l10n.dart';

import 'package:cicgreenloan/modules/member_directory/screens/tabBar/personal_profile.dart';
import 'package:cicgreenloan/modules/setting_modules/screens/settings_screen.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Utils/helper/firebase_analytics.dart';
import '../../../Utils/helper/screen_agrument/member_screen_argument.dart';

class MemberDetail extends StatefulWidget {
  final MemberDetailAgrument? memberDetailAgrument;
  const MemberDetail({Key? key, this.memberDetailAgrument}) : super(key: key);
  @override
  State<MemberDetail> createState() => _MemberDetailState();
}

class _MemberDetailState extends State<MemberDetail> {
  final _memberCon = Get.put(MemberController());
  final customerCon = Get.put(CustomerController());
  bool innerBoxIsScrolled = false;
  bool isEdiableInformation = false;
  bool ishideAddress = false;
  File? imageFile;
  MemberDetailAgrument _argument = const MemberDetailAgrument();

  @override
  void initState() {
    _memberCon.fetchMemberPersonProfile(widget.memberDetailAgrument!.id!);
    _memberCon.getUserDetail(widget.memberDetailAgrument!.id!);
    //customerCon.getUser();

    // if (widget.pageName != 'user') {
    //   if (_memberCon.member.value.hiddenFields.length != 0) {
    //     _memberCon.member.value.hiddenFields.map((e) {
    //       if (e.field.contains('address')) {
    //         setState(() {
    //           ishideAddress = true;
    //         });
    //         print('is Hident: $ishideAddress');
    //       }
    //     });
    //   }
    //   print('Hident Field: ${_memberCon.member.value.hiddenFields[0]}');
    // }

    super.initState();
  }

  final _pickerImage = ImagePicker();
  Future<void> _onChooseImage() async {
    final pickerFile = await _pickerImage.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickerFile != null) {
        imageFile = File(pickerFile.path);
      }
    });
    startUpload();
  }

  Future<void> _onOpenCamera() async {
    final pickerFile = await _pickerImage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickerFile != null) {
        imageFile = File(pickerFile.path);
      }
    });
    startUpload();
  }

  uploadImage(BuildContext context) {
    return kIsWeb
        ? showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: 170.0,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await _onOpenCamera()
                            .then((value) => Navigator.pop(context));
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15),
                        child: Center(
                          child: Text(S.of(context).takePhoto,
                              style: Theme.of(context).textTheme.headline5),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await _onChooseImage()
                            .then((value) => Navigator.pop(context));
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15),
                        child: Center(
                          child: Text(S.of(context).openGallery,
                              style: Theme.of(context).textTheme.headline5),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100.0, vertical: 15),
                        child: Center(
                          child: Text(S.of(context).cancelButton,
                              style: Theme.of(context).textTheme.headline5),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })
        : Platform.isAndroid
            ? showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 170.0,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await _onOpenCamera()
                                .then((value) => Navigator.pop(context));
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(S.of(context).takePhoto,
                                  style: Theme.of(context).textTheme.headline5),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await _onChooseImage()
                                .then((value) => Navigator.pop(context));
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(S.of(context).openGallery,
                                  style: Theme.of(context).textTheme.headline5),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 15),
                            child: Center(
                              child: Text(S.of(context).cancelButton,
                                  style: Theme.of(context).textTheme.headline5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                })
            : showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return CupertinoActionSheet(
                    title: const Text('Profile Photo'),
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () async {
                          await _onOpenCamera()
                              .then((value) => Navigator.pop(context));
                        },
                        child: Text(
                          S.of(context).takePhoto,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () async {
                          await _onChooseImage()
                              .then((value) => Navigator.pop(context));
                        },
                        child: Text(S.of(context).openGallery,
                            style: Theme.of(context).textTheme.headline5),
                      ),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(S.of(context).cancelButton,
                          style: Theme.of(context).textTheme.headline5),
                    ),
                  );
                });
  }

  startUpload() async {
    var tokenKey = await LocalData.getCurrentUser();
    String url =
        '${GlobalConfiguration().getValue('main_api_url')}user/change-profile';
    if (imageFile == null) {
      return;
    }
    final byte = imageFile!.readAsBytesSync();
    final salarySlipResult = await FlutterImageCompress.compressWithList(
      byte.buffer.asUint8List(),
      minWidth: 800,
      minHeight: 800,
      quality: 70,
      rotate: 0,
    );

    String base64Image = base64Encode(salarySlipResult);

    await http
        .post(Uri.parse(url),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $tokenKey',
              'Content-type': 'application/json',
            },
            body: json.encode({
              'profile': 'data:image/png;base64,$base64Image',
            }))
        .then((value) {
      if (value.statusCode == 200) {
        customerCon.getUser();
      } else {}
    }).catchError((onError) {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.memberDetailAgrument != null) {
      _argument = widget.memberDetailAgrument!;

      _memberCon.getUserDetail(_argument.id!);
    } else {
      _argument =
          ModalRoute.of(context)!.settings.arguments as MemberDetailAgrument;

      _memberCon.getUserDetail(_argument.id!);
    }

    if (_argument.pageName == 'user') {
      setState(() {
        isEdiableInformation = true;
      });
    } else {
      setState(() {
        isEdiableInformation = false;
      });
    }
    final screenWidth = MediaQuery.of(context).size.width;
    return DefaultSizeWeb(
      child: CupertinoScaffold(
        body: Builder(
          builder: (BuildContext context) => CupertinoPageScaffold(
            child: WillPopScope(
              onWillPop: () async => false,
              child: DefaultTabController(
                length: _argument.pageName == 'user' ? 2 : 2,
                child: Scaffold(
                  body: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool isBoxIsScroll) {
                      innerBoxIsScrolled = isBoxIsScroll;

                      return <Widget>[
                        SliverOverlapAbsorber(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                          sliver: SliverAppBar(
                            centerTitle: true,
                            systemOverlayStyle: const SystemUiOverlayStyle(
                              statusBarBrightness: Brightness.dark,
                            ),
                            pinned: true,
                            actions: [
                              if (_argument.pageName == 'user')
                                IconButton(
                                    icon: isBoxIsScroll
                                        ? SvgPicture.asset(
                                            'assets/images/svgfile/Setting.svg')
                                        : SvgPicture.asset(
                                            'assets/images/svgfile/Setting.svg',
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 1)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SettingsScreen()));
                                    })
                              // TextButton(
                              //     onPressed: () {
                              //       Navigator.pushNamed(
                              //         context,
                              //         RouteName.BONUS,
                              //         arguments: BonusArgument(),
                              //       );
                              //     },
                              //     child: SvgPicture.asset(
                              //         'assets/images/svgfile/Setting.svg',
                              //         color: Colors.white)),
                            ],
                            leading: _argument.pageName != 'user'
                                ? IconButton(
                                    icon: Icon(Icons.close,
                                        color: isBoxIsScroll
                                            ? Colors.black
                                            : Colors.white),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                : Container(),
                            title: isBoxIsScroll
                                ? Obx(
                                    () => Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        const CircleAvatar(
                                            radius: 24,
                                            backgroundColor: Colors.white),
                                        _memberCon.isLoadingQRCode.value
                                            ? const CircularProgressIndicator()
                                            : _memberCon.personalProfilemember
                                                            .value.profile !=
                                                        null &&
                                                    _memberCon
                                                            .personalProfilemember
                                                            .value
                                                            .profile !=
                                                        ''
                                                ? CircleAvatar(
                                                    radius: 22,
                                                    backgroundImage:
                                                        NetworkImage(_memberCon
                                                            .personalProfilemember
                                                            .value
                                                            .profile!),
                                                  )
                                                : const CircleAvatar(
                                                    radius: 22,
                                                    backgroundImage: NetworkImage(
                                                        'https://cicstaging.z1central.com//uploads//files//default//default-user-icon.png'))
                                      ],
                                    ),
                                  )
                                : const Text(''),
                            floating: true,
                            expandedHeight: 350.0,
                            elevation: 2.0,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Container(
                                width: double.infinity,
                                height: 330,
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(1.0, 0.0),
                                        color: Colors.black12,
                                        blurRadius: 6),
                                  ],
                                  color: Theme.of(context).cardColor,
                                ),
                                child: Obx(
                                  () => Stack(
                                    children: [
                                      const SizedBox(
                                        height: double.infinity,
                                        width: double.infinity,
                                      ),
                                      Positioned(
                                        top: 260,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          color: Theme.of(context).cardColor,
                                          padding: const EdgeInsets.all(20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              !_memberCon.isLoadingQRCode.value
                                                  ? Row(
                                                      children: [
                                                        Text('Profile Strengh:',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline2),
                                                        Text(
                                                          _memberCon.personalProfilemember.value
                                                                          .percentage! >=
                                                                      0 &&
                                                                  _memberCon
                                                                          .personalProfilemember
                                                                          .value
                                                                          .percentage! <=
                                                                      35
                                                              ? ' Low'
                                                              : _memberCon.personalProfilemember.value
                                                                              .percentage! >
                                                                          35 &&
                                                                      _memberCon
                                                                              .personalProfilemember
                                                                              .value
                                                                              .percentage! <=
                                                                          49
                                                                  ? ' Medium'
                                                                  : _memberCon.personalProfilemember.value.percentage! >
                                                                              49 &&
                                                                          _memberCon.personalProfilemember.value.percentage! <=
                                                                              60
                                                                      ? ' Intermediate'
                                                                      : ' Good',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'DMSans',
                                                            fontSize: 16,
                                                            color: Colors.grey,
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  : Shimmer.fromColors(
                                                      baseColor:
                                                          Colors.grey[100]!,
                                                      highlightColor:
                                                          Colors.white,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.white,
                                                        ),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                        height: 20,
                                                      ),
                                                    ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              !_memberCon.isLoadingQRCode.value
                                                  ? Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                color: Colors
                                                                    .grey[300],
                                                              ),
                                                              width:
                                                                  screenWidth,
                                                              height: 15,
                                                            ),
                                                            Container(
                                                              width: (_memberCon
                                                                          .personalProfilemember
                                                                          .value
                                                                          .percentage! /
                                                                      100) *
                                                                  screenWidth,
                                                              height: 15,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft:
                                                                          const Radius.circular(
                                                                              10),
                                                                      bottomLeft:
                                                                          const Radius.circular(
                                                                              10),
                                                                      topRight: _memberCon.personalProfilemember.value.percentage == 100
                                                                          ? const Radius.circular(
                                                                              10)
                                                                          : const Radius.circular(
                                                                              0),
                                                                      bottomRight: _memberCon.personalProfilemember.value.percentage == 100
                                                                          ? const Radius.circular(
                                                                              10)
                                                                          : const Radius.circular(
                                                                              0)),
                                                                  gradient:
                                                                      LinearGradient(
                                                                          colors: [Theme.of(context).primaryColor, Colors.green])),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  screenWidth,
                                                              height: 15,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    height: double
                                                                        .infinity,
                                                                    width: 5,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  Container(
                                                                    height: double
                                                                        .infinity,
                                                                    width: 5,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  Container(
                                                                    height: double
                                                                        .infinity,
                                                                    width: 5,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  Container(
                                                                    height: double
                                                                        .infinity,
                                                                    width: 5,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  Container(
                                                                    height: double
                                                                        .infinity,
                                                                    width: 5,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  Container(
                                                                    height: double
                                                                        .infinity,
                                                                    width: 5,
                                                                    color: Colors
                                                                        .white,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SvgPicture.asset(
                                                              'assets/images/svgfile/lowPercentage.svg',
                                                            ),
                                                            SvgPicture.asset(
                                                              'assets/images/svgfile/mediumPercentage.svg',
                                                            ),
                                                            SvgPicture.asset(
                                                              'assets/images/svgfile/goodPercentage.svg',
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  : Shimmer.fromColors(
                                                      baseColor:
                                                          Colors.grey[100]!,
                                                      highlightColor:
                                                          Colors.white,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors.white,
                                                        ),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                        height: 20,
                                                      ),
                                                    ),
                                              const SizedBox(
                                                height: 20,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 152,
                                        width: double.infinity,
                                        color: Get.theme.brightness ==
                                                Brightness.light
                                            ? Theme.of(context).primaryColor
                                            : Colors.black26,
                                      ),
                                      Positioned(
                                        top: 100,
                                        left: 0.0,
                                        right: 0.0,
                                        child: Column(
                                          children: [
                                            Obx(
                                              () => Stack(
                                                clipBehavior: Clip.none,
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                Colors.white),
                                                  ),
                                                  _memberCon
                                                          .isLoadingQRCode.value
                                                      ? Shimmer.fromColors(
                                                          highlightColor:
                                                              Colors.white,
                                                          baseColor:
                                                              Colors.grey[300]!,
                                                          child: Container(
                                                            height: 90,
                                                            width: 90,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Colors
                                                                  .grey[100],
                                                            ),
                                                          ),
                                                        )
                                                      : _memberCon
                                                                      .personalProfilemember
                                                                      .value
                                                                      .profile !=
                                                                  null &&
                                                              _memberCon
                                                                      .personalProfilemember
                                                                      .value
                                                                      .profile !=
                                                                  ''
                                                          ? Container(
                                                              height: 90,
                                                              width: 90,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    image: NetworkImage(_memberCon
                                                                        .personalProfilemember
                                                                        .value
                                                                        .profile!),
                                                                    fit: BoxFit
                                                                        .cover),
                                                              ),
                                                            )
                                                          : Container(
                                                              height: 90,
                                                              width: 90,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                        'https://cicstaging.z1central.com//uploads//files//default//default-user-icon.png'),
                                                                    fit: BoxFit
                                                                        .cover),
                                                              ),
                                                            ),
                                                  // ((() {
                                                  //   if (!customerCon
                                                  //           .isloading
                                                  //           .value &&
                                                  //       _memberCon
                                                  //               .personalProfilemember
                                                  //               .value !=
                                                  //           null) {
                                                  //     return _memberCon
                                                  //                 .personalProfilemember
                                                  //                 .value
                                                  //                 .profile !=
                                                  //             ""
                                                  //         ? Container(
                                                  //             height: 90,
                                                  //             width: 90,
                                                  //             decoration: BoxDecoration(
                                                  //                 shape: BoxShape
                                                  //                     .circle,
                                                  //                 image: DecorationImage(
                                                  //                     image: NetworkImage(_memberCon
                                                  //                         .personalProfilemember
                                                  //                         .value
                                                  //                         .profile!),
                                                  //                     fit: BoxFit
                                                  //                         .cover)),
                                                  //           )
                                                  //         : Container(
                                                  //             height: 90,
                                                  //             width: 90,
                                                  //             decoration: BoxDecoration(
                                                  //                 shape: BoxShape
                                                  //                     .circle,
                                                  //                 image: DecorationImage(
                                                  //                     image: NetworkImage(customerCon
                                                  //                         .customer
                                                  //                         .value
                                                  //                         .profile!),
                                                  //                     fit: BoxFit
                                                  //                         .cover)),
                                                  //           );
                                                  //   } else if (customerCon
                                                  //       .isloading.value) {
                                                  //     return Container(
                                                  //       height: 90,
                                                  //       width: 90,
                                                  //       decoration:
                                                  //           BoxDecoration(
                                                  //         shape: BoxShape
                                                  //             .circle,
                                                  //       ),
                                                  //       child:
                                                  //           CircularProgressIndicator(),
                                                  //     );
                                                  //   } else {
                                                  //     return _memberCon
                                                  //                 .personalProfilemember
                                                  //                 .value
                                                  //                 .profile !=
                                                  //             ""
                                                  //         ? Container(
                                                  //             height: 90,
                                                  //             width: 90,
                                                  //             decoration: BoxDecoration(
                                                  //                 shape: BoxShape
                                                  //                     .circle,
                                                  //                 image: DecorationImage(
                                                  //                     image: NetworkImage(_memberCon
                                                  //                         .personalProfilemember
                                                  //                         .value
                                                  //                         .profile!),
                                                  //                     fit: BoxFit
                                                  //                         .cover)),
                                                  //           )
                                                  //         : Container(
                                                  //             height: 90,
                                                  //             width: 90,
                                                  //             decoration: BoxDecoration(
                                                  //                 shape: BoxShape
                                                  //                     .circle,
                                                  //                 image: DecorationImage(
                                                  //                     image: NetworkImage(_memberCon
                                                  //                         .personalProfilemember
                                                  //                         .value
                                                  //                         .profile!),
                                                  //                     fit: BoxFit
                                                  //                         .cover)),
                                                  //           );
                                                  //   }
                                                  // }())),
                                                  if (_argument.pageName ==
                                                      'user')
                                                    Positioned(
                                                      bottom: 25.0,
                                                      right: -15.0,
                                                      child: InkWell(
                                                        onTap: () {
                                                          uploadImage(context);
                                                          // customerCon.getUser();
                                                        },
                                                        child: Container(
                                                          height: 35,
                                                          width: 35,
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 10.0,
                                                                  top: 10.0,
                                                                  left: 10.0),
                                                          decoration:
                                                              BoxDecoration(
                                                                  //                                        color: Color(0xFFFFFFFF),
                                                                  color: Theme.of(
                                                                          context)
                                                                      .cardColor,
                                                                  shape: BoxShape
                                                                      .circle),
                                                          alignment:
                                                              Alignment.center,
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/svgfile/camaraIcons.svg',
                                                            width: 18,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (_argument.pageName ==
                                                      'user')
                                                    Positioned(
                                                      bottom: 5.0,
                                                      left: 8.0,
                                                      child: Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        children: [
                                                          Container(
                                                            height: 20,
                                                            width: 20,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                          Container(
                                                            height: 15,
                                                            width: 15,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .green),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                _memberCon.isLoadingQRCode.value
                                                    ? Shimmer.fromColors(
                                                        baseColor:
                                                            Colors.grey[100]!,
                                                        highlightColor:
                                                            Colors.white,
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors.white,
                                                          ),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                          height: 20,
                                                        ),
                                                      )
                                                    : _memberCon
                                                                .personalProfilemember
                                                                .value
                                                                .fullName !=
                                                            ''
                                                        ? Text(
                                                            _memberCon
                                                                .personalProfilemember
                                                                .value
                                                                .fullName!,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption)
                                                        : const Text(''),
                                                _memberCon.isLoadingQRCode.value
                                                    ? Shimmer.fromColors(
                                                        baseColor:
                                                            Colors.grey[100]!,
                                                        highlightColor:
                                                            Colors.white,
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors.white,
                                                          ),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                          height: 15,
                                                        ),
                                                      )
                                                    : _memberCon
                                                                .personalProfilemember
                                                                .value
                                                                .position!
                                                                .display !=
                                                            ''
                                                        ? Text(
                                                            _memberCon
                                                                .personalProfilemember
                                                                .value
                                                                .position!
                                                                .display!,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText2,
                                                          )
                                                        : const Text(''),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            forceElevated: innerBoxIsScrolled,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ];
                    },
                    body: Builder(
                      builder: (BuildContext context) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            TabBar(
                              isScrollable: true,
                              labelStyle: TextStyle(
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor),
                              indicatorWeight: 3,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorColor: Theme.of(context).primaryColor,
                              labelColor: Theme.of(context).primaryColor,
                              unselectedLabelColor:
                                  Get.theme.brightness == Brightness.light
                                      ? Colors.grey[500]
                                      : Colors.white,
                              tabs: const [
                                Tab(
                                  text: 'Personal Profile',
                                ),
                                Tab(
                                  text: 'Company',
                                ),
                              ],
                              onTap: (index) {
                                FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                    index == 0
                                        ? 'Personal Profile'
                                        : 'Profile Company');
                              },
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  PersonalProfile(
                                      id: _argument.id!,
                                      // customer: _argument.customer,
                                      // member: _argument.member,
                                      isEdiable: isEdiableInformation,
                                      isHidenAddress: ishideAddress),
                                  // Education(),
                                  // Education(
                                  //   customer: widget.customer,
                                  //   member: _memberCon.member.value,
                                  //   isEdiable: isEdiableInformation,
                                  // ),
                                  // Experience(
                                  //   customer: widget.customer,
                                  //   member: _memberCon.member.value,
                                  //   isEdiable: isEdiableInformation,
                                  // ),
                                  // Text(
                                  //   _argument.id!.toString(),
                                  //   style: TextStyle(color: Colors.red),
                                  // ),

                                  CompanyPage(
                                    // isView: widget.status == 'view' ? true : false,
                                    // customer: _argument.customer,
                                    // member: _argument.member,
                                    id: _argument.id!,
                                    isEdiable: isEdiableInformation,
                                    isHidenAddress: ishideAddress,
                                  ),
                                  // if (widget.pageName == 'user')
                                  //   Subsciption(
                                  //     customer: widget.customer,
                                  //     member: _memberCon.member.value,
                                  //     isEditable: isEdiableInformation,
                                  //   ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class MemberDetail extends StatelessWidget {
//   List<Widget> educationList = [
//     EducationCard(),
//     EducationCard(),
//     EducationCard(),
//   ];
//   final Member member;
//   MemberDetail({this.member});
//   @override
//   Widget build(BuildContext context) {
//     final _screenWidth = MediaQuery.of(context).size.width;
//     print('Screen Width: $_screenWidth');
//     return Scaffold(
//         body: Stack(
//       alignment: Alignment.topCenter,
//       children: [
//         Container(
//           height: double.infinity,
//           width: double.infinity,
//           child: Container(),
//         ),
//         Container(
//           height: 150,
//           width: double.infinity,
//           color: Theme.of(context).primaryColor,
//         ),
//         AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0.0,
//         ),
//         Positioned(
//           top: 120,
//           right: 0.0,
//           left: 0.0,
//           child: Container(
//             color: Colors.white,
//             width: double.infinity,
//             height: 100,
//           ),
//         ),
//         Positioned(
//           top: 200,
//           left: 0.0,
//           right: 0.0,
//           bottom: 0.0,
//           child: Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     color: Colors.white,
//                     width: double.infinity,
//                     padding: EdgeInsets.only(
//                         left: 10, right: 10, top: 10, bottom: 20),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           member.name != null ? member.name : '',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         Text(member.position != null ? member.position : '',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold)),
//                         Text(
//                           'Cambodian Investors Corporation Plc',
//                           style: TextStyle(color: Colors.black, height: 1.5),
//                         ),
//                         Text(
//                           'Phnom Penh, Cambodia . 96 connections',
//                           style: TextStyle(color: Colors.black, height: 1.5),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     color: Colors.white,
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               'Profile Strength: ',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                             Text(
//                               'Intermediate',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black),
//                             ),
//                             Spacer(),
//                             Icon(Icons.keyboard_arrow_down),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Stack(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Colors.grey[300],
//                               ),
//                               width: _screenWidth,
//                               height: 15,
//                             ),
//                             Container(
//                               width: (member.percentage / 100) * _screenWidth,
//                               height: 15,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(10),
//                                       bottomLeft: Radius.circular(10),
//                                       topRight: member.percentage == 100
//                                           ? Radius.circular(10)
//                                           : Radius.circular(0),
//                                       bottomRight: member.percentage == 100
//                                           ? Radius.circular(10)
//                                           : Radius.circular(0)),
//                                   gradient: LinearGradient(colors: [
//                                     Theme.of(context).primaryColor,
//                                     Colors.green
//                                   ])),
//                             ),
//                             Container(
//                               width: _screenWidth,
//                               height: 15,
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Container(
//                                     height: double.infinity,
//                                     width: 5,
//                                     color: Colors.white,
//                                   ),
//                                   Container(
//                                     height: double.infinity,
//                                     width: 5,
//                                     color: Colors.white,
//                                   ),
//                                   Container(
//                                     height: double.infinity,
//                                     width: 5,
//                                     color: Colors.white,
//                                   ),
//                                   Container(
//                                     height: double.infinity,
//                                     width: 5,
//                                     color: Colors.white,
//                                   ),
//                                   Container(
//                                     height: double.infinity,
//                                     width: 5,
//                                     color: Colors.white,
//                                   ),
//                                   Container(
//                                     height: double.infinity,
//                                     width: 5,
//                                     color: Colors.white,
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border(
//                             bottom: BorderSide(
//                                 width: 1.0, color: Colors.grey[300]))),
//                     width: double.infinity,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'About',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         member.about != ''
//                             ? Text(
//                                 member.about,
//                                 style: TextStyle(color: Colors.black87),
//                               )
//                             : Container(),
//                         if (member.about == '')
//                           DottedBorder(
//                             dashPattern: [5.0],
//                             color: Colors.grey[300],
//                             padding: EdgeInsets.all(8),
//                             child: Column(
//                               children: [
//                                 Row(children: [
//                                   Icon(
//                                     Icons.add,
//                                     size: 18,
//                                     color: Theme.of(context).primaryColor,
//                                   ),
//                                   Text(
//                                     'Add summary',
//                                     style: TextStyle(
//                                         color: Theme.of(context).primaryColor),
//                                   ),
//                                   Spacer(),
//                                   Icon(
//                                     Icons.close,
//                                     size: 18,
//                                   ),
//                                 ]),
//                                 Container(
//                                   margin: EdgeInsets.only(right: 15),
//                                   child: Text(
//                                     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//                                     style: TextStyle(color: Colors.black87),
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(bottom: 10, right: 10),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Experience',
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                   Icon(
//                                     Icons.edit_outlined,
//                                     size: 18,
//                                   )
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 15,
//                               ),
//                               Row(
//                                 children: [
//                                   Container(
//                                     height: 35,
//                                     width: 35,
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: AssetImage(
//                                             'assets/images/Logo/cic.png'),
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Expanded(
//                                       child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Senior Business Development',
//                                         style: TextStyle(
//                                             color: Colors.black,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                       Text(
//                                         'Cambodian Investors Corporation Plc . Full-time Jan 2017 - Present . 4 yrs',
//                                         style: TextStyle(color: Colors.black87),
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                       )
//                                     ],
//                                   ))
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     color: Colors.white,
//                     padding: EdgeInsets.only(
//                         left: 10, right: 20, top: 10, bottom: 10),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Education',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                             Icon(
//                               Icons.edit_outlined,
//                               size: 18,
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Column(
//                           children: educationList.map((e) {
//                             return GestureDetector(
//                                 onTap: () {
//                                   print(e.key);
//                                 },
//                                 child: EducationCard());
//                           }).toList(),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 90,
//           left: 10,
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 height: 110,
//                 width: 110,
//                 decoration:
//                     BoxDecoration(shape: BoxShape.circle, color: Colors.white),
//               ),
//               member.photo != null
//                   ? Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.red,
//                           image: DecorationImage(
//                               image: NetworkImage(member.photo),
//                               fit: BoxFit.cover)),
//                     )
//                   : Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Theme.of(context).primaryColor),
//                       child: Center(
//                         child: Text(
//                           member.defaultPhoto,
//                           style: TextStyle(fontSize: 32),
//                         ),
//                       ),
//                     ),
//             ],
//           ),
//         ),
//         Positioned(
//           top: 120,
//           right: 0,
//           child: Container(
//             child: IconButton(
//                 icon: Icon(
//                   Icons.edit_outlined,
//                   size: 18,
//                 ),
//                 onPressed: () {}),
//           ),
//         ),
//       ],
//     ));
//   }
// }
