import 'dart:io';

import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:cicgreenloan/widgets/new_perional_profile/custom_company_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Utils/function/upload_file_controller.dart';
import '../../controllers/customer_controller.dart';
import 'edit_profile_screen.dart';

class CompanyProfileTab extends StatefulWidget {
  final int? id;
  final bool? isDirectories;
  const CompanyProfileTab({Key? key, this.id, this.isDirectories = false})
      : super(key: key);

  @override
  State<CompanyProfileTab> createState() => _CompanyProfileTabState();
}

class _CompanyProfileTabState extends State<CompanyProfileTab> {
  final memberCon = Get.put(MemberController());
  final uploadImageCon = Get.put(UploadFileController());
  final customerController = Get.put(CustomerController());
  // final companyCon = Get.put(NewProfileController());
  bool isHideAddress = false;
  int page = 1;

  Future onRefresh() async {
    page = 1;
  }

  onGetMore() {
    setState(() {
      page++;
    });
  }

  Future<void> onRefreshCompany() async {
    await memberCon.fetchCompanyMember(id: widget.id);
  }

  @override
  void initState() {
    memberCon.fetchCompanyMember(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => memberCon.isLoadingCompanyProfile.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: memberCon.companyDataList.isEmpty
                  ? Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: CustomEmptyState(
                            title: 'No Description Yet!',
                            description:
                                'You have not completed your personal company yet,please presse on add company to fill in your company profile.',
                          ),
                        ),
                        widget.isDirectories == false
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 30),
                                child: GestureDetector(
                                  onTap: () {
                                    // memberCon.isCompanyName.value = true;
                                    uploadImageCon.imageFile.value = File('');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return EditProfileScreen(
                                          appBarTitle: 'Add Company',
                                          // isCreateCompany: true,
                                          isComapny: true,
                                          // companyData: memberCon.company.value,
                                          onTapPhotoProfile: () {
                                            uploadImageCon.uploadImage(context,
                                                isCompany: true);
                                          },
                                        );
                                      }),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/svgfile/add.svg'),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Add Companysss',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    )
                  : Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: memberCon.companyDataList
                              .asMap()
                              .entries
                              .map((e) {
                            return CustomCompanyTap(
                              imageProfile: e.value.companyLogo,
                              companyName: e.value.companyName,
                              slogan: e.value.companySlogan,
                              description: e.value.companyProfile ?? '',
                              image: e.value.companyActivityImages,
                              phone: e.value.phoneNumber ?? '',
                              email: e.value.email ?? '',
                              address: e.value.address ?? '',
                              website: e.value.website ?? '',
                              productService: e.value.companyProductAndService,
                              isDirectories: widget.isDirectories,
                              onTapPhone: () async {
                                final Uri launchUri = Uri(
                                  scheme: 'tel',
                                  path: '${e.value.phoneNumber}',
                                );
                                await launchUrl(launchUri);
                              },
                              onTapEmail: () async {
                                final Uri launchUri = Uri(
                                  scheme: 'mailto',
                                  path: '${e.value.email}',
                                );
                                await launchUrl(launchUri);
                              },
                              onTapAssociate: () async {
                                await launchUrl(
                                  Uri.parse('${e.value.website}'),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              editCompany: 'Edit company info',
                              onTapEdit: () {
                                memberCon.companyData.value = e.value;
                                memberCon.copyCompanyData.value = e.value;
                                memberCon.companyLogoUrl.value =
                                    e.value.companyLogo!;

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return EditProfileScreen(
                                    isComapny: true,
                                    titleDone: 'Done',
                                    appBarTitle: 'Edit Company',
                                    id: e.value.id,
                                    onTapPhotoProfile: () {
                                      uploadImageCon.uploadImage(
                                        context,
                                        isCompany: true,
                                        onRemove: () {
                                          memberCon.onDeleteImageProfile(
                                              context, e.value.id, 'company');
                                        },
                                      );
                                    },
                                    onTapDone: () {
                                      memberCon.onUpdateCompany(
                                          context, e.value.id!);
                                    },
                                    // isCreateCompany: true,
                                    isEditCompany: true,
                                  );
                                }));
                                memberCon.isDisableDoneButton.value = false;
                              },
                            );
                          }).toList(),
                        ),
                        widget.isDirectories == false
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    // memberCon.isCompanyName.value = true;
                                    uploadImageCon.imageFile.value = File('');
                                    memberCon.onClearCompany();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return EditProfileScreen(
                                          appBarTitle: 'Add Company',
                                          // isCreateCompany: true,
                                          isComapny: true,
                                          // companyData: memberCon.company.value,
                                          onTapPhotoProfile: () {
                                            memberCon
                                                    .copyPersonalProfile.value =
                                                memberCon.personalProfile.value;
                                            uploadImageCon.uploadImage(context,
                                                isCompany: true);
                                          },
                                        );
                                      }),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/svgfile/add.svg'),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Add Company',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),

              //   ),
              // ),
            ),
    );
  }
}
