import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/form_builder/custom_drop_down.dart';
import 'package:cicgreenloan/utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/utils/form_builder/dropdow_item.dart';
import 'package:cicgreenloan/utils/pop_up_alert/comfirm_alert.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_chips.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/option_model/gender.dart';
import '../../../Utils/option_controller/option_controller.dart';
import '../../../utils/select_address/select_address_controller.dart';

class BasicInformationPopUP extends StatefulWidget {
  final GestureDragEndCallback? onTap;
  final int? genderindex;
  final int? id;
  final bool? isEdiable;
  const BasicInformationPopUP(
      {Key? key, this.isEdiable, this.id, this.genderindex, this.onTap})
      : super(key: key);
  @override
  State<BasicInformationPopUP> createState() => _BasicInformationPopUPState();
}

class _BasicInformationPopUPState extends State<BasicInformationPopUP> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final _memberCon = Get.put(MemberController());
  final _userProfile = Get.put(CustomerController());
  final reqCon = Get.put(RequestLoanController());
  final _optionForm = Get.put(DocumentCategory());
  DateTime? dateOfBirth;
  int selectedIndexGender = 0;
  Future<void> onRefresh() async {
    await _userProfile.getUser();
    if (widget.id != null) {
      await _memberCon.fetchMemberPersonProfile(widget.id!);
    }
  }

  void resetDataBasicInfo() {
    _memberCon.khmerName.value = "";
    _memberCon.fullName.value = "";
    _memberCon.customerDateOfBirth.value = "";
    _memberCon.gender.value.display = null;
    _memberCon.nationality.id = null;
  }

  @override
  void initState() {
    selectedIndexGender = widget.genderindex!;
    resetDataBasicInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultSizeWeb(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                          hintText: 'Enter khmer name',
                          initialValue:
                              _memberCon.personalProfile.value.customerName!,
                          labelText: 'Enter khmer name',
                          onChange: (value) {
                            if (value == '') {
                              _memberCon.khmerName.value;
                            } else {
                              setState(() {
                                _memberCon.khmerName.value = value;
                              });
                            }
                          },
                        ),
                        CustomTextFieldNew(
                          hintText: 'Enter full name',
                          initialValue: _memberCon
                              .personalProfile.value.customerLatinName!,
                          labelText: 'Enter full name',
                          onChange: (value) {
                            if (value == '') {
                              _memberCon.fullName.value;
                            } else {
                              setState(() {
                                _memberCon.fullName.value = value;
                              });
                            }
                          },
                        ),
                        CICDropdown(
                          defaultValue: _memberCon.personalProfile.value
                                      .customerDateOfBirth !=
                                  ""
                              ? {
                                  "Code": '02',
                                  "Name":
                                      _memberCon.customerDateOfBirth.value != ""
                                          ? _memberCon.customerDateOfBirth.value
                                          : _memberCon.personalProfile.value
                                              .customerDateOfBirth!
                                              .toString()
                                }
                              : null,
                          isDateTimePicker: true,
                          onChange: (value) {
                            setState(() {
                              _memberCon.personalProfile.value
                                          .customerDateOfBirth !=
                                      null
                                  ? _memberCon.customerDateOfBirth.value =
                                      value['Name']
                                  : _memberCon.personalProfile.value
                                      .customerDateOfBirth!;
                            });
                          },
                          label: 'Date of birth',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Gender',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children:
                                _optionForm.genderList.asMap().entries.map((e) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _memberCon.gender.value = GenderOption(
                                        id: e.value.id,
                                        display: e.value.display!);
                                    selectedIndexGender = e.key;
                                    // print(
                                    //     'Select Gender: ${reqCon.gender.value.display}');
                                  });
                                },
                                child: CustomChips(
                                  margin: const EdgeInsets.only(right: 10),
                                  title: e.value.display,
                                  currentIndex: e.key,
                                  selectIndex: selectedIndexGender,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CICDropdown(
                          colors: Colors.white,
                          item:
                              _optionForm.nationalList.asMap().entries.map((e) {
                            return DropDownItem(
                              itemList: {
                                "Name": e.value.display!,
                                "Code": e.value.id
                              },
                            );
                          }).toList(),
                          onChange: (v) {
                            setState(() {
                              _memberCon.nationality.id = v["Code"];
                              _memberCon.nationality.display = v["Name"];
                            });
                          },
                          label: 'Field of Nationality',
                          defaultValue: _memberCon.nationality.display != ""
                              ? {
                                  "Code": _memberCon.nationality.id,
                                  "Name": _memberCon.nationality.display
                                }
                              : null,
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
                    margin: const EdgeInsets.only(
                        left: 15.0, top: 20.0, bottom: 25.0),
                    child: CustomButton(
                      title: "Cancel",
                      isOutline: true,
                      isDisable: false,
                      onPressed: _memberCon.khmerName.value == "" &&
                              _memberCon.fullName.value == "" &&
                              _memberCon.customerDateOfBirth.value == "" &&
                              _memberCon.nationality.id == null &&
                              _memberCon.gender.value.display == null
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
                                      resetDataBasicInfo();
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
                    child: CustomButton(
                      title: "Update",
                      isOutline: false,
                      isDisable: _memberCon.khmerName.value == "" &&
                              _memberCon.fullName.value == "" &&
                              _memberCon.customerDateOfBirth.value == "" &&
                              _memberCon.nationality.id == null &&
                              _memberCon.gender.value.display == null
                          ? true
                          : false,
                      onPressed: _memberCon.khmerName.value == "" &&
                              _memberCon.fullName.value == "" &&
                              _memberCon.customerDateOfBirth.value == "" &&
                              _memberCon.nationality.id == null &&
                              _memberCon.gender.value.display == null
                          ? null
                          : () {
                              setState(() {
                                _memberCon.updatePersonalProfile(context);
                                formkey.currentState!.save();
                                _memberCon.fetchMemberPersonProfile(widget.id!);
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
    );
  }
}
