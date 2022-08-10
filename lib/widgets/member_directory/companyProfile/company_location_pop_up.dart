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

class CompanyLocationPopUp extends StatefulWidget {
  final Member? member;
  final int? companyid;
  const CompanyLocationPopUp({Key? key, this.companyid, this.member})
      : super(key: key);
  @override
  State<CompanyLocationPopUp> createState() => _CompanyLocationPopUpState();
}

class _CompanyLocationPopUpState extends State<CompanyLocationPopUp> {
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

  TextEditingController housenoController = TextEditingController();
  TextEditingController streetnoController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
                          hintText: 'House No',
                          initialValue: _memberCon.comhouseno.value,
                          labelText: 'House No',
                          onChange: (value) {
                            setState(() {
                              if (value == '') {
                                _memberCon.comhouseno.value = '';
                              } else {
                                housenoController.text = value;
                              }
                              _memberCon.comhouseno.value = value;
                            });
                          },
                        ),
                        CustomTextFieldNew(
                          hintText: 'Street No',
                          initialValue: _memberCon.comstreetno.value,
                          labelText: 'Street No',
                          onChange: (value) {
                            setState(() {
                              if (value == '') {
                                _memberCon.comstreetno.value = '';
                              } else {
                                streetnoController.text = value;
                              }
                              _memberCon.comstreetno.value = value;
                            });
                          },
                        ),
                        CustomTextFieldNew(
                          hintText: 'Address',
                          initialValue: _memberCon.comaddress.value,
                          labelText: 'Address',
                          onChange: (value) {
                            setState(() {
                              if (value == '') {
                                _memberCon.comaddress.value = '';
                              } else {
                                addressController.text = value;
                              }
                              _memberCon.comaddress.value = value;
                            });
                          },
                        ),
                        //      AddressPickerWidget(
                        //   //  key: residentAddKey,
                        //   onTap:
                        //       () async {
                        //     // print('outside');

                        //     if (_memberCon
                        //             .isButtonTapped
                        //             .value ==
                        //         false) {
                        //       print(
                        //           'inside');
                        //       _memberCon
                        //           .isButtonTapped
                        //           .value = true;
                        //       if (_memberCon
                        //               .personalProfile
                        //               .value
                        //               .currentAddress!
                        //               .city!
                        //               .code ==
                        //           '')
                        //         reqCon.getProvince(
                        //             'en');
                        //       else if (_memberCon.personalProfile.value.currentAddress!.city!.code !=
                        //               '' &&
                        //           _memberCon.personalProfile.value.currentAddress!.village!.code !=
                        //               '') {
                        //         reqCon.getProvince(
                        //             'en');
                        //         reqCon.getDistrict(
                        //             _memberCon
                        //                 .personalProfile
                        //                 .value
                        //                 .currentAddress!
                        //                 .city!
                        //                 .code!,
                        //             'en');
                        //         reqCon.getCommune(
                        //             _memberCon
                        //                 .personalProfile
                        //                 .value
                        //                 .currentAddress!
                        //                 .district!
                        //                 .code!,
                        //             'en');
                        //         reqCon.getVillage(
                        //             _memberCon
                        //                 .personalProfile
                        //                 .value
                        //                 .currentAddress!
                        //                 .commune!
                        //                 .code!,
                        //             'en');
                        //       }
                        //     }

                        //     await onShowModalBottomSheet(
                        //         city: _memberCon
                        //             .personalProfile
                        //             .value
                        //             .currentAddress!
                        //             .city,
                        //         commune: _memberCon
                        //             .personalProfile
                        //             .value
                        //             .currentAddress!
                        //             .commune,
                        //         village: _memberCon
                        //             .personalProfile
                        //             .value
                        //             .currentAddress!
                        //             .village,
                        //         district: _memberCon
                        //             .personalProfile
                        //             .value
                        //             .currentAddress!
                        //             .district,
                        //         context:
                        //             context,
                        //         street: _memberCon
                        //             .personalProfile
                        //             .value
                        //             .streetNo,
                        //         house: _memberCon
                        //             .personalProfile
                        //             .value
                        //             .houseNo,
                        //         onCancel:
                        //             () {
                        //           setState(
                        //               () {
                        //             reqCon
                        //                 .districtList
                        //                 .clear();
                        //             reqCon
                        //                 .communeList
                        //                 .clear();
                        //             reqCon
                        //                 .villageList
                        //                 .clear();
                        //             reqCon
                        //                 .currentAddressList
                        //                 .clear();
                        //           });
                        //           Navigator.pop(
                        //               context);
                        //           Navigator.pop(
                        //               context);
                        //         },
                        //         selectAddress: reqCon
                        //             .currentAddressList,
                        //         onSelectProvince: (Address
                        //             province) {
                        //           print(province
                        //               .name!);
                        //           setState(
                        //               () {
                        //             reqCon
                        //                 .districtList
                        //                 .clear();
                        //             reqCon.getDistrict(
                        //                 province.code!,
                        //                 'en');
                        //             if (!reqCon
                        //                 .currentAddressList
                        //                 .contains(province)) {
                        //               reqCon.currentAddressList.add(province);
                        //             }
                        //           });
                        //         },
                        //         onSelectCommune: (Address
                        //             commune) {
                        //           setState(
                        //               () {
                        //             reqCon
                        //                 .villageList
                        //                 .clear();
                        //             reqCon.getVillage(
                        //                 commune.code!,
                        //                 'en');
                        //             if (!reqCon
                        //                 .currentAddressList
                        //                 .contains(commune)) {
                        //               reqCon.currentAddressList.add(commune);
                        //             }
                        //           });
                        //         },
                        //         onSelectDistrict:
                        //             (Address
                        //                 disctrict) {
                        //           setState(
                        //               () {
                        //             reqCon
                        //                 .communeList
                        //                 .clear();
                        //             reqCon.getCommune(
                        //                 disctrict.code!,
                        //                 'en');
                        //             if (!reqCon
                        //                 .currentAddressList
                        //                 .contains(disctrict)) {
                        //               reqCon.currentAddressList.add(disctrict);
                        //             }
                        //           });
                        //         },
                        //         onSelectVillage:
                        //             (Address
                        //                 village) {
                        //           setState(
                        //               () {
                        //             if (reqCon.currentAddressList.length !=
                        //                 4) {
                        //               if (!reqCon.currentAddressList.contains(village)) {
                        //                 reqCon.currentAddressList.add(village);
                        //               }
                        //             } else {
                        //               reqCon.currentAddressList[3] =
                        //                   village;
                        //             }
                        //           });
                        //         },
                        //         communeList:
                        //             reqCon.communeList,
                        //         provinceList: reqCon.provinceList,
                        //         villageList: reqCon.villageList,
                        //         districtList: reqCon.districtList,
                        //         onSave: (street, house, listaddress) {
                        //           _memberCon
                        //               .currentStreet
                        //               .value = street;
                        //           _memberCon
                        //               .currentHours
                        //               .value = house;
                        //           _memberCon
                        //               .personalProfile
                        //               .value
                        //               .currentAddress!
                        //               .village = listaddress[3];
                        //           _memberCon
                        //               .personalProfile
                        //               .value
                        //               .currentAddress!
                        //               .city = listaddress[0];
                        //           _memberCon
                        //               .personalProfile
                        //               .value
                        //               .currentAddress!
                        //               .commune = listaddress[2];
                        //           _memberCon
                        //               .personalProfile
                        //               .value
                        //               .currentAddress!
                        //               .district = listaddress[1];
                        //           print(
                        //               'villgage : ${listaddress.length} : ${listaddress[0].name} : ${listaddress[1].name} : ${listaddress[2].name} : ${listaddress[3].name} ');
                        //           if (listaddress.length ==
                        //               1) {
                        //             _memberCon
                        //                 .currentAddress
                        //                 .value = listaddress[0].code!;
                        //           } else if (listaddress.length ==
                        //               2) {
                        //             _memberCon
                        //                 .currentAddress
                        //                 .value = listaddress[1].code!;
                        //           } else if (listaddress.length ==
                        //               3) {
                        //             _memberCon
                        //                 .currentAddress
                        //                 .value = listaddress[2].code!;
                        //           } else if (listaddress.length ==
                        //               4) {
                        //             _memberCon
                        //                 .currentAddress
                        //                 .value = listaddress[3].code!;
                        //           }
                        //         });

                        //     _memberCon
                        //         .isButtonTapped
                        //         .value = false;
                        //   },

                        //   title:
                        //       'Current Address',
                        // ),
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
                    onPressed: housenoController.text == "" &&
                            streetnoController.text == "" &&
                            addressController.text == ""
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
                          isDisable: housenoController.text == "" &&
                                  streetnoController.text == "" &&
                                  addressController.text == ""
                              ? true
                              : false,
                          onPressed: _memberCon.isSelectTap.value == false
                              ? () async {
                                  if (_memberCon.isSelectTap.value == false) {
                                    _memberCon.isSelectTap.value = true;

                                    await _memberCon.onUpdateCompany(
                                        context, widget.companyid!);
                                  }
                                  _memberCon.isSelectTap.value = false;
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
