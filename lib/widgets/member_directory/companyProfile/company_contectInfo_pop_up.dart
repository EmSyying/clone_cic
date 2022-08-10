import 'dart:async';
import 'package:cicgreenloan/Utils/helper/custom_loading_button.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/comfirm_alert.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyContectInfoPopUp extends StatefulWidget {
  final Member? member;
  final int? companyid;
  const CompanyContectInfoPopUp({Key? key, this.companyid, this.member})
      : super(key: key);
  @override
  State<CompanyContectInfoPopUp> createState() =>
      _CompanyContectInfoPopUpState();
}

class _CompanyContectInfoPopUpState extends State<CompanyContectInfoPopUp> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final _memberCon = Get.put(MemberController());
  final customerController = Get.put(CustomerController());
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telegramController = TextEditingController();
  TextEditingController whatappController = TextEditingController();
  TextEditingController skypeController = TextEditingController();
  TextEditingController messengerController = TextEditingController();
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
                    onPanDown: (_) {
                      // FocusScope.of(
                      //         context)
                      //     .requestFocus(
                      //         FocusNode());
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFieldNew(
                          hintText: 'Phone number',
                          initialValue: _memberCon.comphonenumber.value,
                          labelText: 'Phone number',
                          onChange: (value) {
                            setState(() {
                              if (value == '') {
                                _memberCon.comphonenumber.value = '';
                              } else {
                                _memberCon.comphonenumber.value = value;
                              }
                              phonenumberController.text = value;
                            });
                          },
                        ),
                        CustomTextFieldNew(
                          hintText: 'Email',
                          initialValue: _memberCon.comEmail.value,
                          labelText: 'Email',
                          onChange: (value) {
                            setState(() {
                              if (value == '') {
                                _memberCon.comEmail.value = '';
                              } else {
                                _memberCon.comEmail.value = value;
                              }
                              emailController.text = value;
                            });
                          },
                        ),
                        CustomTextFieldNew(
                          hintText: 'Telegram',
                          initialValue: _memberCon.comTelegram.value,
                          labelText: 'Telegram',
                          onChange: (value) {
                            setState(() {
                              if (value == '') {
                                _memberCon.comTelegram.value = '';
                              } else {
                                _memberCon.comTelegram.value = value;
                              }
                              telegramController.text = value;
                            });
                          },
                        ),
                        CustomTextFieldNew(
                          hintText: 'WhatApp',
                          initialValue: _memberCon.comWhatapp.value,
                          labelText: 'WhatApp',
                          onChange: (value) {
                            setState(() {
                              if (value == '') {
                                _memberCon.comWhatapp.value = '';
                              } else {
                                _memberCon.comWhatapp.value = value;
                              }
                              whatappController.text = value;
                            });
                          },
                        ),
                        CustomTextFieldNew(
                          hintText: 'Skype',
                          initialValue: _memberCon.comSkype.value,
                          labelText: 'Skype',
                          onChange: (value) {
                            setState(() {
                              if (value == '') {
                                _memberCon.comSkype.value = '';
                              } else {
                                _memberCon.comSkype.value = value;
                              }
                              skypeController.text = value;
                            });
                          },
                        ),
                        CustomTextFieldNew(
                          hintText: 'Messager',
                          initialValue: _memberCon.comMessenger.value,
                          labelText: 'Messager',
                          onChange: (value) {
                            setState(() {
                              if (value == '') {
                                _memberCon.comMessenger.value = '';
                              } else {
                                _memberCon.comMessenger.value = value;
                              }
                              messengerController.text = value;
                            });
                          },
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
            ),
            Row(children: [
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
                    onPressed: phonenumberController.text == "" &&
                            emailController.text == "" &&
                            telegramController.text == "" &&
                            whatappController.text == "" &&
                            skypeController.text == "" &&
                            messengerController.text == ""
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
                  margin: const EdgeInsets.only(
                      right: 15.0, top: 20.0, bottom: 25.0),
                  child: _memberCon.isLoading.value
                      ? const CustomLoadingButton()
                      : CustomButton(
                          title: "Update",
                          isOutline: false,
                          isDisable: phonenumberController.text == "" &&
                                  emailController.text == "" &&
                                  telegramController.text == "" &&
                                  whatappController.text == "" &&
                                  skypeController.text == "" &&
                                  messengerController.text == ""
                              ? true
                              : false,
                          onPressed: _memberCon.isSelectTap.value == false
                              ? () async {
                                  if (_memberCon.isSelectTap.value == false) {
                                    _memberCon.isSelectTap.value = true;

                                    // Timer(Duration(seconds: 1), () {
                                    //   Navigator.pop(context, true);
                                    //   // Navigator.pop(context, true);
                                    // });

                                    await _memberCon.onUpdateCompany(
                                        context, widget.companyid!);
                                    _memberCon.isSelectTap.value = false;
                                  }
                                  onRefresh();
                                }
                              : null,
                        ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
