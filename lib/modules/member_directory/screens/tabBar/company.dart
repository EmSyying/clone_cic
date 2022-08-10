import 'dart:async';
import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/widgets/member_directory/companyProfile/add_company_form_pop_up.dart';
import 'package:cicgreenloan/widgets/member_directory/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/helper/color.dart';
import '../../../../Utils/helper/firebase_analytics.dart';
import '../../../../widgets/member_directory/companyProfile/company_contectinfo_pop_up.dart';
import '../../../../widgets/member_directory/companyProfile/company_location_pop_up.dart';
import '../../../../widgets/member_directory/companyProfile/company_product_service_card.dart';
import '../../../../widgets/member_directory/companyProfile/company_product_service_pop_up.dart';
import '../../../../widgets/member_directory/companyProfile/company_profile_card.dart';
import '../../../../widgets/member_directory/companyProfile/company_profile_pop_up.dart';
import '../../../../widgets/member_directory/companyProfile/company_shimmer.dart';
import '../../../../widgets/member_directory/companyProfile/custom_dotted_border_botton.dart';
import '../../../../widgets/member_directory/companyProfile/social_link_info_pop_up.dart';
import '../../../../widgets/member_directory/company_contact_info.dart';
import '../../../../widgets/member_directory/company_location_info.dart';
import '../../../../widgets/member_directory/social_link.dart';

class CompanyPage extends StatefulWidget {
  // final bool isView;
  final bool? isHidenAddress;
  final int? id;
  final bool isEdiable;
  const CompanyPage({
    Key? key,
    this.id,
    this.isEdiable = false,
    this.isHidenAddress,
  }) : super(key: key);
  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  final _memberCon = Get.put(MemberController());
  bool isHideAddress = false;
  final scrollAbleKey = GlobalKey();

  Future<void> onRefresh() async {
    if (widget.isEdiable == true) {
      _memberCon.fetchCompanyMember();
      setState(() {
        isHideAddress = widget.isHidenAddress!;
      });
    } else {
      _memberCon.fetchCompanyMemberDetail(widget.id!);
      setState(() {
        isHideAddress = widget.isHidenAddress!;
      });
    }
    setState(() {
      isHideAddress = widget.isHidenAddress!;
    });
  }

  @override
  void initState() {
    _memberCon.isSelectTap.value = false;
    debugPrint("Member personal Profile id:${widget.isEdiable}");
    if (widget.isEdiable == true) {
      _memberCon.fetchCompanyMember();
      setState(() {
        isHideAddress = widget.isHidenAddress!;
      });
    } else {
      _memberCon.fetchCompanyMemberDetail(widget.id!);
      setState(() {
        isHideAddress = widget.isHidenAddress!;
      });
    }

    super.initState();
  }

  void setdata(e) {
    _memberCon.comCompanyLogoString.value = e.value.companyLogo!;
    _memberCon.comcompanyproductandservice.value =
        e.value.companyProductAndService!;
    _memberCon.comCompanyName.value = e.value.companyName!;
    _memberCon.comKhmerName.value = e.value.khmerName!;
    _memberCon.comPositions.value = e.value.position!;
    _memberCon.comphonenumber.value = e.value.phoneNumber!;
    _memberCon.comEmail.value = e.value.email!;
    _memberCon.comTelegram.value = e.value.telegram!;
    _memberCon.comWhatapp.value = e.value.whatApp!;
    _memberCon.comSkype.value = e.value.skype!;
    _memberCon.comMessenger.value = e.value.messenger!;
    _memberCon.comhouseno.value = e.value.houseNo!;
    _memberCon.comstreetno.value = e.value.streetNo!;
    _memberCon.comaddress.value = e.value.address!;
    _memberCon.comWebsite.value = e.value.website!;
    _memberCon.comFacebook.value = e.value.facebook!;
    _memberCon.comTwitter.value = e.value.twitter!;
    _memberCon.comLinkedin.value = e.value.linkedin!;
  }

  void resetdata() {
    _memberCon.comCompanyLogo = null;
    _memberCon.comCompanyLogoString.value = '';
    _memberCon.comcompanyproductandservice.value = '';
    _memberCon.comCompanyName.value = '';
    _memberCon.comKhmerName.value = '';
    _memberCon.comPositions.value = '';
    _memberCon.comphonenumber.value = '';
    _memberCon.comEmail.value = '';
    _memberCon.comTelegram.value = '';
    _memberCon.comWhatapp.value = '';
    _memberCon.comSkype.value = '';
    _memberCon.comMessenger.value = '';
    _memberCon.comhouseno.value = '';
    _memberCon.comstreetno.value = '';
    _memberCon.comaddress.value = '';
    _memberCon.comWebsite.value = '';
    _memberCon.comFacebook.value = '';
    _memberCon.comTwitter.value = '';
    _memberCon.comLinkedin.value = '';
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _memberCon.isLoadingCompany.value ||
              _memberCon.isLoadingCompanyProfile.value
          ? const CompanyShimmer()
          : _memberCon.companyDataList.isNotEmpty
              ? Container(
                  color: Theme.of(context).cardColor,
                  child: RefreshIndicator(
                    onRefresh: onRefresh,
                    child: ListView(
                      padding: const EdgeInsets.only(top: 10),
                      key: scrollAbleKey,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: _memberCon.companyDataList
                                  .asMap()
                                  .entries
                                  .map((e) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, bottom: 20, right: 20),
                                      child: const Text(
                                        'Company Information',
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),

                                    CompanyProfileCard(
                                      isEditable: widget.isEdiable,
                                      companyName: e.value.companyName,
                                      imgUrl: e.value.companyLogo,
                                      onTap: () async {
                                        debugPrint(
                                            'Check URL : $e.value.companyLogo');
                                        setdata(e);
                                        await onShowCustomCupertinoModalSheet(
                                          title: 'Company Information',
                                          isNoIcon: true,
                                          context: context,
                                          child: CompanyProfilePopUpt(
                                              companyid: e.value.id,
                                              networkCompanylogo:
                                                  e.value.companyLogo),
                                        );
                                      },
                                    ),

                                    e.value.position != '' ||
                                            e.value.khmerName != '' ||
                                            e.value.companyProductAndService !=
                                                ''
                                        ? CompanyProductionServiceCard(
                                            onTap: () async {
                                              setdata(e);
                                              onShowCustomCupertinoModalSheet(
                                                title: 'Product and Service',
                                                isNoIcon: true,
                                                context: context,
                                                child:
                                                    CompanyProductServicePopUP(
                                                        companyid: e.value.id),
                                              );
                                            },
                                            isEdiable: widget.isEdiable,
                                            companykhmerName: e.value.khmerName,
                                            companyproductService: e
                                                .value.companyProductAndService,
                                            position: e.value.position)
                                        : widget.isEdiable
                                            ? CustomDottedBotton(
                                                title: "Add Product Service",
                                                onTap: () async {
                                                  setdata(e);
                                                  onShowCustomCupertinoModalSheet(
                                                    title:
                                                        'Product and Service',
                                                    isNoIcon: true,
                                                    context: context,
                                                    child:
                                                        CompanyProductServicePopUP(
                                                            companyid:
                                                                e.value.id),
                                                  );
                                                },
                                              )
                                            : const SizedBox(),

                                    //Contact Information

                                    if (e.value.phoneNumber != "" ||
                                        e.value.email != "" ||
                                        e.value.telegram != "" ||
                                        e.value.whatApp != "" ||
                                        e.value.skype != "" ||
                                        e.value.messenger != "")
                                      CompanyContactInFo(
                                        isHide: false,
                                        isEditable: widget.isEdiable,
                                        phone: e.value.phoneNumber != null
                                            ? "${e.value.phoneNumber}"
                                            : "",
                                        email: e.value.email != null
                                            ? "${e.value.email}"
                                            : "",
                                        telegram: e.value.telegram != null
                                            ? "${e.value.telegram}"
                                            : "",
                                        whatApp: e.value.whatApp != null
                                            ? "${e.value.whatApp}"
                                            : "",
                                        skpye: e.value.skype != null
                                            ? "${e.value.skype}"
                                            : "",
                                        messenger: e.value.messenger != null
                                            ? "${e.value.messenger}"
                                            : "",
                                        onTap: () async {
                                          setdata(e);
                                          await onShowCustomCupertinoModalSheet(
                                              title: 'Contact Information',
                                              isNoIcon: true,
                                              context: context,
                                              child: CompanyContectInfoPopUp(
                                                companyid: e.value.id,
                                              ));
                                        },
                                      )
                                    else
                                      widget.isEdiable
                                          ? CustomDottedBotton(
                                              title: "Add Contact Information",
                                              onTap: () async {
                                                setdata(e);
                                                await onShowCustomCupertinoModalSheet(
                                                    title:
                                                        'Contact Information',
                                                    isNoIcon: true,
                                                    context: context,
                                                    child:
                                                        CompanyContectInfoPopUp(
                                                      companyid: e.value.id,
                                                    ));
                                              },
                                            )
                                          : const SizedBox(),

                                    if (e.value.streetNo != '' ||
                                        e.value.houseNo != '' ||
                                        e.value.address != '')
                                      CompanyLocationInfo(
                                        isHide: false,
                                        isEditable: widget.isEdiable,
                                        streetNo: e.value.streetNo,
                                        houseNo: e.value.houseNo,
                                        address: e.value.address,
                                        onTap: () async {
                                          setdata(e);
                                          await onShowCustomCupertinoModalSheet(
                                              title: 'Location',
                                              isNoIcon: true,
                                              context: context,
                                              child: CompanyLocationPopUp(
                                                companyid: e.value.id,
                                              ));
                                        },
                                      )
                                    else
                                      widget.isEdiable
                                          ? CustomDottedBotton(
                                              title: "Add Location",
                                              onTap: () async {
                                                await onShowCustomCupertinoModalSheet(
                                                    title: 'Location',
                                                    isNoIcon: true,
                                                    context: context,
                                                    child: CompanyLocationPopUp(
                                                      companyid: e.value.id,
                                                    ));
                                              },
                                            )
                                          : const SizedBox(),

                                    //  Social Link

                                    SocialInformationCard(
                                      isEditable: widget.isEdiable,
                                      isHide: false,
                                      onTap: () async {
                                        setdata(e);
                                        await onShowCustomCupertinoModalSheet(
                                            title: 'Social Link Information',
                                            isNoIcon: true,
                                            context: context,
                                            child: SocialLinkInformation(
                                                companyid: e.value.id));
                                      },
                                      website: e.value.website != null
                                          ? "${e.value.website}"
                                          : "",
                                      facebook: e.value.facebook != null
                                          ? "${e.value.facebook}"
                                          : "",
                                      linkedIn: e.value.linkedin != null
                                          ? "${e.value.linkedin}"
                                          : "",
                                      twitter: e.value.twitter != null
                                          ? "${e.value.twitter}"
                                          : "",
                                    ),

                                    const SizedBox(
                                      height: 20,
                                    ),

                                    e.key !=
                                            _memberCon.companyDataList.length -
                                                1
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                bottom: 20,
                                                right: 20),
                                            child: Divider(
                                              thickness: 1,
                                              height: 1,
                                              color: Colors.grey[500],
                                            ),
                                          )
                                        : Container()
                                  ],
                                );
                              }).toList(),
                            ),
                            widget.isEdiable
                                ? GestureDetector(
                                    onTap: () async {
                                      FirebaseAnalyticsHelper
                                          .sendAnalyticsEvent('Add Company');
                                      resetdata();
                                      await onShowCustomCupertinoModalSheet(
                                          title: 'Add Company',
                                          // isScrollControlled: true,
                                          isNoIcon: true,
                                          context: context,
                                          child: AddCompanyFormPopUp(
                                              isEditable: widget.isEdiable));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, top: 20.0, bottom: 20.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.add,
                                            color: AppColor.mainColor,
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              'Add Company',
                                              style: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  fontSize: 16,
                                                  color: Get.theme.brightness ==
                                                          Brightness.light
                                                      ? AppColor.mainColor
                                                      : Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EmptyStateProfile(
                        isEditable: false,
                        title: 'No Company yet',
                        caption:
                            'Here’s where you’ll find the newest update of member profile',
                        buttonLabel: 'Add Company',
                        iconUrl: 'assets/images/emptyState.png',
                        onTap: () {},
                      ),
                      widget.isEdiable
                          ? GestureDetector(
                              onTap: () async {
                                FirebaseAnalyticsHelper.sendAnalyticsEvent(
                                    'Add Company');
                                resetdata();
                                await onShowCustomCupertinoModalSheet(
                                    title: 'Add Company',
                                    isNoIcon: true,
                                    context: context,
                                    child: AddCompanyFormPopUp(
                                      isEditable: widget.isEdiable,
                                    ));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 15, top: 20.0, bottom: 20.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.add,
                                      color: AppColor.mainColor,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        'Add Company',
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 16,
                                            color: Get.theme.brightness ==
                                                    Brightness.light
                                                ? AppColor.mainColor
                                                : Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
    );
  }
}
