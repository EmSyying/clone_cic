import 'dart:async';

import 'package:cicgreenloan/Utils/helper/custom_loading_button.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/Utils/pop_up_alert/comfirm_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyProductServicePopUP extends StatefulWidget {
  final Member? member;
  final int? companyid;

  const CompanyProductServicePopUP({
    Key? key,
    this.member,
    this.companyid,
  }) : super(key: key);
  @override
  State<CompanyProductServicePopUP> createState() =>
      _CompanyProductServicePopUPState();
}

class _CompanyProductServicePopUPState
    extends State<CompanyProductServicePopUP> {
  final _memberCon = Get.put(MemberController());
  final customerController = Get.put(CustomerController());
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

  TextEditingController productserviceController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController khmernameController = TextEditingController();

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFieldNew(
                      initialValue:
                          _memberCon.comcompanyproductandservice.value,
                      hintText: 'Product and Service',
                      labelText: 'Product and Service',
                      onChange: (value) {
                        setState(() {
                          if (value == '') {
                            _memberCon.comcompanyproductandservice.value = '';
                          } else {
                            _memberCon.comcompanyproductandservice.value =
                                value;
                            productserviceController.text = value;
                          }
                        });
                      },
                    ),
                    CustomTextFieldNew(
                      hintText: 'Khmer Name',
                      initialValue: _memberCon.comKhmerName.value,
                      labelText: 'Khmer Name',
                      onChange: (value) {
                        setState(() {
                          if (value == '') {
                            _memberCon.comKhmerName.value = '';
                          } else {
                            _memberCon.comKhmerName.value = value;
                          }
                          khmernameController.text = value;
                        });
                      },
                    ),
                    CustomTextFieldNew(
                      hintText: 'Postion',
                      initialValue: _memberCon.comPositions.value,
                      labelText: 'Postion',
                      onChange: (value) {
                        setState(() {
                          if (value == '') {
                            _memberCon.comPositions.value = '';
                          } else {
                            _memberCon.comPositions.value = value;
                          }
                          positionController.text = value;
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
                  onPressed: productserviceController.text == "" &&
                          khmernameController.text == "" &&
                          positionController.text == ""
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
                        isDisable: productserviceController.text == "" &&
                                khmernameController.text == "" &&
                                positionController.text == ""
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
    );
  }
}
