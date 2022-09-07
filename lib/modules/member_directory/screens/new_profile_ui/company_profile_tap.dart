import 'package:cicgreenloan/modules/member_directory/controllers/member_controller.dart';
import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:cicgreenloan/widgets/new_perional_profile/custom_company_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Utils/function/upload_file_controller.dart';
import 'edit_profile_screen.dart';

class CompanyProfileTab extends StatefulWidget {
  final int? id;
  const CompanyProfileTab({Key? key, this.id}) : super(key: key);

  @override
  State<CompanyProfileTab> createState() => _CompanyProfileTabState();
}

class _CompanyProfileTabState extends State<CompanyProfileTab> {
  final memberCon = Get.put(MemberController());
  final uploadImageCon = Get.put(UploadFileController());
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
  // onGetMoreData() {
  //   memberCon.profilePage.value += 1;
  //   memberCon.fetchCompanyMember(id: widget.id);
  // }

  // Future<void> onRefresh() async {
  //   if (widget.isEdiable == true) {
  //     memberCon.fetchCompanyMember();
  //     setState(() {
  //       isHideAddress = widget.isHidenAddress!;
  //     });
  //   } else {
  //     memberCon.fetchCompanyMemberDetail(widget.id!);
  //     setState(() {
  //       isHideAddress = widget.isHidenAddress!;
  //     });
  //   }
  //   setState(() {
  //     isHideAddress = widget.isHidenAddress!;
  //   });
  // }
  Future<void> onRefreshCompany() async {
    await memberCon.fetchCompanyMember(id: memberCon.company.value.id);
  }

  @override
  Widget build(BuildContext context) {
    memberCon.fetchCompanyMember(id: widget.id);
    return Obx(
      () => memberCon.isLoadingCompanyProfile.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: memberCon.companyDataList.isEmpty
                  ? const CustomEmptyState()
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
                              // onTapAddress: () async {
                              //   await launchUrl(
                              //     Uri.parse('https://g.page/PassApp?share'),
                              //     // 'https://maps.google.com/?q=${preController.shopDetailModel.value.latitude},${preController.shopDetailModel.value.longitude}'),
                              //     mode: LaunchMode.platformDefault,
                              //   );
                              // },
                              onTapAssociate: () async {
                                final Uri launchUri = Uri(
                                  scheme: 'https',
                                  path: '${e.value.website}',
                                );
                                await launchUrl(launchUri);
                              },
                              editCompany: 'Edit company info',
                              onTapEdit: () {
                                memberCon.comCompanyName.value =
                                    e.value.companyName!;
                                memberCon.comphonenumber.value =
                                    e.value.phoneNumber!;
                                memberCon.comSlogan.value =
                                    e.value.companySlogan!;
                                memberCon.comEmail.value = e.value.email!;
                                memberCon.comaddress.value = e.value.address!;
                                memberCon.comWebsite.value = e.value.website!;
                                memberCon.comProfile.value =
                                    e.value.companyProfile!;
                                memberCon.comproductandservice.value =
                                    e.value.companyProductAndService!;
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return EditProfileScreen(
                                    titleDone: 'Done',
                                    appBarTitle: 'Edit Company',
                                    id: e.value.id,
                                    onTapPhotoProfile: () {
                                      uploadImageCon.uploadImage(context,
                                          isCompany: true);
                                    },
                                    onTapDone: () {
                                      memberCon.onUpdateCompany(
                                          context, e.value.id!);
                                    },
                                    isCreateCompany: true,
                                    isEditCompany: true,
                                  );
                                }));
                                if (uploadImageCon.imageFile != null) {
                                  memberCon.isDisableDoneButton.value = false;
                                }
                              },
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: GestureDetector(
                            onTap: () {
                              // memberCon.onClearCompany();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return EditProfileScreen(
                                    appBarTitle: 'Add Company',
                                    isCreateCompany: true,
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
                                  'Add Company',
                                  style: Theme.of(context).textTheme.headline3,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),

              //   ),
              // ),
            ),
    );
  }
}
