import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';

import 'package:cicgreenloan/modules/member_directory/models/member_personal_profile.dart';
import 'package:cicgreenloan/utils/form_builder/address_select_modal_sheet.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_form_card.dart';
import 'package:cicgreenloan/utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/utils/pop_up_alert/comfirm_alert.dart';
import 'package:cicgreenloan/utils/select_address/address_model/address.dart';
import 'package:cicgreenloan/utils/select_address/select_address_controller.dart';
import 'package:cicgreenloan/widgets/get_funding/address_picker.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_chips.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ContectInfoPopUp extends StatefulWidget {
  final int? id;
  final bool? isEdiable;
  const ContectInfoPopUp({Key? key, this.isEdiable, this.id}) : super(key: key);
  @override
  State<ContectInfoPopUp> createState() => _ContectInfoPopUpState();
}

class _ContectInfoPopUpState extends State<ContectInfoPopUp> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final _memberCon = Get.put(MemberController());
  final _userProfile = Get.put(CustomerController());
  final reqCon = Get.put(RequestLoanController());

  List addressOption = ['Yes', 'No'];
  CurrentAddress? _permanentAddress;
  CurrentAddress? _currentAddress;
  String? _currentHouse;
  String? _currentStreet;
  String? _permanentHouse;
  String? _permanentStreet;
  int? selectedAddressOption;
  Future<void> onRefresh() async {
    await _userProfile.getUser();
    if (widget.id != null) {
      await _memberCon.fetchMemberPersonProfile(widget.id!);
    }
  }

  @override
  void initState() {
    super.initState();
    selectedAddressOption = reqCon.selectedAddressOption.value;
    _currentAddress = _memberCon.personalProfile.value.currentAddress;
    _currentHouse = _memberCon.personalProfile.value.houseNo;
    _currentStreet = _memberCon.personalProfile.value.streetNo;
    _permanentAddress = _memberCon.personalProfile.value.permanentAddress;
    _permanentHouse = _memberCon.personalProfile.value.permanentHouseNo;
    _permanentStreet = _memberCon.personalProfile.value.permanentStreetNo;
  }

  void resetDataBasicInfo() {
    _memberCon.personalProfile.value.currentAddress = _currentAddress;
    _memberCon.personalProfile.value.streetNo = _currentStreet!;
    _memberCon.personalProfile.value.houseNo = _currentHouse!;
    _memberCon.personalProfile.value.permanentAddress = _permanentAddress;
    _memberCon.personalProfile.value.permanentHouseNo = _permanentHouse;
    _memberCon.personalProfile.value.permanentStreetNo = _permanentStreet;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
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
                            hintText: 'Enter Email Address',
                            initialValue:
                                '${_memberCon.personalProfile.value.email}',
                            labelText: 'Enter Email Address',
                            onChange: (value) {
                              if (value == '') {
                                _memberCon.gmail.value =
                                    _memberCon.personalProfile.value.email!;
                              } else {
                                setState(() {
                                  _memberCon.gmail.value = value;
                                });
                              }
                            },
                          ),
                          CustomTextFieldNew(
                            hintText: 'Enter Telegram Name',
                            initialValue:
                                '${_memberCon.personalProfile.value.telegram}',
                            labelText: 'Enter Telegram Name',
                            onChange: (value) {
                              if (value == '') {
                                setState(() {
                                  _memberCon.telegram.value = _memberCon
                                      .personalProfile.value.telegram!;
                                });
                              } else {
                                setState(() {
                                  _memberCon.telegram.value = value;
                                });
                              }
                            },
                          ),
                          CustomTextFieldNew(
                            hintText: 'Enter WhatApp Name',
                            initialValue:
                                '${_memberCon.personalProfile.value.whatapp}',
                            labelText: 'Enter WhatApp Name',
                            onChange: (value) {
                              if (value == '') {
                                setState(() {
                                  _memberCon.whatApp.value =
                                      _memberCon.personalProfile.value.whatapp!;
                                });
                              } else {
                                setState(() {
                                  _memberCon.whatApp.value = value;
                                });
                              }
                            },
                          ),
                          CustomTextFieldNew(
                            hintText: 'Enter Skype Name',
                            initialValue:
                                '${_memberCon.personalProfile.value.skype}',
                            labelText: 'Enter Skype Name',
                            onChange: (value) {
                              if (value == '') {
                                setState(() {
                                  _memberCon.skype.value =
                                      _memberCon.personalProfile.value.skype!;
                                });
                              } else {
                                setState(() {
                                  _memberCon.skype.value = value;
                                });
                              }
                            },
                          ),
                          CustomTextFieldNew(
                            hintText: 'Enter Messenger Name',
                            initialValue:
                                '${_memberCon.personalProfile.value.messenger}',
                            labelText: 'Enter Messenger Name',
                            onChange: (value) {
                              if (value == '') {
                                setState(() {
                                  _memberCon.messenger.value = _memberCon
                                      .personalProfile.value.messenger!;
                                });
                              } else {
                                setState(() {
                                  _memberCon.messenger.value = value;
                                });
                              }
                            },
                          ),
                          CustomFormCard(
                            child: Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      'Is current address the same permanent address?',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                        children: addressOption
                                            .asMap()
                                            .entries
                                            .map((e) {
                                      return GestureDetector(
                                        onTap: () {
                                          if (reqCon.selectedAddressOption
                                                  .value !=
                                              e.key) {
                                            reqCon.selectedAddressOption.value =
                                                e.key;
                                            setState(() {});
                                          } else {
                                            reqCon.selectedAddressOption.value =
                                                1;
                                            setState(() {});
                                          }
                                        },
                                        child: CustomChips(
                                          margin:
                                              const EdgeInsets.only(right: 20),
                                          title: e.value,
                                          currentIndex: e.key,
                                          selectIndex: reqCon
                                              .selectedAddressOption.value,
                                        ),
                                      );
                                    }).toList()),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  AddressPickerWidget(
                                    isValidate:
                                        _memberCon.isValidateFullAddress.value,
                                    onTap: () async {
                                      // initial current address
                                      if (_memberCon.personalProfile.value
                                              .currentAddress!.city!.name ==
                                          "") {
                                        reqCon.getProvince("en");
                                      } else {
                                        if (_memberCon.personalProfile.value
                                                .currentAddress!.city!.name !=
                                            "") {
                                          reqCon.currentAddressList.clear();
                                          reqCon.getProvince("en");

                                          reqCon.currentAddressList.add(
                                              _memberCon.personalProfile.value
                                                  .currentAddress!.city!);
                                          reqCon.getDistrict(
                                              _memberCon.personalProfile.value
                                                  .currentAddress!.city!.code!,
                                              'en');
                                        }
                                        if (_memberCon
                                                .personalProfile
                                                .value
                                                .currentAddress!
                                                .district!
                                                .name !=
                                            "") {
                                          reqCon.currentAddressList.add(
                                              _memberCon.personalProfile.value
                                                  .currentAddress!.district!);
                                          reqCon.getCommune(
                                              _memberCon
                                                  .personalProfile
                                                  .value
                                                  .currentAddress!
                                                  .district!
                                                  .code!,
                                              'en');
                                        }
                                        if (_memberCon
                                                .personalProfile
                                                .value
                                                .currentAddress!
                                                .commune!
                                                .name !=
                                            "") {
                                          reqCon.currentAddressList.add(
                                              _memberCon.personalProfile.value
                                                  .currentAddress!.commune!);

                                          reqCon.getVillage(
                                              _memberCon
                                                  .personalProfile
                                                  .value
                                                  .currentAddress!
                                                  .commune!
                                                  .code!,
                                              'en');
                                        }
                                        if (_memberCon
                                                .personalProfile
                                                .value
                                                .currentAddress!
                                                .village!
                                                .name !=
                                            "") {
                                          reqCon.currentAddressList.add(
                                              _memberCon.personalProfile.value
                                                  .currentAddress!.village!);
                                        }
                                      }

                                      _memberCon.fullCurrentAddress.value =
                                          (await onShowModalSheet(
                                        currentAddress: _memberCon
                                            .personalProfile
                                            .value
                                            .currentAddress,
                                        context: context,
                                        streetNo: _memberCon
                                            .personalProfile.value.streetNo,
                                        houseNo: _memberCon
                                            .personalProfile.value.houseNo,
                                        onCancel: () {
                                          reqCon.currentAddressList.clear();
                                          // Navigator.pop(context);
                                        },
                                        selectAddress:
                                            reqCon.currentAddressList,
                                        onSelectProvince: (Address province) {
                                          reqCon.districtList.clear();
                                          reqCon.getDistrict(
                                              province.code!, 'en');
                                          if (!reqCon.currentAddressList
                                              .contains(province)) {
                                            reqCon.currentAddressList
                                                .add(province);
                                          }
                                        },
                                        onSelectCommune: (Address commune) {
                                          reqCon.villageList.clear();
                                          reqCon.getVillage(
                                              commune.code!, 'en');
                                          if (!reqCon.currentAddressList
                                              .contains(commune)) {
                                            reqCon.currentAddressList
                                                .add(commune);
                                          }
                                        },
                                        onSelectDistrict: (Address disctrict) {
                                          reqCon.communeList.clear();
                                          reqCon.getCommune(
                                              disctrict.code!, 'en');
                                          if (!reqCon.currentAddressList
                                              .contains(disctrict)) {
                                            reqCon.currentAddressList
                                                .add(disctrict);
                                          }
                                        },
                                        onSelectVillage: (Address village) {
                                          if (reqCon
                                                  .currentAddressList.length !=
                                              4) {
                                            if (!reqCon.currentAddressList
                                                .contains(village)) {
                                              reqCon.currentAddressList
                                                  .add(village);
                                            }
                                          } else {
                                            reqCon.currentAddressList[3] =
                                                village;
                                          }
                                        },
                                        onDelete: (Address address) {
                                          if (address.code!.length == 6) {
                                            reqCon.villageList.clear();
                                            reqCon.getVillage(
                                                address.code!, 'en');
                                          } else if (address.code!.length ==
                                              4) {
                                            reqCon.communeList.clear();
                                            reqCon.getCommune(
                                                address.code!, 'en');
                                          } else {
                                            reqCon.districtList.clear();
                                            reqCon.getDistrict(
                                                address.code!, 'en');
                                          }
                                        },
                                        communeList: reqCon.communeList,
                                        provinceList: reqCon.provinceList,
                                        villageList: reqCon.villageList,
                                        districtList: reqCon.districtList,
                                      ))!;
                                      if (_memberCon.personalProfile.value
                                              .currentAddress !=
                                          null) {
                                        _memberCon.isValidateFullAddress.value =
                                            true;
                                      }
                                      _memberCon.personalProfile.value.houseNo =
                                          _memberCon
                                              .fullCurrentAddress.value.houseNo;
                                      _memberCon
                                              .personalProfile.value.streetNo =
                                          _memberCon.fullCurrentAddress.value
                                              .streetNo;
                                      _memberCon.personalProfile.value
                                          .currentAddress = CurrentAddress();
                                      _memberCon.personalProfile.value.currentAddress =
                                          CurrentAddress(
                                              city: _memberCon
                                                  .fullCurrentAddress
                                                  .value
                                                  .addressList![0],
                                              district: _memberCon
                                                  .fullCurrentAddress
                                                  .value
                                                  .addressList![1],
                                              commune: _memberCon
                                                  .fullCurrentAddress
                                                  .value
                                                  .addressList![2],
                                              village: _memberCon
                                                          .fullCurrentAddress
                                                          .value
                                                          .addressList!
                                                          .length ==
                                                      3
                                                  ? Address(name: "", code: "")
                                                  : _memberCon
                                                      .fullCurrentAddress
                                                      .value
                                                      .addressList![3]);
                                      setState(() {});
                                    },
                                    selectAddress: _memberCon
                                                .personalProfile
                                                .value
                                                .currentAddress!
                                                .city!
                                                .name !=
                                            ""
                                        ? _memberCon
                                                    .personalProfile
                                                    .value
                                                    .currentAddress!
                                                    .village!
                                                    .name ==
                                                ""
                                            ? '${_memberCon.personalProfile.value.streetNo} ${_memberCon.personalProfile.value.houseNo} ${_memberCon.personalProfile.value.currentAddress!.city!.name} ${_memberCon.personalProfile.value.currentAddress!.district!.name} ${_memberCon.personalProfile.value.currentAddress!.commune!.name}'
                                            : '${_memberCon.personalProfile.value.streetNo} ${_memberCon.personalProfile.value.houseNo} ${_memberCon.personalProfile.value.currentAddress!.city!.name} ${_memberCon.personalProfile.value.currentAddress!.district!.name} ${_memberCon.personalProfile.value.currentAddress!.commune!.name}  ${_memberCon.personalProfile.value.currentAddress!.village!.name}'
                                        : null,
                                    title: 'Select Current Address',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  if (reqCon.selectedAddressOption.value == 1)
                                    AddressPickerWidget(
                                      isValidate: _memberCon
                                          .isValidatePermenantAddress.value,
                                      onTap: () async {
                                        reqCon.residentAddressList.clear();
                                        if (_memberCon.personalProfile.value
                                                .permanentAddress ==
                                            null) {
                                          reqCon.getProvince("en");
                                        } else {
                                          reqCon.getProvince("en");
                                          if (_memberCon
                                                  .personalProfile
                                                  .value
                                                  .permanentAddress!
                                                  .city!
                                                  .name !=
                                              '') {
                                            reqCon.residentAddressList.add(
                                                _memberCon.personalProfile.value
                                                    .permanentAddress!.city!);
                                            reqCon.getDistrict(
                                                _memberCon
                                                    .personalProfile
                                                    .value
                                                    .permanentAddress!
                                                    .city!
                                                    .code!,
                                                'en');
                                          }
                                          if (_memberCon
                                                  .personalProfile
                                                  .value
                                                  .permanentAddress!
                                                  .district!
                                                  .name !=
                                              '') {
                                            reqCon.residentAddressList.add(
                                                _memberCon
                                                    .personalProfile
                                                    .value
                                                    .permanentAddress!
                                                    .district!);
                                            reqCon.getCommune(
                                                _memberCon
                                                    .personalProfile
                                                    .value
                                                    .permanentAddress!
                                                    .district!
                                                    .code!,
                                                'en');
                                          }
                                          if (_memberCon
                                                  .personalProfile
                                                  .value
                                                  .permanentAddress!
                                                  .commune!
                                                  .name !=
                                              '') {
                                            reqCon.residentAddressList.add(
                                                _memberCon
                                                    .personalProfile
                                                    .value
                                                    .permanentAddress!
                                                    .commune!);

                                            reqCon.getVillage(
                                                _memberCon
                                                    .personalProfile
                                                    .value
                                                    .permanentAddress!
                                                    .commune!
                                                    .code!,
                                                'en');
                                          }
                                          if (_memberCon
                                                  .personalProfile
                                                  .value
                                                  .permanentAddress!
                                                  .village!
                                                  .name !=
                                              '') {
                                            reqCon.residentAddressList.add(
                                                _memberCon
                                                    .personalProfile
                                                    .value
                                                    .permanentAddress!
                                                    .village!);
                                          }
                                        }

                                        _memberCon.fullResidentAddress.value =
                                            (await onShowModalSheet(
                                          context: context,
                                          onCancel: () {
                                            reqCon.residentAddressList.clear();
                                          },
                                          onDelete: (Address address) {
                                            if (address.code!.length == 6) {
                                              reqCon.villageList.clear();
                                              reqCon.getVillage(
                                                  address.code!, 'en');
                                            } else if (address.code!.length ==
                                                4) {
                                              reqCon.communeList.clear();
                                              reqCon.getCommune(
                                                  address.code!, 'en');
                                            } else {
                                              reqCon.districtList.clear();
                                              reqCon.getDistrict(
                                                  address.code!, 'en');
                                            }
                                          },
                                          streetNo: _memberCon
                                                  .fullResidentAddress
                                                  .value
                                                  .streetNo ??
                                              _memberCon.personalProfile.value
                                                  .streetNo,
                                          houseNo: _memberCon
                                                  .fullResidentAddress
                                                  .value
                                                  .houseNo ??
                                              _memberCon.personalProfile.value
                                                  .houseNo,
                                          selectAddress:
                                              reqCon.residentAddressList,
                                          onSelectProvince: (Address province) {
                                            reqCon.districtList.clear();
                                            reqCon.getDistrict(
                                                province.code!, 'en');
                                            if (!reqCon.residentAddressList
                                                .contains(province)) {
                                              reqCon.residentAddressList
                                                  .add(province);
                                            }
                                          },
                                          onSelectCommune: (Address commune) {
                                            reqCon.villageList.clear();
                                            reqCon.getVillage(
                                                commune.code!, 'en');
                                            if (!reqCon.residentAddressList
                                                .contains(commune)) {
                                              reqCon.residentAddressList
                                                  .add(commune);
                                            }
                                          },
                                          onSelectDistrict:
                                              (Address disctrict) {
                                            reqCon.communeList.clear();
                                            reqCon.getCommune(
                                                disctrict.code!, 'en');
                                            if (!reqCon.residentAddressList
                                                .contains(disctrict)) {
                                              reqCon.residentAddressList
                                                  .add(disctrict);
                                            }
                                          },
                                          onSelectVillage: (Address village) {
                                            if (reqCon.residentAddressList
                                                    .length !=
                                                4) {
                                              if (!reqCon.residentAddressList
                                                  .contains(village)) {
                                                reqCon.residentAddressList
                                                    .add(village);
                                              }
                                            } else {
                                              reqCon.residentAddressList[3] =
                                                  village;
                                            }
                                          },
                                          communeList: reqCon.communeList,
                                          provinceList: reqCon.provinceList,
                                          villageList: reqCon.villageList,
                                          districtList: reqCon.districtList,
                                        ))!;
                                        if (_memberCon.fullResidentAddress.value
                                            .addressList!.isNotEmpty) {
                                          reqCon.isValidateResidentProvince
                                              .value = true;
                                        }
                                        if (_memberCon.fullResidentAddress.value
                                                .addressList !=
                                            null) {
                                          _memberCon.isValidatePermenantAddress
                                              .value = true;
                                        }
                                        _memberCon.personalProfile.value
                                                .permanentHouseNo =
                                            _memberCon.fullResidentAddress.value
                                                .houseNo;
                                        _memberCon.personalProfile.value
                                                .permanentStreetNo =
                                            _memberCon.fullResidentAddress.value
                                                .streetNo;
                                        _memberCon.personalProfile.value
                                                .permanentAddress =
                                            CurrentAddress();
                                        _memberCon.personalProfile.value.permanentAddress = _memberCon.fullResidentAddress.value.addressList!.length == 3
                                            ? CurrentAddress(
                                                city: _memberCon
                                                    .fullResidentAddress
                                                    .value
                                                    .addressList![0],
                                                district: _memberCon
                                                    .fullResidentAddress
                                                    .value
                                                    .addressList![1],
                                                commune: _memberCon
                                                    .fullResidentAddress
                                                    .value
                                                    .addressList![2],
                                                village:
                                                    Address(code: "", name: ""))
                                            : CurrentAddress(
                                                city: _memberCon.fullResidentAddress.value.addressList![0],
                                                district: _memberCon.fullResidentAddress.value.addressList![1],
                                                commune: _memberCon.fullResidentAddress.value.addressList![2],
                                                village: _memberCon.fullResidentAddress.value.addressList![3]);
                                        setState(() {});
                                      },
                                      selectAddress: _memberCon
                                                  .personalProfile
                                                  .value
                                                  .permanentAddress!
                                                  .city!
                                                  .name !=
                                              ""
                                          ? _memberCon
                                                      .personalProfile
                                                      .value
                                                      .permanentAddress!
                                                      .village!
                                                      .name ==
                                                  ""
                                              ? '${_memberCon.personalProfile.value.permanentStreetNo} ${_memberCon.personalProfile.value.permanentHouseNo} ${_memberCon.personalProfile.value.permanentAddress!.city!.name} ${_memberCon.personalProfile.value.permanentAddress!.district!.name} ${_memberCon.personalProfile.value.permanentAddress!.commune!.name} '
                                              : '${_memberCon.personalProfile.value.permanentStreetNo} ${_memberCon.personalProfile.value.permanentHouseNo} ${_memberCon.personalProfile.value.permanentAddress!.city!.name} ${_memberCon.personalProfile.value.permanentAddress!.district!.name} ${_memberCon.personalProfile.value.permanentAddress!.commune!.name} ${_memberCon.personalProfile.value.permanentAddress!.village!.name}'
                                          : null,
                                      title: 'Select Permanent Address',
                                    ),
                                ],
                              ),
                            ),
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
                      margin: const EdgeInsets.only(
                          left: 15.0, top: 20.0, bottom: 25.0),
                      child: (CustomButton(
                        title: "Cancel",
                        isOutline: true,
                        isDisable: false,
                        onPressed: _memberCon.gmail.value == "" &&
                                _memberCon.telegram.value == "" &&
                                _memberCon.whatApp.value == "" &&
                                _memberCon.skype.value == "" &&
                                _memberCon.messenger.value == "" &&
                                reqCon.selectedAddressOption.value ==
                                    selectedAddressOption &&
                                _currentAddress ==
                                    _memberCon
                                        .personalProfile.value.currentAddress &&
                                _currentStreet ==
                                    _memberCon.personalProfile.value.streetNo &&
                                _currentHouse ==
                                    _memberCon.personalProfile.value.houseNo &&
                                _permanentAddress ==
                                    _memberCon.personalProfile.value
                                        .permanentAddress &&
                                _permanentStreet ==
                                    _memberCon.personalProfile.value
                                        .permanentStreetNo &&
                                _permanentHouse ==
                                    _memberCon
                                        .personalProfile.value.permanentHouseNo
                            ? () {
                                Navigator.pop(context);
                              }
                            : () {
                                onShowConfirmAlert(
                                    context: context,
                                    title: 'Confirmation',
                                    content: 'Are you sure, You want to cancel',
                                    onPressed: () {
                                      resetDataBasicInfo();
                                      Navigator.pop(context);
                                      Navigator.pop(context);
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
                      child: CustomButton(
                        title: "Update",
                        isOutline: false,
                        isDisable: _memberCon.gmail.value == "" &&
                                _memberCon.telegram.value == "" &&
                                _memberCon.whatApp.value == "" &&
                                _memberCon.skype.value == "" &&
                                _memberCon.messenger.value == "" &&
                                reqCon.selectedAddressOption.value ==
                                    selectedAddressOption &&
                                _currentAddress ==
                                    _memberCon
                                        .personalProfile.value.currentAddress &&
                                _currentStreet ==
                                    _memberCon.personalProfile.value.streetNo &&
                                _currentHouse ==
                                    _memberCon.personalProfile.value.houseNo &&
                                _permanentAddress ==
                                    _memberCon.personalProfile.value
                                        .permanentAddress &&
                                _permanentStreet ==
                                    _memberCon.personalProfile.value
                                        .permanentStreetNo &&
                                _permanentHouse ==
                                    _memberCon
                                        .personalProfile.value.permanentHouseNo
                            ? true
                            : false,
                        onPressed: _memberCon.gmail.value == "" &&
                                _memberCon.telegram.value == "" &&
                                _memberCon.whatApp.value == "" &&
                                _memberCon.skype.value == "" &&
                                _memberCon.messenger.value == "" &&
                                reqCon.selectedAddressOption.value ==
                                    selectedAddressOption &&
                                _currentAddress ==
                                    _memberCon
                                        .personalProfile.value.currentAddress &&
                                _currentStreet ==
                                    _memberCon.personalProfile.value.streetNo &&
                                _currentHouse ==
                                    _memberCon.personalProfile.value.houseNo &&
                                _permanentAddress ==
                                    _memberCon.personalProfile.value
                                        .permanentAddress &&
                                _permanentStreet ==
                                    _memberCon.personalProfile.value
                                        .permanentStreetNo &&
                                _permanentHouse ==
                                    _memberCon
                                        .personalProfile.value.permanentHouseNo
                            ? null
                            : () {
                                setState(() {
                                  _memberCon.updatePersonalProfile(context);
                                  formkey.currentState!.save();
                                  _memberCon
                                      .fetchMemberPersonProfile(widget.id!);
                                  _userProfile.getUser();
                                });

                                onRefresh();
                                Navigator.pop(context);
                              },
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
