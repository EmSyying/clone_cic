import 'dart:async';
import 'dart:io';

import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/utils/select_address/select_address_controller.dart';
import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddCompanyFormPopUp extends StatefulWidget {
  final Member? member;
  final int? companyid;
  final bool? isEditable;
  const AddCompanyFormPopUp(
      {Key? key, this.companyid, this.member, this.isEditable = false})
      : super(key: key);
  @override
  State<AddCompanyFormPopUp> createState() => _AddCompanyFormPopUpState();
}

class _AddCompanyFormPopUpState extends State<AddCompanyFormPopUp> {
  final _memberCon = Get.put(MemberController());
  final customerController = Get.put(CustomerController());
  final reqCon = Get.put(RequestLoanController());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
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

  isNotNul() {
    return _memberCon.comCompanyName.value != "" &&
        _memberCon.comproductandservice.value != "" &&
        _memberCon.comKhmerName.value != "" &&
        _memberCon.comphonenumber.value != "" &&
        _memberCon.comEmail.value != "" &&
        _memberCon.comTelegram.value != "";
  }

  final companyNameKey = GlobalKey();
  final productServiceKey = GlobalKey();
  final khmerNameKey = GlobalKey();
  final phoneNumberKey = GlobalKey();
  final emailKey = GlobalKey();
  final telegramKey = GlobalKey();
  final whatAppKey = GlobalKey();
  final skypeKey = GlobalKey();
  final messengerKey = GlobalKey();
  final houseNoKey = GlobalKey();
  final streetNoKey = GlobalKey();
  final websiteKey = GlobalKey();
  final facebookKey = GlobalKey();
  final linkInKey = GlobalKey();
  final tweeterKey = GlobalKey();
  final addressKey = GlobalKey();
  final scrollAbleKey = GlobalKey();
  final positionKey = GlobalKey();
  bool? isValidateComapanyName;
  bool? isValidatedProductService;
  bool? isValidateKhmerName;
  bool? isValidatePosition;
  bool? isValidatePhoneNumber;
  bool? isValidateEmail;
  bool? isValidateTelegram;
  bool? isUpdate;
  bool isValidate() {
    // if (_memberCon.comCompanyName.value.isEmpty) {
    //   setState(() {
    //     isValidateComapanyName = false;
    //   });
    //   // Scrollable.ensureVisible(companyNameKey.currentContext!);
    //   return false;
    // } else if (_memberCon.comcompanyproductandservice.value.isEmpty) {
    //   setState(() {
    //     isValidatedProductService = false;
    //   });
    //   // Scrollable.ensureVisible(productServiceKey.currentContext!);
    //   return false;
    // } else if (_memberCon.comKhmerName.value.isEmpty) {
    //   setState(() {
    //     isValidateKhmerName = false;
    //   });
    //   // Scrollable.ensureVisible(khmerNameKey.currentContext!);
    //   return false;
    // } else if (_memberCon.comPositions.value.isEmpty) {
    //   setState(() {
    //     isValidatePosition = false;
    //     // return false;
    //   });
    //   // Scrollable.ensureVisible(positionKey.currentContext!);
    //   // print("No purpose: ${reqCon.purpose.value.display}");
    //   return false;
    // } else if (_memberCon.comphonenumber.value.isEmpty) {
    //   setState(() {
    //     isValidatePhoneNumber = false;
    //   });
    //   // Scrollable.ensureVisible(phoneNumberKey.currentContext!);
    //   return false;
    // } else if (_memberCon.comEmail.value.isEmpty) {
    //   setState(() {
    //     isValidateEmail = false;
    //   });
    //   // Scrollable.ensureVisible(emailKey.currentContext!);
    //   return false;
    // } else if (_memberCon.comTelegram.value.isEmpty) {
    //   setState(() {
    //     isValidateTelegram = false;
    //   });
    //   // Scrollable.ensureVisible(telegramKey.currentContext!);
    //   return false;
    // }
    if (_memberCon.comCompanyName.value == "") {
      setState(() {
        isValidateComapanyName = false;
      });
    } else {
      isValidateComapanyName = true;
    }
    if (_memberCon.comproductandservice.value == "") {
      setState(() {
        isValidatedProductService = false;
      });
    } else {
      setState(() {
        isValidatedProductService = true;
      });
    }
    if (_memberCon.comKhmerName.value == "") {
      setState(() {
        isValidateKhmerName = false;
      });
    } else {
      setState(() {
        isValidateKhmerName = true;
      });
    }
    if (_memberCon.comphonenumber.value == "") {
      setState(() {
        isValidatePhoneNumber = false;
      });
    } else {
      setState(() {
        isValidatePhoneNumber = true;
      });
    }
    if (_memberCon.comTelegram.value == "") {
      setState(() {
        isValidateTelegram = false;
      });
    } else {
      setState(() {
        isValidateTelegram = true;
      });
    }
    if (_memberCon.comEmail.value == "") {
      setState(() {
        isValidateEmail = false;
      });
    } else {
      setState(() {
        isValidateEmail = true;
      });
    }
    return true;
  }

  bool isHideAddress = false;
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
                              style: Theme.of(context).textTheme.headlineSmall),
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
                              style: Theme.of(context).textTheme.headlineSmall),
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
                              style: Theme.of(context).textTheme.headlineSmall),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
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
                                      .headlineSmall),
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
                                      .headlineSmall),
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
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          _onChooseImage();

                          Navigator.pop(context);
                        },
                        child: Text(S.of(context).openGallery,
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(S.of(context).cancelButton,
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                  );
                });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onPanDown: (_) {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Company Information',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                            Container()
                          ],
                        ),
                        widget.isEditable!
                            ? GestureDetector(
                                onTap: () {
                                  setState(() async {
                                    await uploadImage(context);
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(left: 20.0),
                                  width: 70,
                                  height: 70,
                                  decoration: _memberCon.comCompanyLogo != null
                                      ? BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.greenAccent,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(
                                                _memberCon.comCompanyLogo!),
                                          ),
                                        )
                                      : BoxDecoration(
                                          //         color: Color(0xFFFFFFFF),
                                          color: Theme.of(context).cardColor,
                                          shape: BoxShape.circle),
                                  alignment: Alignment.center,
                                  child: _memberCon.comCompanyLogo != null
                                      ? Container()
                                      : SvgPicture.asset(
                                          'assets/images/svgfile/camaraIcons.svg',
                                          width: 18,
                                        ),
                                ),
                              )
                            : Container(),
                        const SizedBox(height: 20.0),
                        Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                                color: Colors.black12),
                          ], color: Colors.white),
                          child: CustomTextFieldNew(
                            key: companyNameKey,
                            isRequired: true,
                            isValidate: isValidateComapanyName,
                            hintText: 'Company Name',
                            initialValue: _memberCon.comCompanyName.value,
                            labelText: 'Company Name',
                            onChange: (value) {
                              if (value == '') {
                                setState(() {
                                  _memberCon.comCompanyName.value = '';
                                  isValidateComapanyName = false;
                                });
                              } else {
                                setState(() {
                                  _memberCon.comCompanyName.value = value;
                                  isValidateComapanyName = true;
                                });
                              }
                            },
                            onSave: (value) {
                              _memberCon.comCompanyName.value = value!;
                            },
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Product and Service',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                            Container()
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                                color: Colors.black12),
                          ], color: Colors.white),
                          child: Column(children: [
                            CustomTextFieldNew(
                              key: productServiceKey,
                              isRequired: true,
                              isValidate: isValidatedProductService,
                              hintText: 'Product and Service',
                              initialValue:
                                  _memberCon.comproductandservice.value,
                              labelText: 'Product and Service',
                              onChange: (value) {
                                if (value == '') {
                                  setState(() {
                                    _memberCon.comproductandservice.value = '';
                                    isValidatedProductService = false;
                                  });
                                } else {
                                  setState(() {
                                    _memberCon.comproductandservice.value =
                                        value;
                                    isValidatedProductService = true;
                                  });
                                }
                              },
                              onSave: (value) {
                                _memberCon.comproductandservice.value = value!;
                              },
                            ),
                            CustomTextFieldNew(
                              key: khmerNameKey,
                              isRequired: true,
                              isValidate: isValidateKhmerName,
                              hintText: 'Khmer Name',
                              initialValue: _memberCon.comKhmerName.value,
                              labelText: 'Khmer Name',
                              onChange: (value) {
                                if (value == '') {
                                  setState(() {
                                    _memberCon.comKhmerName.value = '';
                                    isValidateKhmerName = false;
                                  });
                                } else {
                                  setState(() {
                                    _memberCon.comKhmerName.value = value;
                                    isValidateKhmerName = true;
                                  });
                                }
                              },
                              onSave: (value) {
                                _memberCon.comKhmerName.value = value!;
                              },
                            ),
                            CustomTextFieldNew(
                              key: positionKey,
                              isRequired: true,
                              isValidate: isValidatePosition,
                              hintText: 'Position',
                              initialValue: _memberCon.comPositions.value,
                              labelText: 'Postion',
                              onChange: (value) {
                                if (value == '') {
                                  setState(() {
                                    _memberCon.comPositions.value = '';
                                    isValidatePosition = false;
                                  });
                                } else {
                                  setState(() {
                                    _memberCon.comPositions.value = value;
                                    isValidatePosition = true;
                                  });
                                }
                              },
                              onSave: (value) {
                                _memberCon.comPositions.value = value!;
                              },
                            ),
                          ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Contact Information',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                            Container()
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                                color: Colors.black12),
                          ], color: Colors.white),
                          child: Column(children: [
                            CustomTextFieldNew(
                              key: phoneNumberKey,
                              isRequired: true,
                              isValidate: isValidatePhoneNumber,
                              hintText: 'Phone number',
                              initialValue: _memberCon.comphonenumber.value,
                              labelText: 'Phone number',
                              onChange: (value) {
                                if (value == '') {
                                  setState(() {
                                    _memberCon.comphonenumber.value = '';
                                    isValidatePhoneNumber = false;
                                  });
                                } else {
                                  setState(() {
                                    _memberCon.comphonenumber.value = value;
                                    isValidatePhoneNumber = true;
                                  });
                                }
                              },
                              onSave: (value) {
                                _memberCon.comphonenumber.value = value!;
                              },
                            ),
                            CustomTextFieldNew(
                              key: emailKey,
                              isRequired: true,
                              isValidate: isValidateEmail,
                              hintText: 'Email',
                              initialValue: _memberCon.comEmail.value,
                              labelText: 'Email',
                              onChange: (value) {
                                if (value == '') {
                                  setState(() {
                                    _memberCon.comEmail.value = '';
                                    isValidateEmail = false;
                                  });
                                } else {
                                  setState(() {
                                    _memberCon.comEmail.value = value;
                                    isValidateEmail = true;
                                  });
                                }
                              },
                              onSave: (value) {
                                _memberCon.comEmail.value = value!;
                              },
                            ),
                            CustomTextFieldNew(
                              key: telegramKey,
                              isRequired: true,
                              isValidate: isValidateTelegram,
                              hintText: 'Telegram',
                              initialValue: _memberCon.comTelegram.value,
                              labelText: 'Telegram',
                              onChange: (value) {
                                if (value == '') {
                                  setState(() {
                                    _memberCon.comTelegram.value = '';
                                    isValidateTelegram = false;
                                  });
                                } else {
                                  setState(() {
                                    _memberCon.comTelegram.value = value;
                                    isValidateTelegram = true;
                                  });
                                }
                              },
                              onSave: (value) {
                                _memberCon.comTelegram.value = value!;
                              },
                            ),
                            CustomTextFieldNew(
                              key: whatAppKey,
                              hintText: 'WhatApp',
                              initialValue: _memberCon.comWhatapp.value,
                              labelText: 'WhatApp',
                              onChange: (value) {
                                if (value == '') {
                                  _memberCon.comWhatapp.value = '';
                                } else {
                                  _memberCon.comWhatapp.value = value;
                                }
                              },
                            ),
                            CustomTextFieldNew(
                              key: skypeKey,
                              hintText: 'Skype',
                              initialValue: _memberCon.comSkype.value,
                              labelText: 'Skype',
                              onChange: (value) {
                                if (value == '') {
                                  _memberCon.comSkype.value = '';
                                } else {
                                  _memberCon.comSkype.value = value;
                                }
                              },
                            ),
                            CustomTextFieldNew(
                              key: messengerKey,
                              hintText: 'Messager',
                              initialValue: _memberCon.comMessenger.value,
                              labelText: 'Messager',
                              onChange: (value) {
                                if (value == '') {
                                  _memberCon.comMessenger.value = '';
                                } else {
                                  _memberCon.comMessenger.value = value;
                                }
                              },
                            ),
                          ]),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Location',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                            Container()
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                                color: Colors.black12),
                          ], color: Colors.white),
                          child: Column(children: [
                            CustomTextFieldNew(
                              key: houseNoKey,
                              hintText: 'House No',
                              initialValue: _memberCon.comhouseno.value,
                              labelText: 'House No',
                              onChange: (value) {
                                if (value == '') {
                                  _memberCon.comhouseno.value = '';
                                } else {
                                  _memberCon.comhouseno.value = value;
                                }
                              },
                            ),
                            CustomTextFieldNew(
                              key: streetNoKey,
                              hintText: 'Street No',
                              initialValue: _memberCon.comstreetno.value,
                              labelText: 'Street No',
                              onChange: (value) {
                                if (value == '') {
                                  _memberCon.comstreetno.value = '';
                                } else {
                                  _memberCon.comstreetno.value = value;
                                }
                              },
                            ),
                            CustomTextFieldNew(
                              key: addressKey,
                              hintText: 'Address',
                              initialValue: _memberCon.comaddress.value,
                              labelText: 'Address',
                              onChange: (value) {
                                if (value == '') {
                                  _memberCon.comaddress.value = '';
                                } else {
                                  _memberCon.comaddress.value = value;
                                }
                              },
                            ),
                          ]),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Social Link Information',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ),
                            Container()
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          padding: const EdgeInsets.only(
                            top: 10.0,
                          ),
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                                blurRadius: 4,
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                                color: Colors.black12),
                          ], color: Colors.white),
                          child: Column(children: [
                            CustomTextFieldNew(
                              key: websiteKey,
                              hintText: 'Website',
                              initialValue: _memberCon.comWebsite.value,
                              labelText: 'Website',
                              onChange: (value) {
                                if (value == '') {
                                  _memberCon.comWebsite.value = '';
                                } else {
                                  _memberCon.comWebsite.value = value;
                                }
                              },
                            ),
                            CustomTextFieldNew(
                              key: facebookKey,
                              hintText: 'Facebook',
                              initialValue: _memberCon.comFacebook.value,
                              labelText: 'Facebook',
                              onChange: (value) {
                                if (value == '') {
                                  _memberCon.comFacebook.value = '';
                                } else {
                                  _memberCon.comFacebook.value = value;
                                }
                              },
                            ),
                            CustomTextFieldNew(
                              key: linkInKey,
                              hintText: 'Linkedin',
                              initialValue: _memberCon.comLinkedin.value,
                              labelText: 'Linkedin',
                              onChange: (value) {
                                if (value == '') {
                                  _memberCon.comLinkedin.value = '';
                                } else {
                                  _memberCon.comLinkedin.value = value;
                                }
                              },
                            ),
                            CustomTextFieldNew(
                              key: tweeterKey,
                              hintText: 'Twitter',
                              initialValue: _memberCon.comTwitter.value,
                              labelText: 'Twitter',
                              onChange: (value) {
                                if (value == '') {
                                  _memberCon.comTwitter.value = '';
                                } else {
                                  _memberCon.comTwitter.value = value;
                                }
                              },
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: BorderDirectional(
                    top: BorderSide(
                        color: Colors.grey,
                        width: 0.2,
                        style: BorderStyle.solid),
                  ),
                  color: Colors.white),
              child: Row(children: [
                Expanded(
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                        left: 15.0, top: 20.0, bottom: 25.0),
                    child: (CustomButton(
                      title: "Cancel",
                      isOutline: true,
                      isDisable: false,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                        right: 15.0, top: 20.0, bottom: 25.0),
                    child: CustomButton(
                      title: "Submit",
                      isOutline: false,
                      isDisable: false,
                      onPressed: _memberCon.isSelectTap.value == false
                          ? () async {
                              setState(() {
                                formkey.currentState!.save();
                              });
                              if (isValidate()) {
                                if (_memberCon.isSelectTap.value == false) {
                                  _memberCon.isSelectTap.value = true;
                                  if (isNotNul()) {
                                    Timer(const Duration(seconds: 1), () {
                                      Navigator.pop(context, true);
                                    });
                                  }
                                  if (isNotNul()) {
                                    await _memberCon.onSubmitCompany(context);
                                  }
                                }
                                _memberCon.isSelectTap.value = false;
                                onRefresh();
                                isUpdate = true;
                              }
                            }
                          : null,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
