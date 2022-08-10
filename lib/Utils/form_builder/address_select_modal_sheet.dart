import 'dart:core';
import 'package:cicgreenloan/modules/member_directory/models/member_personal_profile.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/utils/select_address/address_model/address.dart';
import 'package:cicgreenloan/utils/select_address/address_model/full_address_model.dart';
import 'package:cicgreenloan/utils/select_address/select_address_controller.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_chips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<FullAddress?> onShowModalSheet({
  BuildContext? context,
  List<Address>? provinceList,
  List<Address>? districtList,
  List<Address>? communeList,
  List<Address>? villageList,
  List<Address>? selectAddress,
  Function? onSelectProvince,
  Function? onSelectDistrict,
  Function? onSelectCommune,
  Function? onSelectVillage,
  Function? onCancel,
  Function? onDelete,
  int? gridIndex,
  String? streetNo,
  String? houseNo,
  CurrentAddress? currentAddress,
  CurrentAddress? permanentAddress,
  bool? isLoading,
}) async {
  final reqCon = Get.put(RequestLoanController());
  int? provinceIndex;
  int? districtIndex;
  int? communeIndex;
  int? villageIndex;

  FullAddress? currentfullAddress;
  final formKey = GlobalKey<FormState>();

  await CupertinoScaffold.showCupertinoModalBottomSheet(
      context: context!,
      isDismissible: false,
      enableDrag: false,
      useRootNavigator: false,
      builder: (context) {
        return Listener(
            onPointerDown: (PointerDownEvent event) =>
                FocusScope.of(context).unfocus(),
            child: StatefulBuilder(
              builder: (context, setMyState) {
                List<Widget> gridList = [
                  Obx(
                    () => reqCon.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            shrinkWrap: true,
                            itemCount: provinceList!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 4 / 1.3),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  onSelectProvince!(provinceList[index]);
                                  setMyState(() {
                                    provinceIndex = index;
                                    // districtList.clear();
                                    // onFetchDistrict()
                                  });
                                },
                                child: CustomChips(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  title: provinceList[index]
                                      .name!
                                      .replaceAll('Province', ''),
                                  currentIndex: index,
                                  selectIndex: provinceIndex,
                                ),
                              );
                            },
                          ),
                  ),
                  Obx(
                    () => reqCon.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            shrinkWrap: true,
                            itemCount: districtList!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 4 / 1.3),
                            itemBuilder: (context, index) {
                              return districtList.isNotEmpty
                                  ? GestureDetector(
                                      onTap: () {
                                        onSelectDistrict!(districtList[index]);
                                        setMyState(() {
                                          districtIndex = index;
                                          // communeList.clear();
                                          // reqCon.getCommune(
                                          //     reqCon.districtList[index].code, 'en');

                                          // if (!reqCon.currentAddressList
                                          //     .contains(reqCon.districtList[index])) {
                                          //   reqCon.currentAddressList
                                          //       .add(reqCon.districtList[index]);
                                          // }
                                        });
                                      },
                                      child: CustomChips(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 15),
                                        title: districtList[index].name,
                                        currentIndex: index,
                                        selectIndex: districtIndex,
                                      ),
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    );
                            },
                          ),
                  ),
                  Obx(
                    () => reqCon.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            shrinkWrap: true,
                            itemCount: communeList!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 4 / 1.3),
                            itemBuilder: (context, index) {
                              return communeList.isNotEmpty
                                  ? GestureDetector(
                                      onTap: () {
                                        onSelectCommune!(communeList[index]);
                                        setMyState(() {
                                          communeIndex = index;
                                          // reqCon.villageList.clear();
                                          // reqCon.getVillage(
                                          //     reqCon.communeList[index].code, 'en');

                                          // if (!reqCon.currentAddressList
                                          //     .contains(reqCon.communeList[index])) {
                                          //   reqCon.currentAddressList
                                          //       .add(reqCon.communeList[index]);
                                          // }
                                        });
                                      },
                                      child: CustomChips(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 15),
                                        title: communeList[index].name,
                                        currentIndex: index,
                                        selectIndex: communeIndex,
                                      ),
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    );
                            },
                          ),
                  ),
                  Obx(
                    () => reqCon.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            shrinkWrap: true,
                            itemCount: villageList!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 4 / 1.3),
                            itemBuilder: (context, index) {
                              return villageList.isNotEmpty
                                  ? GestureDetector(
                                      onTap: () {
                                        onSelectVillage!(villageList[index]);
                                        setMyState(() {
                                          villageIndex = index;
                                        });
                                      },
                                      child: CustomChips(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 15),
                                        title: villageList[index].name,
                                        currentIndex: index,
                                        selectIndex: villageIndex,
                                      ),
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator(),
                                    );
                            },
                          ),
                  ),
                ];
                return Material(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: double.infinity,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          bottom: 80,
                          left: 0,
                          right: 0,
                          top: 0,
                          child: SingleChildScrollView(
                            child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomTextFieldNew(
                                    isRequired: true,
                                    // initialValue: streetNo != null ? '' : streetNo,
                                    initialValue: streetNo ?? "",
                                    hintText: 'Enter street no',
                                    labelText: 'Street No',
                                    onSave: (value) {
                                      streetNo = value;
                                    },
                                    onChange: (value) {
                                      if (value.isEmpty) {
                                        setMyState(() {
                                          streetNo = '';
                                        });
                                      } else {
                                        setMyState(() {
                                          streetNo = value;
                                        });
                                      }
                                    },
                                  ),
                                  CustomTextFieldNew(
                                    isRequired: true,
                                    // initialValue: houseNo != null ? '' : houseNo,
                                    initialValue: houseNo ?? "",
                                    hintText: 'Enter house no',
                                    labelText: 'House No',
                                    onSave: (value) {
                                      houseNo = value;
                                    },
                                    onChange: (value) {
                                      if (value.isEmpty) {
                                        setMyState(() {
                                          houseNo = '';
                                        });
                                      } else {
                                        setMyState(() {
                                          houseNo = value;
                                        });
                                      }
                                    },
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Text(
                                      'Location',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'DMSans'),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Wrap(
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      children: selectAddress!
                                          .asMap()
                                          .entries
                                          .map(
                                            (e) => Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10, bottom: 10),
                                              child: InputChip(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  showCheckmark: false,
                                                  deleteIcon:
                                                      const Icon(Icons.cancel),
                                                  labelPadding:
                                                      const EdgeInsets.all(5),
                                                  onPressed: () {},
                                                  selectedColor:
                                                      const Color(0xffB3C6E0),
                                                  selected: true,
                                                  labelStyle: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  deleteIconColor:
                                                      Theme.of(context)
                                                          .primaryColor,
                                                  onDeleted: e.key !=
                                                          selectAddress.length -
                                                              1
                                                      ? null
                                                      : () {
                                                          setMyState(() {
                                                            selectAddress
                                                                .remove(
                                                                    e.value);
                                                            if (e.key == 2) {
                                                              setMyState(() {
                                                                villageIndex =
                                                                    -1;
                                                              });
                                                            }
                                                            if (e.key == 1) {
                                                              setMyState(() {
                                                                communeIndex =
                                                                    -1;
                                                              });
                                                            }
                                                            if (e.key == 0) {
                                                              setMyState(() {
                                                                districtIndex =
                                                                    -1;
                                                                provinceIndex =
                                                                    -1;
                                                              });
                                                            }
                                                          });
                                                          if (e.key != 0) {
                                                            onDelete!(
                                                                selectAddress[
                                                                    e.key - 1]);
                                                          }
                                                        },
                                                  label: Text(
                                                    e.value.name!.replaceAll(
                                                        'Province', ''),
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                  )),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  selectAddress.length <= 3
                                      ? gridList.elementAt(selectAddress.length)
                                      : gridList.elementAt(3),
                                  // gridList.elementAt(1)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 20,
                          right: 20,
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  isDisable: false,
                                  isOutline: true,
                                  onPressed: () {
                                    if (selectAddress.isNotEmpty) {
                                      showCupertinoDialog(
                                          context: context,
                                          builder: (context) {
                                            return CupertinoAlertDialog(
                                              content: const Text(
                                                  'Changes made to this page haven’t been saved yet.'),
                                              title: const Text(
                                                  'Are you sure you want to leave this page?'),
                                              actions: [
                                                CupertinoButton(
                                                    child: const Text('Yes'),
                                                    onPressed: () {
                                                      onCancel!();
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    }),
                                                CupertinoButton(
                                                  child: const Text('No'),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                )
                                              ],
                                            );
                                          });
                                    } else {
                                      Navigator.pop(context, null);
                                    }
                                  },
                                  title: 'Cancel',
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: CustomButton(
                                  isDisable: selectAddress.length > 3 &&
                                          houseNo != "" &&
                                          streetNo != ""
                                      ? false
                                      : true,
                                  isOutline: false,
                                  onPressed: () {
                                    // _formKey.currentState!.save();
                                    setMyState(() {
                                      currentfullAddress = FullAddress(
                                          streetNo: streetNo,
                                          houseNo: houseNo,
                                          addressList: selectAddress);
                                    });

                                    Navigator.pop(context, currentfullAddress);
                                  },
                                  title: 'Apply',
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ));
      });
  return currentfullAddress;
}
