import 'dart:async';
import 'dart:io';

import 'package:cicgreenloan/Utils/helper/custom_loading_button.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/comfirm_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CompanyProfilePopUpt extends StatefulWidget {
  final GestureDoubleTapCallback? onTap;
  final Member? member;
  final int? companyid;

  final String? networkCompanylogo;
  const CompanyProfilePopUpt({
    Key? key,
    this.onTap,
    this.member,
    this.companyid,
    this.networkCompanylogo,
  }) : super(key: key);

  @override
  State<CompanyProfilePopUpt> createState() => _CompanyProfilePopUptState();
}

class _CompanyProfilePopUptState extends State<CompanyProfilePopUpt> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final _memberCon = Get.put(MemberController());
  final customerController = Get.put(CustomerController());

  Future<void> onRefresh() async {
    if (customerController.customer.value.customerId != null) {
      _memberCon.fetchCompanyMemberDetail(
          customerController.customer.value.customerId!);
    } else if (widget.member != null) {
      _memberCon.fetchCompanyMemberDetail(
          customerController.customer.value.customerId!);
    } else {
      _memberCon.fetchCompanyMemberDetail(
          customerController.customer.value.customerId!);
    }
  }

  TextEditingController companynameController = TextEditingController();
  @override
  void initState() {
    // companynameController.text = _memberCon.comCompanyName.value;
    super.initState();
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
                      onTap: () {
                        _onOpenCamera();

                        Navigator.pop(context);
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
                      onTap: () {
                        _onChooseImage();

                        Navigator.pop(context);
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
                          onTap: () {
                            _onOpenCamera();

                            Navigator.pop(context);
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
                          onTap: () {
                            _onChooseImage();

                            Navigator.pop(context);
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
            : kIsWeb
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _onChooseImage();
                                Navigator.pop(context);
                              },
                              child: Container(
                                color: Colors.white,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100.0, vertical: 15),
                                child: Center(
                                  child: Text(S.of(context).openGallery,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
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
                            onPressed: () {
                              _onOpenCamera();

                              Navigator.pop(context);
                            },
                            child: Text(
                              S.of(context).takePhoto,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () {
                              _onChooseImage();

                              Navigator.pop(context);
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

  final _pickerImage = ImagePicker();
  Future<void> _onChooseImage() async {
    final pickerFile =
        await _pickerImage.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickerFile != null) {
        _memberCon.comCompanyLogo = File(pickerFile.path);
      }
    });
    // startUpload();
  }

  Future<void> _onOpenCamera() async {
    final pickerFile = await _pickerImage.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickerFile != null) {
        _memberCon.comCompanyLogo = File(pickerFile.path);
      }
    });
    // startUpload();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        uploadImage(context);
                        _memberCon.update();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        width: 70,
                        height: 70,
                        decoration: widget.networkCompanylogo != null ||
                                _memberCon.comCompanyLogo != null
                            ? BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.greenAccent,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: _memberCon.comCompanyLogo != null
                                      ? FileImage(_memberCon.comCompanyLogo!)
                                      : NetworkImage(widget.networkCompanylogo!)
                                          as ImageProvider,
                                ))
                            : BoxDecoration(
                                //         color: Color(0xFFFFFFFF),
                                color: Theme.of(context).cardColor,
                                shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: widget.networkCompanylogo != '' ||
                                _memberCon.comCompanyLogo != null
                            ? Container()
                            : SvgPicture.asset(
                                'assets/images/svgfile/camaraIcons.svg',
                                width: 18,
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFieldNew(
                      initialValue: _memberCon.comCompanyName.value,
                      hintText: 'Company Name',
                      labelText: 'Company Name',
                      onChange: (value) {
                        setState(() {
                          if (value == '') {
                            _memberCon.comCompanyName.value = "";
                          } else {
                            companynameController.text = value;
                          }
                          _memberCon.comCompanyName.value = value;
                        });
                      },
                      // controller: companynameController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(children: [
            Expanded(
              child: Container(
                height: 50.0,
                width: double.infinity,
                margin:
                    const EdgeInsets.only(left: 15.0, top: 20.0, bottom: 25.0),
                child: (CustomButton(
                  title: "Cancel",
                  isOutline: true,
                  isDisable: false,
                  onPressed: companynameController.text == "" &&
                          _memberCon.comCompanyLogo == null
                      ? () {
                          Navigator.pop(context);
                        }
                      : () {
                          onShowConfirmAlert(
                              context: context,
                              title: 'Confirmation',
                              content: 'Are you sure, You want to cancel',
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                });
                              });
                        },
                )),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Container(
                height: 50.0,
                width: double.infinity,
                margin:
                    const EdgeInsets.only(right: 15.0, top: 20.0, bottom: 25.0),
                child: _memberCon.isLoading.value
                    ? const CustomLoadingButton()
                    : CustomButton(
                        title: "Update",
                        isOutline: false,
                        isDisable: companynameController.text == "" &&
                                _memberCon.comCompanyLogo == null
                            ? true
                            : false,
                        onPressed: () async {
                          if (_memberCon.isSelectTap.value == false) {
                            _memberCon.isSelectTap.value = true;
                            await _memberCon.onUpdateCompany(
                                context, widget.companyid!);
                            // Timer(const Duration(seconds: 2), () {
                            //   Navigator.pop(context, true);
                            // });

                            _memberCon.isSelectTap.value = false;
                          }
                          onRefresh();
                        }),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
