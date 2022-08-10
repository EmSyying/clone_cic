import 'dart:async';

import 'package:cicgreenloan/Utils/helper/custom_loading_button.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/utils/select_address/select_address_controller.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/comfirm_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialLinkInformation extends StatefulWidget {
  final Member? member;
  final int? companyid;
  const SocialLinkInformation({Key? key, this.companyid, this.member})
      : super(key: key);
  @override
  State<SocialLinkInformation> createState() => _SocialLinkInformationState();
}

class _SocialLinkInformationState extends State<SocialLinkInformation> {
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

  TextEditingController websiteController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController linkinController = TextEditingController();
  TextEditingController twitterController = TextEditingController();

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
                          hintText: 'website',
                          initialValue: _memberCon.comWebsite.value,
                          labelText: 'website',
                          onChange: (value) {
                            setState(() {
                              if (value == '') {
                                _memberCon.comWebsite.value = '';
                              } else {
                                _memberCon.comWebsite.value = value;
                              }
                              websiteController.text = value;
                            });
                          },
                        ),
                        CustomTextFieldNew(
                          hintText: 'facebook',
                          initialValue: _memberCon.comFacebook.value,
                          labelText: 'facebook',
                          onChange: (value) {
                            setState(() {
                              if (value == '') {
                                _memberCon.comFacebook.value = '';
                              } else {
                                _memberCon.comFacebook.value = value;
                              }
                              facebookController.text = value;
                            });
                          },
                        ),
                        CustomTextFieldNew(
                          hintText: 'Linkedin',
                          initialValue: _memberCon.comLinkedin.value,
                          labelText: 'Linkedin',
                          onChange: (value) {
                            setState(() {
                              if (value == '') {
                                _memberCon.comLinkedin.value = '';
                              } else {
                                _memberCon.comLinkedin.value = value;
                              }
                              linkinController.text = value;
                            });
                          },
                        ),
                        CustomTextFieldNew(
                          hintText: 'twitter',
                          initialValue: _memberCon.comTwitter.value,
                          labelText: 'twitter',
                          onChange: (value) {
                            setState(() {
                              if (value == '') {
                                _memberCon.comTwitter.value = '';
                              } else {
                                _memberCon.comTwitter.value = value;
                              }
                              twitterController.text = value;
                            });
                          },
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
                  child: CustomButton(
                    title: "Cancel",
                    isOutline: true,
                    isDisable: false,
                    onPressed: websiteController.text == "" &&
                            facebookController.text == "" &&
                            linkinController.text == "" &&
                            twitterController.text == ""
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
                  ),
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
                          isDisable: websiteController.text == "" &&
                                  facebookController.text == "" &&
                                  linkinController.text == "" &&
                                  twitterController.text == ""
                              ? true
                              : false,
                          onPressed: _memberCon.isSelectTap.value == false
                              ? () async {
                                  if (_memberCon.isSelectTap.value == false) {
                                    _memberCon.isSelectTap.value = true;

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
