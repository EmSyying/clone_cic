import 'package:cicgreenloan/utils/select_address/select_address_controller.dart';
import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/modules/member_directory/models/member_personal_profile.dart';
import 'package:cicgreenloan/Utils/form_builder/address_select_modal_sheet.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_form_card.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/select_address/address_model/address.dart';
import 'package:cicgreenloan/utils/select_address/address_model/full_address_model.dart';
import 'package:cicgreenloan/widgets/get_funding/address_picker.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_chips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class OnEditAddress extends StatefulWidget {
  final FullAddress? fullAddress;
  final FullAddress? permanetAddress;
  const OnEditAddress({
    Key? key,
    this.fullAddress,
    this.permanetAddress,
  }) : super(key: key);

  @override
  State<OnEditAddress> createState() => _OnEditAddressState();
}

class _OnEditAddressState extends State<OnEditAddress> {
  List addressOption = ['Yes', 'No'];
  final reqCon = Get.put(RequestLoanController());
  final DebtInvestmentController debtCon = Get.put(DebtInvestmentController());

  @override
  void initState() {
    super.initState();
    debtCon.selectAddIndex.value = reqCon.selectedAddressOption.value;
  }

  // Function eq = const ListEquality().equals;
  // bool onCheckDisablebutton() {
  //   return eq(debtCon.currentAddress.value, debtCon.fullCurrentAddress.value) &&
  //       eq(debtCon.residentAddress.value, debtCon.fullResidentAddress.value);
  // }
  String? isCurrentAddres;

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: CustomFormCard(
            child: Obx(
              () => Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Is current address the same permanent address?',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                              children: addressOption.asMap().entries.map((e) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isCurrentAddres = e.value;
                                  if (reqCon.selectedAddressOption.value !=
                                      e.key) {
                                    reqCon.selectedAddressOption.value = e.key;
                                  } else {
                                    reqCon.selectedAddressOption.value = 1;
                                  }
                                });
                              },
                              child: CustomChips(
                                margin: const EdgeInsets.only(right: 20),
                                title: e.value,
                                currentIndex: e.key,
                                selectIndex: reqCon.selectedAddressOption.value,
                              ),
                            );
                          }).toList()),
                        ),
                        const SizedBox(height: 10),
                        AddressPickerWidget(
                          isValidate: debtCon.isValidateFullAddress.value,
                          onTap: () async {
                            if (widget.fullAddress!.addressList![0].name ==
                                "") {
                              reqCon.getProvince("en");
                            } else {
                              if (widget.fullAddress!.addressList![0].name !=
                                  "") {
                                reqCon.currentAddressList.value = [];
                                reqCon.getProvince("en");

                                reqCon.currentAddressList
                                    .add(widget.fullAddress!.addressList![0]);
                                reqCon.getDistrict(
                                    widget.fullAddress!.addressList![0].code!,
                                    'en');
                              }

                              if (widget.fullAddress!.addressList![1].code! !=
                                  "") {
                                reqCon.currentAddressList
                                    .add(widget.fullAddress!.addressList![1]);
                                reqCon.getCommune(
                                    widget.fullAddress!.addressList![1].code!,
                                    'en');
                              }
                              if (debtCon.fullCurrentAddress.value
                                      .addressList![2].code !=
                                  "") {
                                reqCon.currentAddressList
                                    .add(widget.fullAddress!.addressList![2]);

                                reqCon.getVillage(
                                    widget.fullAddress!.addressList![2].code!,
                                    'en');
                              }
                              if (widget.fullAddress!.addressList![3].code !=
                                  "") {
                                reqCon.currentAddressList
                                    .add(widget.fullAddress!.addressList![3]);
                              }
                            }
                            debtCon.currentAddress.value =
                                (await onShowModalSheet(
                              currentAddress: CurrentAddress(
                                city: widget.fullAddress!.addressList![0],
                                commune: widget.fullAddress!.addressList![1],
                                district: widget.fullAddress!.addressList![2],
                                village: widget.fullAddress!.addressList![3],
                              ),
                              context: context,
                              streetNo: widget.fullAddress!.streetNo,
                              houseNo: widget.fullAddress!.houseNo,
                              onCancel: () {
                                reqCon.currentAddressList.clear();
                              },
                              selectAddress: reqCon.currentAddressList,
                              onSelectProvince: (Address province) {
                                reqCon.districtList.clear();
                                reqCon.getDistrict(province.code!, 'en');
                                if (!reqCon.currentAddressList
                                    .contains(province)) {
                                  reqCon.currentAddressList.add(province);
                                }
                              },
                              onSelectCommune: (Address commune) {
                                reqCon.villageList.clear();
                                reqCon.getVillage(commune.code!, 'en');
                                if (!reqCon.currentAddressList
                                    .contains(commune)) {
                                  reqCon.currentAddressList.add(commune);
                                }
                              },
                              onSelectDistrict: (Address disctrict) {
                                reqCon.communeList.clear();
                                reqCon.getCommune(disctrict.code!, 'en');
                                if (!reqCon.currentAddressList
                                    .contains(disctrict)) {
                                  reqCon.currentAddressList.add(disctrict);
                                }
                              },
                              onSelectVillage: (Address village) {
                                if (reqCon.currentAddressList.length != 4) {
                                  if (!reqCon.currentAddressList
                                      .contains(village)) {
                                    reqCon.currentAddressList.add(village);
                                  }
                                } else {
                                  reqCon.currentAddressList[3] = village;
                                }
                              },
                              onDelete: (Address address) {
                                if (address.code!.length == 6) {
                                  reqCon.villageList.clear();
                                  reqCon.getVillage(address.code!, 'en');
                                } else if (address.code!.length == 4) {
                                  reqCon.communeList.clear();
                                  reqCon.getCommune(address.code!, 'en');
                                } else {
                                  reqCon.districtList.clear();
                                  reqCon.getDistrict(address.code!, 'en');
                                }
                              },
                              communeList: reqCon.communeList,
                              provinceList: reqCon.provinceList,
                              villageList: reqCon.villageList,
                              districtList: reqCon.districtList,
                            ))!;
                            setState(() {
                              widget.fullAddress!.addressList![0] =
                                  debtCon.currentAddress.value.addressList![0];
                              widget.fullAddress!.addressList![1] =
                                  debtCon.currentAddress.value.addressList![1];
                              widget.fullAddress!.addressList![2] =
                                  debtCon.currentAddress.value.addressList![2];
                              widget.fullAddress!.addressList![3] = debtCon
                                          .currentAddress
                                          .value
                                          .addressList![3]
                                          .name !=
                                      null
                                  ? debtCon.currentAddress.value.addressList![3]
                                  : Address();
                              widget.fullAddress!.streetNo =
                                  debtCon.currentAddress.value.streetNo;
                              widget.fullAddress!.houseNo =
                                  debtCon.currentAddress.value.houseNo;
                            });

                            if (widget.fullAddress!.addressList != null) {
                              debtCon.isValidateFullAddress.value = true;
                            }
                          },
                          selectAddress: widget
                                      .fullAddress!.addressList![0].name !=
                                  ""
                              ? widget.fullAddress!.addressList![3].name == ""
                                  ? '${widget.fullAddress!.streetNo != "" ? "${widget.fullAddress!.streetNo}, " : ""}${widget.fullAddress!.houseNo != "" ? "${widget.fullAddress!.houseNo}, " : ""}${widget.fullAddress!.addressList![0].name}, ${widget.fullAddress!.addressList![1].name}, ${widget.fullAddress!.addressList![2].name}'
                                  : '${widget.fullAddress!.streetNo != "" ? "${widget.fullAddress!.streetNo}, " : ""}${widget.fullAddress!.houseNo != "" ? "${widget.fullAddress!.houseNo}, " : ""}${widget.fullAddress!.addressList![0].name}, ${widget.fullAddress!.addressList![1].name}, ${widget.fullAddress!.addressList![2].name}, ${widget.fullAddress!.addressList![3].name}'
                              : null,
                          title: 'Select Current Address',
                        ),
                        const SizedBox(height: 10),
                        if (reqCon.selectedAddressOption.value == 1)
                          AddressPickerWidget(
                            isValidate:
                                debtCon.isValidatePermenantAddress.value,
                            onTap: () async {
                              reqCon.residentAddressList.clear();
                              if (widget
                                      .permanetAddress!.addressList![0].name ==
                                  "") {
                                reqCon.getProvince("en");
                              } else {
                                if (widget.permanetAddress!.addressList![0]
                                        .name !=
                                    "") {
                                  reqCon.residentAddressList.value = [];
                                  reqCon.getProvince("en");

                                  reqCon.residentAddressList.add(
                                      widget.permanetAddress!.addressList![0]);
                                  reqCon.getDistrict(
                                      widget.permanetAddress!.addressList![0]
                                          .code!,
                                      'en');
                                }

                                if (widget.permanetAddress!.addressList![1]
                                        .name !=
                                    "") {
                                  reqCon.residentAddressList.add(
                                      widget.permanetAddress!.addressList![1]);
                                  reqCon.getCommune(
                                      widget.permanetAddress!.addressList![1]
                                          .code!,
                                      'en');
                                }
                                if (widget.permanetAddress!.addressList![2]
                                        .name !=
                                    "") {
                                  reqCon.residentAddressList.add(
                                      widget.permanetAddress!.addressList![2]);

                                  reqCon.getVillage(
                                      widget.permanetAddress!.addressList![2]
                                          .code!,
                                      'en');
                                }
                                if (widget.permanetAddress!.addressList![3]
                                        .name !=
                                    "") {
                                  reqCon.residentAddressList.add(
                                      widget.permanetAddress!.addressList![3]);
                                }
                              }

                              debtCon.residentAddress.value =
                                  (await onShowModalSheet(
                                permanentAddress: CurrentAddress(
                                  city: widget.permanetAddress!.addressList![0],
                                  commune:
                                      widget.permanetAddress!.addressList![1],
                                  district:
                                      widget.permanetAddress!.addressList![2],
                                  village:
                                      widget.permanetAddress!.addressList![3],
                                ),
                                context: context,
                                streetNo: widget.permanetAddress!.streetNo,
                                houseNo: widget.permanetAddress!.houseNo,
                                onCancel: () {
                                  reqCon.residentAddressList.clear();
                                },
                                selectAddress: reqCon.residentAddressList,
                                onSelectProvince: (Address province) {
                                  reqCon.districtList.clear();
                                  reqCon.getDistrict(province.code!, 'en');
                                  if (!reqCon.residentAddressList
                                      .contains(province)) {
                                    reqCon.residentAddressList.add(province);
                                  }
                                },
                                onSelectCommune: (Address commune) {
                                  reqCon.villageList.clear();
                                  reqCon.getVillage(commune.code!, 'en');
                                  if (!reqCon.residentAddressList
                                      .contains(commune)) {
                                    reqCon.residentAddressList.add(commune);
                                  }
                                },
                                onSelectDistrict: (Address disctrict) {
                                  reqCon.communeList.clear();
                                  reqCon.getCommune(disctrict.code!, 'en');
                                  if (!reqCon.residentAddressList
                                      .contains(disctrict)) {
                                    reqCon.residentAddressList.add(disctrict);
                                  }
                                },
                                onSelectVillage: (Address village) {
                                  if (reqCon.residentAddressList.length != 4) {
                                    if (!reqCon.residentAddressList
                                        .contains(village)) {
                                      reqCon.residentAddressList.add(village);
                                    }
                                  } else {
                                    reqCon.residentAddressList[3] = village;
                                  }
                                },
                                onDelete: (Address address) {
                                  if (address.code!.length == 6) {
                                    reqCon.villageList.clear();
                                    reqCon.getVillage(address.code!, 'en');
                                  } else if (address.code!.length == 4) {
                                    reqCon.communeList.clear();
                                    reqCon.getCommune(address.code!, 'en');
                                  } else {
                                    reqCon.districtList.clear();
                                    reqCon.getDistrict(address.code!, 'en');
                                  }
                                  if (debtCon
                                          .currentAddress.value.addressList !=
                                      null) {}
                                },
                                communeList: reqCon.communeList,
                                provinceList: reqCon.provinceList,
                                villageList: reqCon.villageList,
                                districtList: reqCon.districtList,
                              ))!;

                              setState(() {
                                widget.permanetAddress!.addressList![0] =
                                    debtCon
                                        .residentAddress.value.addressList![0];
                                widget.permanetAddress!.addressList![1] =
                                    debtCon
                                        .residentAddress.value.addressList![1];
                                widget.permanetAddress!.addressList![2] =
                                    debtCon
                                        .residentAddress.value.addressList![2];
                                widget.permanetAddress!.addressList![3] =
                                    debtCon
                                        .residentAddress.value.addressList![3];
                                widget.permanetAddress!.streetNo =
                                    debtCon.residentAddress.value.streetNo;
                                widget.permanetAddress!.houseNo =
                                    debtCon.residentAddress.value.houseNo;
                              });
                            },
                            selectAddress: widget.permanetAddress!
                                        .addressList![0].name !=
                                    ""
                                ? widget.permanetAddress!.addressList![3]
                                            .name ==
                                        ""
                                    ? '${widget.permanetAddress!.streetNo != "" ? "${widget.permanetAddress!.streetNo}, " : ""}${widget.permanetAddress!.houseNo != "" ? "${widget.permanetAddress!.houseNo}, " : ""}${widget.permanetAddress!.addressList![0].name}, ${widget.permanetAddress!.addressList![1].name}, ${widget.permanetAddress!.addressList![2].name}'
                                    : '${widget.permanetAddress!.streetNo != "" ? "${widget.permanetAddress!.streetNo}, " : ""}${widget.permanetAddress!.houseNo != "" ? "${widget.permanetAddress!.houseNo}, " : ""}${widget.permanetAddress!.addressList![3].name}, ${widget.permanetAddress!.addressList![1].name}, ${widget.permanetAddress!.addressList![2].name}, ${widget.permanetAddress!.addressList![0].name}'
                                : null,
                            title: 'Select Permanent Address',
                          ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            isDisable: false,
                            isOutline: true,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            title: 'Close',
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: CustomButton(
                            isDisable: false,
                            isOutline: false,
                            onPressed: () {
                              if (isCurrentAddres == "Yes") {
                                debtCon.fullCurrentAddress.value
                                    .addressList![0] = Address(
                                  code:
                                      widget.fullAddress!.addressList![0].code,
                                  name:
                                      widget.fullAddress!.addressList![0].name,
                                );
                                debtCon.fullCurrentAddress.value
                                    .addressList![1] = Address(
                                  code:
                                      widget.fullAddress!.addressList![1].code,
                                  name:
                                      widget.fullAddress!.addressList![1].name,
                                );
                                debtCon.fullCurrentAddress.value
                                    .addressList![2] = Address(
                                  code:
                                      widget.fullAddress!.addressList![2].code,
                                  name:
                                      widget.fullAddress!.addressList![2].name,
                                );
                                debtCon.fullCurrentAddress.value
                                        .addressList![3] =
                                    widget.fullAddress!.addressList![3].name !=
                                            null
                                        ? Address(
                                            code: widget.fullAddress!
                                                .addressList![3].code,
                                            name: widget.fullAddress!
                                                .addressList![3].name,
                                          )
                                        : Address();
                                debtCon.fullResidentAddress.value
                                    .addressList![0] = Address(
                                  code:
                                      widget.fullAddress!.addressList![0].code,
                                  name:
                                      widget.fullAddress!.addressList![0].name,
                                );
                                debtCon.fullResidentAddress.value
                                    .addressList![1] = Address(
                                  code:
                                      widget.fullAddress!.addressList![1].code,
                                  name:
                                      widget.fullAddress!.addressList![1].name,
                                );
                                debtCon.fullResidentAddress.value
                                    .addressList![2] = Address(
                                  code:
                                      widget.fullAddress!.addressList![2].code,
                                  name:
                                      widget.fullAddress!.addressList![2].name,
                                );
                                debtCon.fullResidentAddress.value
                                        .addressList![3] =
                                    widget.fullAddress!.addressList![3].name !=
                                            null
                                        ? Address(
                                            code: widget.fullAddress!
                                                .addressList![3].code,
                                            name: widget.fullAddress!
                                                .addressList![3].name,
                                          )
                                        : Address();
                                debtCon.fullCurrentAddress.refresh();
                                debtCon.fullResidentAddress.refresh();
                                debtCon.update();
                                Navigator.pop(context);
                              } else {
                                debtCon.fullCurrentAddress.value
                                    .addressList![0] = Address(
                                  code:
                                      widget.fullAddress!.addressList![0].code,
                                  name:
                                      widget.fullAddress!.addressList![0].name,
                                );
                                debtCon.fullCurrentAddress.value
                                    .addressList![1] = Address(
                                  code:
                                      widget.fullAddress!.addressList![1].code,
                                  name:
                                      widget.fullAddress!.addressList![1].name,
                                );
                                debtCon.fullCurrentAddress.value
                                    .addressList![2] = Address(
                                  code:
                                      widget.fullAddress!.addressList![2].code,
                                  name:
                                      widget.fullAddress!.addressList![2].name,
                                );
                                debtCon.fullCurrentAddress.value
                                        .addressList![3] =
                                    widget.fullAddress!.addressList![3].name !=
                                            null
                                        ? Address(
                                            code: widget.fullAddress!
                                                .addressList![3].code,
                                            name: widget.fullAddress!
                                                .addressList![3].name,
                                          )
                                        : Address();

                                debtCon.fullResidentAddress.value
                                    .addressList![0] = Address(
                                  code: widget
                                      .permanetAddress!.addressList![0].code,
                                  name: widget
                                      .permanetAddress!.addressList![0].name,
                                );
                                debtCon.fullResidentAddress.value
                                    .addressList![1] = Address(
                                  code: widget
                                      .permanetAddress!.addressList![1].code,
                                  name: widget
                                      .permanetAddress!.addressList![1].name,
                                );
                                debtCon.fullResidentAddress.value
                                    .addressList![2] = Address(
                                  code: widget
                                      .permanetAddress!.addressList![2].code,
                                  name: widget
                                      .permanetAddress!.addressList![2].name,
                                );
                                debtCon.fullResidentAddress.value
                                    .addressList![3] = widget.permanetAddress!
                                            .addressList![3].name !=
                                        null
                                    ? Address(
                                        code: widget.permanetAddress!
                                            .addressList![3].code,
                                        name: widget.permanetAddress!
                                            .addressList![3].name,
                                      )
                                    : Address();
                                debtCon.fullCurrentAddress.value.houseNo =
                                    widget.fullAddress!.houseNo;
                                debtCon.fullCurrentAddress.value.streetNo =
                                    widget.fullAddress!.streetNo;
                                debtCon.fullResidentAddress.value.houseNo =
                                    widget.permanetAddress!.houseNo;
                                debtCon.fullResidentAddress.value.streetNo =
                                    widget.permanetAddress!.streetNo;
                                debtCon.fullCurrentAddress.refresh();
                                debtCon.fullResidentAddress.refresh();
                                debtCon.update();
                                Navigator.pop(context);
                              }
                            },
                            title: 'Save',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
