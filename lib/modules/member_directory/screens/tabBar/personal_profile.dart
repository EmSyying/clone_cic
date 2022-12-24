import 'dart:io';
import 'package:cicgreenloan/Utils/helper/address_format.dart';
import 'package:cicgreenloan/utils/function/get_sharepreference_data.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/utils/select_address/select_address_controller.dart';
import 'package:cicgreenloan/Utils/helper/option_model/gender.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/widgets/member_directory/basicinformation_card.dart';
import 'package:cicgreenloan/widgets/member_directory/contact_information_card.dart';
import 'package:cicgreenloan/widgets/member_directory/information_shimmer.dart';
import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:cicgreenloan/widgets/member_directory/personalProfile/basic_information_pop_up.dart';
import 'package:cicgreenloan/Utils/offline_widget.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:cicgreenloan/Utils/option_controller/option_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../widgets/member_directory/personalProfile/contactinfor_pop_up.dart';

class PersonalProfile extends StatefulWidget {
  final int? id;
  final bool? isEdiable;
  final bool? isHidenAddress;
  const PersonalProfile(
      {Key? key, this.id, this.isEdiable, this.isHidenAddress})
      : super(key: key);
  @override
  State<PersonalProfile> createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {
  final _memberCon = Get.put(MemberController());
  final _userProfile = Get.put(CustomerController());
  final reqCon = Get.put(RequestLoanController());
  final _optionForm = Get.put(DocumentCategory());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  List<GenderOption> genderList = [
    GenderOption(id: 79, display: 'Male'),
    GenderOption(id: 80, display: 'Female'),
  ];
  bool isSelectnational = false;
  String genderForm = 'Male';
  bool isHideAddress = false;

  DateTime? dateOfBirth;
  int selectedIndexGender = 0;

  void resetDataBasicInfo() {
    _memberCon.khmerName.value = "";
    _memberCon.fullName.value = "";
    _memberCon.customerDateOfBirth.value = "";
    _memberCon.gender.value.display = null;
    _memberCon.nationality.id = null;
    _memberCon.nationality.display = null;
  }

  void resetDataContectInfo() {
    _memberCon.gmail.value = "";
    _memberCon.telegram.value = "";
    _memberCon.whatApp.value = "";
    _memberCon.skype.value = "";
    _memberCon.messenger.value = "";
    reqCon.currentAddressList.clear();
  }

  @override
  void initState() {
    _optionForm.fetchDocumentCategory();
    _memberCon.fetchMemberPersonProfile(id: widget.id!);

    // if (_memberCon.personalProfilemember.value.hiddenFields!.length != 0) {
    //   _memberCon.member.value.hiddenFields!.map((e) {
    //     if (e.field == 'address') {
    //       setState(() {
    //         isHideAddress = true;
    //       });
    //     }
    //   }).toList();
    // }

    getHideAddress();

    super.initState();
  }

  getHideAddress() async {
    LocalData.getAddress('address').then((value) {
      setState(() {
        isHideAddress = value;
      });
    });
  }

  final refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<void> onRefresh() async {
    await _userProfile.getUser();
    if (widget.id != null) {
      await _memberCon.fetchMemberPersonProfile(id: widget.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConnectivityWidgetWrapper(
      stacked: false,
      alignment: Alignment.bottomCenter,
      offlineWidget: Column(
        children: const [
          SizedBox(
            height: 20,
          ),
          Expanded(child: OfflineWidget()),
        ],
      ),
      child: Obx(
        () => !_memberCon.isLoadingProfile.value
            ? Container(
                color: Theme.of(context).cardColor,
                child: RefreshIndicator(
                  key: refreshKey,
                  onRefresh: onRefresh,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 20),
                          child: _memberCon.isLoadingProfile.value
                              ? Shimmer.fromColors(
                                  baseColor: Colors.grey[100]!,
                                  highlightColor: Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: 20,
                                  ),
                                )
                              : Text('About',
                                  style: Theme.of(context).textTheme.headline2),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 10.0),
                          child: _memberCon.isLoadingProfile.value
                              ? Shimmer.fromColors(
                                  baseColor: Colors.grey[100]!,
                                  highlightColor: Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 50,
                                  ),
                                )
                              : _memberCon.personalProfile.value.about != ''
                                  ? ExpandableText(
                                      _memberCon.personalProfile.value.about!,
                                      maxLines: 4,
                                      linkColor: Colors.grey,
                                      expandText: 'show more',
                                      collapseText: 'show less',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400),
                                    )
                                  : Container(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          endIndent: 20,
                          indent: 20,
                        ),
                        _memberCon.isLoadingProfile.value
                            ? const InformationShimmer()
                            : BasicInformationCard(
                                isHide: false,
                                isEditable: widget.isEdiable,
                                onTap: () {
                                  resetDataBasicInfo();
                                  _memberCon.nationality.id = _memberCon
                                      .personalProfile
                                      .value
                                      .customerNationality!
                                      .id;
                                  _memberCon.nationality.display = _memberCon
                                      .personalProfile
                                      .value
                                      .customerNationality!
                                      .display;
                                  if (_memberCon.personalProfile.value
                                          .customerGender!.display!
                                          .toLowerCase() ==
                                      "male") {
                                    selectedIndexGender = 0;
                                  } else {
                                    selectedIndexGender = 1;
                                  }

                                  onShowCustomCupertinoModalSheet(
                                      title: 'Basic Information',
                                      isNoIcon: true,
                                      context: context,
                                      child: BasicInformationPopUP(
                                        isEdiable: widget.isEdiable,
                                        id: widget.id,
                                        genderindex: selectedIndexGender,
                                      ));
                                },
                                khmerName:
                                    _memberCon.personalProfile.value.name!,
                                fullName:
                                    _memberCon.personalProfile.value.name!,
                                dateOfBirth: _memberCon
                                    .personalProfile.value.customerDateOfBirth!,
                                gender: _memberCon.personalProfile.value
                                            .customerGender ==
                                        null
                                    ? ''
                                    : _memberCon.personalProfile.value
                                        .customerGender!.display!,
                                nationality: _memberCon.personalProfile.value
                                            .customerNationality ==
                                        null
                                    ? ''
                                    : _memberCon.personalProfile.value
                                        .customerNationality!.display!,
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          endIndent: 20,
                          indent: 20,
                        ),
                        _memberCon.isLoadingProfile.value
                            ? const InformationShimmer()
                            : ContactInformationCard(
                                isEditable: widget.isEdiable,
                                onTap: () {
                                  resetDataContectInfo();
                                  onShowCustomCupertinoModalSheet(
                                    title: 'Contact Information',
                                    // isScrollControlled: true,
                                    isNoIcon: true,
                                    context: context,
                                    child: ContectInfoPopUp(
                                      id: widget.id,
                                      isEdiable: widget.isEdiable,
                                    ),
                                  );
                                },
                                phone:
                                    '${_memberCon.personalProfile.value.phone}',
                                email:
                                    '${_memberCon.personalProfile.value.email}',
                                telegram:
                                    '${_memberCon.personalProfile.value.telegram}',
                                whatspp:
                                    '${_memberCon.personalProfile.value.whatapp}',
                                skype:
                                    '${_memberCon.personalProfile.value.skype}',
                                messenger:
                                    '${_memberCon.personalProfile.value.messenger}',
                                isHide: false,
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        _memberCon.isLoadingProfile.value
                            ? Shimmer.fromColors(
                                baseColor: Colors.grey[100]!,
                                highlightColor: Colors.white,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 20.0, top: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: 20,
                                ),
                              )
                            : !isHideAddress &&
                                    _memberCon.personalProfile.value
                                            .currentAddress!.city!.name !=
                                        null &&
                                    _memberCon.personalProfile.value
                                            .currentAddress!.district!.name !=
                                        null &&
                                    _memberCon.personalProfile.value
                                            .currentAddress!.commune!.name !=
                                        null &&
                                    _memberCon.personalProfile.value
                                            .currentAddress!.village!.name !=
                                        null &&
                                    AddressUtil.addressFullFormat([
                                          _memberCon
                                              .personalProfile.value.houseNo,
                                          _memberCon
                                              .personalProfile.value.streetNo,
                                          _memberCon.personalProfile.value
                                              .currentAddress!.city!.name,
                                          _memberCon.personalProfile.value
                                              .currentAddress!.district!.name,
                                          _memberCon.personalProfile.value
                                              .currentAddress!.commune!.name,
                                          _memberCon.personalProfile.value
                                              .currentAddress!.village!.name
                                        ]) !=
                                        ''
                                ? MemberDisplayInfo(
                                    isMultipleLine: true,
                                    label: 'Current Address:',
                                    value: AddressUtil.addressFullFormat([
                                      _memberCon.personalProfile.value.houseNo,
                                      _memberCon.personalProfile.value.streetNo,
                                      _memberCon.personalProfile.value
                                          .currentAddress!.city!.name,
                                      _memberCon.personalProfile.value
                                          .currentAddress!.district!.name,
                                      _memberCon.personalProfile.value
                                          .currentAddress!.commune!.name,
                                      _memberCon.personalProfile.value
                                          .currentAddress!.village!.name
                                    ])

                                    // '${_memberCon.personalProfile.value.houseNo} ,${_memberCon.personalProfile.value.streetNo} ,${_memberCon.personalProfile.value.currentAddress!.city!.name}, ${_memberCon.personalProfile.value.currentAddress!.district!.name}, ${_memberCon.personalProfile.value.currentAddress!.commune!.name}, ${_memberCon.personalProfile.value.currentAddress!.village!.name}',
                                    )
                                : Container(),
                        _memberCon.isLoadingProfile.value
                            ? Shimmer.fromColors(
                                baseColor: Colors.grey[100]!,
                                highlightColor: Colors.white,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 20.0, top: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: 20,
                                ),
                              )
                            : !isHideAddress &&
                                    _memberCon.personalProfile.value
                                            .permanentAddress!.city!.name !=
                                        null &&
                                    _memberCon.personalProfile.value
                                            .permanentAddress!.district!.name !=
                                        null &&
                                    _memberCon.personalProfile.value
                                            .permanentAddress!.commune!.name !=
                                        null &&
                                    _memberCon.personalProfile.value
                                            .permanentAddress!.village!.name !=
                                        null &&
                                    AddressUtil.addressFullFormat([
                                          _memberCon.personalProfile.value
                                              .permanentHouseNo,
                                          _memberCon.personalProfile.value
                                              .permanentStreetNo,
                                          _memberCon.personalProfile.value
                                              .permanentAddress!.city!.name,
                                          _memberCon.personalProfile.value
                                              .permanentAddress!.district!.name,
                                          _memberCon.personalProfile.value
                                              .permanentAddress!.commune!.name,
                                          _memberCon.personalProfile.value
                                              .permanentAddress!.village!.name
                                        ]) !=
                                        ''
                                ? MemberDisplayInfo(
                                    isMultipleLine: true,
                                    label: 'Permenent Address:',
                                    value: AddressUtil.addressFullFormat([
                                      _memberCon.personalProfile.value
                                          .permanentHouseNo,
                                      _memberCon.personalProfile.value
                                          .permanentStreetNo,
                                      _memberCon.personalProfile.value
                                          .permanentAddress!.city!.name,
                                      _memberCon.personalProfile.value
                                          .permanentAddress!.district!.name,
                                      _memberCon.personalProfile.value
                                          .permanentAddress!.commune!.name,
                                      _memberCon.personalProfile.value
                                          .permanentAddress!.village!.name
                                    ])

                                    // '${_memberCon.personalProfile.value.permanentHouseNo}, ${_memberCon.personalProfile.value.permanentStreetNo}, ${_memberCon.personalProfile.value.permanentAddress!.city!.name}, ${_memberCon.personalProfile.value.permanentAddress!.district!.name}, ${_memberCon.personalProfile.value.permanentAddress!.commune!.name}, ${_memberCon.personalProfile.value.permanentAddress!.village!.name}',
                                    )
                                : Container(),
                        if (widget.isEdiable != null && widget.isEdiable!)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                const Text(
                                  'Hide Address',
                                  style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                kIsWeb
                                    ? Switch(
                                        onChanged: (value) async {
                                          await LocalData.hideAddress(
                                              'address', value);
                                          await LocalData.getAddress('address')
                                              .then((value) {
                                            setState(() {
                                              setState(() {
                                                isHideAddress = value;
                                              });
                                            });
                                          });
                                          if (isHideAddress) {
                                            _memberCon.submitHiden(
                                                memberId: widget.id,
                                                pages: 'user',
                                                field: 'address',
                                                active: 1);
                                          } else {
                                            _memberCon.submitHiden(
                                                memberId: widget.id,
                                                pages: 'user',
                                                field: 'address',
                                                active: 0);
                                          }
                                        },
                                        value: isHideAddress,
                                      )
                                    : Platform.isAndroid
                                        ? Switch(
                                            onChanged: (value) async {
                                              await LocalData.hideAddress(
                                                  'address', value);
                                              await LocalData.getAddress(
                                                      'address')
                                                  .then((value) {
                                                setState(() {
                                                  setState(() {
                                                    isHideAddress = value;
                                                  });
                                                });
                                              });
                                              if (isHideAddress) {
                                                _memberCon.submitHiden(
                                                    memberId: widget.id,
                                                    pages: 'user',
                                                    field: 'address',
                                                    active: 1);
                                              } else {
                                                _memberCon.submitHiden(
                                                    memberId: widget.id,
                                                    pages: 'user',
                                                    field: 'address',
                                                    active: 0);
                                              }
                                            },
                                            value: isHideAddress,
                                          )
                                        : CupertinoSwitch(
                                            value: isHideAddress,
                                            onChanged: (value) async {
                                              await LocalData.hideAddress(
                                                  'address', value);
                                              await LocalData.getAddress(
                                                      'address')
                                                  .then((value) {
                                                setState(() {
                                                  setState(() {
                                                    isHideAddress = value;
                                                  });
                                                });
                                              });
                                              if (isHideAddress) {
                                                _memberCon.submitHiden(
                                                    memberId: widget.id,
                                                    pages: 'user',
                                                    field: 'address',
                                                    active: 1);
                                              } else {
                                                _memberCon.submitHiden(
                                                    memberId: widget.id,
                                                    pages: 'user',
                                                    field: 'address',
                                                    active: 0);
                                              }
                                            })
                              ],
                            ),
                          ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (context, index) {
                  return const InformationShimmer();
                },
                itemCount: 15,
              ),
      ),
    );
  }
}
