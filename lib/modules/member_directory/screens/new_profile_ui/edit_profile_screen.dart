import 'dart:io';

import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar_colorswhite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/function/upload_file_controller.dart';
import '../../../../Utils/helper/custom_loading_button.dart';
import '../../../../core/flavor/flavor_configuration.dart';
import '../../controllers/customer_controller.dart';
import '../../controllers/member_controller.dart';

class EditProfileScreen extends StatefulWidget {
  final int? id;
  final GestureTapCallback? onTapProfile;
  final GestureTapCallback? onTapDone;
  final GestureTapCallback? onTapPhotoProfile;
  final String? appBarTitle;
  final bool? isEditCompany;
  final bool? isComapny;

  final String? titleDone;

  const EditProfileScreen({
    Key? key,
    this.id,
    this.isComapny = false,
    this.onTapPhotoProfile,
    this.onTapProfile,
    this.onTapDone,
    this.appBarTitle,
    this.isEditCompany = false,
    this.titleDone,
  }) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final memberCon = Get.put(MemberController());
  final customerCon = Get.put(CustomerController());
  final uploadImageCon = Get.put(UploadFileController());

  bool isValidation() {
    setState(() {
      if (memberCon.comCompanyName.value == '') {
        memberCon.isCompanyName.value = false;
        memberCon.isDisableCompany.value = true;
      } else {
        memberCon.isCompanyName.value = true;
        memberCon.isDisableCompany.value = false;
      }
      if (memberCon.comCompanyName.value != '' &&
          memberCon.comCompanyName.value !=
              memberCon.company.value.companyName) {
        memberCon.onSubmitCompany(context);
      }
    });
    return false;
  }

  String defualImage =
      '${FlavorConfig.instance.values!.baseUrl}uploads/files/default/default-image.png';
  @override
  Widget build(BuildContext context) {
    // memberCon.fetchMemberPersonProfile();
    return widget.isComapny == false
//member profile
        ? Scaffold(
            appBar: CustomAppBarWhiteColor(
              context: context,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  // uploadImageCon.imageFile.value = File('');
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
              title: 'Edit Profile',
              action: [
                // widget.isEditCompany != true ? widget.actionDone! : Container()

                Obx(
                  () => memberCon.isLoadingProfile.value == true
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SpinKitThreeBounce(
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : TextButton(
                          onPressed: memberCon.copyPersonalProfile.value ==
                                  memberCon.personalProfile.value
                              ? null
                              : () {
                                  widget.onTapDone!();
                                },
                          child: Text(
                            'Done',
                            // "${memberCon.isDisableDonebutton.value}",
                            // widget.titleDone ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: memberCon.copyPersonalProfile.value ==
                                          memberCon.personalProfile.value
                                      ? Colors.grey
                                      : Theme.of(context).primaryColor,
                                ),
                          ),
                        ),
                ),
              ],
            ),
            body: Obx(
              () => Container(
                color: Colors.white,
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Column(
                    children: [
                      uploadImageCon.isLoading.value
                          ? Container(
                              width: 83.0,
                              height: 83.0,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.transparent,
                                strokeWidth: 5,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          : _buildProfile(NetworkImage(
                              customerCon.customer.value.profile!)),
                      TextButton(
                        onPressed: widget.onTapPhotoProfile,
                        child: Text(
                          'Change Profile Photo',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFieldNew(
                          hintText: 'Name',
                          onChange: (name) {
                            setState(() {
                              memberCon.personalProfile.value = memberCon
                                  .personalProfile.value
                                  .copyWith(name: name);
                            });
                          },
                          isValidate: true,
                          labelText: 'Name',
                          initialValue:
                              memberCon.personalProfile.value.name ?? ""),
                      CustomTextFieldNew(
                        hintText: 'Title',
                        onChange: (title) {
                          setState(() {
                            memberCon.personalProfile.value = memberCon
                                .personalProfile.value
                                .copyWith(title: title);
                          });
                        },
                        isValidate: true,
                        labelText: 'Title',
                        initialValue:
                            memberCon.personalProfile.value.position != ''
                                ? memberCon.personalProfile.value.position
                                : '',
                      ),
                      CustomTextFieldNew(
                        hintText: 'Company Name',
                        onChange: (companyName) {
                          setState(() {
                            memberCon.personalProfile.value = memberCon
                                .personalProfile.value
                                .copyWith(companyName: companyName);
                          });
                        },
                        isValidate: true,
                        labelText: 'Company Name',
                        initialValue:
                            memberCon.personalProfile.value.companyName != ''
                                ? memberCon.personalProfile.value.companyName
                                : '',
                      ),
                      CustomTextFieldNew(
                        keyboardType: TextInputType.number,
                        hintText: 'Phone Number',
                        enable: false,
                        onChange: (phone) {
                          setState(() {
                            memberCon.personalProfile.value = memberCon
                                .personalProfile.value
                                .copyWith(phone: phone);
                          });
                        },
                        isValidate: true,
                        labelText: 'Phone Number',
                        initialValue:
                            memberCon.personalProfile.value.phone ?? "",
                      ),
                      CustomTextFieldNew(
                        hintText: 'Email',
                        onChange: (email) {
                          setState(() {
                            memberCon.personalProfile.value = memberCon
                                .personalProfile.value
                                .copyWith(email: email);
                          });
                        },
                        isValidate: true,
                        labelText: 'Email',
                        initialValue:
                            memberCon.personalProfile.value.email ?? '',
                      ),
                      CustomTextFieldNew(
                        hintText: 'https://t.me/username',
                        onChange: (telegram) {
                          setState(() {
                            memberCon.personalProfile.value = memberCon
                                .personalProfile.value
                                .copyWith(telegram: telegram);
                          });
                        },
                        isValidate: true,
                        labelText: 'Link Telegram',
                        initialValue:
                            memberCon.personalProfile.value.telegram ?? '',
                      ),
                      CustomTextFieldNew(
                        hintText: 'https://www.example.com',
                        onChange: (website) {
                          setState(() {
                            memberCon.personalProfile.value = memberCon
                                .personalProfile.value
                                .copyWith(website: website);
                          });
                        },
                        isValidate: true,
                        labelText: 'Link Website',
                        initialValue:
                            memberCon.personalProfile.value.website ?? "",
                      ),
                      CustomTextFieldNew(
                        hintText: 'About Us',
                        onChange: (about) {
                          setState(() {
                            memberCon.personalProfile.value = memberCon
                                .personalProfile.value
                                .copyWith(about: about);
                          });
                        },
                        isValidate: true,
                        labelText: 'About Us',
                        maxLine: 7,
                        initialValue:
                            memberCon.personalProfile.value.about ?? "",
                      ),
                    ],
                  ),
                )),
              ),
            ),
          )

//company proflie
        : Scaffold(
            appBar: CustomAppBarWhiteColor(
              context: context,
              leading: IconButton(
                onPressed: () {
                  memberCon.onClearCompany();
                  Navigator.pop(context);
                  uploadImageCon.imageFile.value = File('');
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
              widgetTitle: Text(
                '${widget.appBarTitle}',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              action: [
                // widget.isEditCompany != true ? widget.actionDone! : Container()
                widget.isEditCompany == true
                    ? Obx(() => memberCon.isLoadingUpdateComapny.value == true
                        ? Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: SpinKitThreeBounce(
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : TextButton(
                            onPressed: memberCon.copyCompanyData.value ==
                                        memberCon.companyData.value &&
                                    uploadImageCon.imageFile.value.path == ''
                                ? null
                                : () {
                                    widget.onTapDone!();
                                  },
                            child: Text(
                              "Done",
                              // widget.titleDone ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: memberCon.copyCompanyData.value ==
                                                memberCon.companyData.value &&
                                            uploadImageCon
                                                    .imageFile.value.path ==
                                                ''
                                        ? Colors.grey
                                        : Theme.of(context).primaryColor,
                                  ),
                            ),
                          ))
                    : const Text(''),
              ],
            ),
            body: Obx(
              () => Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: Column(
                      children: [
                        uploadImageCon.isLoading.value ||
                                memberCon.isDeleteComapny.value
                            ? Container(
                                width: 83.0,
                                height: 83.0,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.transparent,
                                  strokeWidth: 5,
                                  color: Theme.of(context).primaryColor,
                                ),
                              )
                            : !widget.isEditCompany!
                                ? uploadImageCon.imageFile.value.path == ''
                                    ? _buildProfile(NetworkImage(defualImage))
                                    : _buildProfile(
                                        FileImage(
                                            uploadImageCon.imageFile.value),
                                      )
                                : uploadImageCon.imageFile.value.path == ''
                                    ? _buildProfile(
                                        NetworkImage(
                                            memberCon.companyLogoUrl.value),
                                      )
                                    : _buildProfile(
                                        FileImage(
                                            uploadImageCon.imageFile.value),
                                      ),
                        TextButton(
                          onPressed: widget.onTapPhotoProfile,
                          child: Text(
                            'Change Company Logo',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFieldNew(
                          isRequired: true,
                          hintText: 'Company Name',
                          onChange: (comName) {
                            setState(() {
                              memberCon.companyData.value = memberCon
                                  .companyData.value
                                  .copyWith(companyName: comName);
                            });
                          },
                          isValidate: memberCon.isCompanyName.value,
                          labelText: 'Company Name',
                          initialValue: memberCon.companyData.value.companyName,
                        ),
                        CustomTextFieldNew(
                          hintText: 'Input Slogan',
                          onChange: (slogan) {
                            setState(() {
                              memberCon.companyData.value = memberCon
                                  .companyData.value
                                  .copyWith(companySlogan: slogan);
                            });
                          },
                          isValidate: true,
                          labelText: 'Input Slogan',
                          initialValue:
                              memberCon.companyData.value.companySlogan,
                        ),
                        CustomTextFieldNew(
                          // isReadOnly: true,
                          hintText: 'Phone Number',
                          onChange: (phoneNum) {
                            setState(() {
                              memberCon.companyData.value = memberCon
                                  .companyData.value
                                  .copyWith(phoneNumber: phoneNum);
                            });
                          },
                          keyboardType: TextInputType.number,
                          isValidate: true,
                          labelText: 'Phone Number',
                          initialValue: memberCon.companyData.value.phoneNumber,
                        ),
                        CustomTextFieldNew(
                          hintText: 'Email',
                          onChange: (email) {
                            setState(() {
                              memberCon.companyData.value = memberCon
                                  .companyData.value
                                  .copyWith(email: email);
                            });
                          },
                          isValidate: true,
                          labelText: 'Email',
                          initialValue: memberCon.companyData.value.email,
                        ),
                        CustomTextFieldNew(
                          hintText: 'Location',
                          onChange: (companyLocation) {
                            setState(() {
                              memberCon.companyData.value = memberCon
                                  .companyData.value
                                  .copyWith(address: companyLocation);
                            });
                          },
                          isValidate: true,
                          labelText: 'Location',
                          initialValue: memberCon.companyData.value.address,
                        ),
                        CustomTextFieldNew(
                          hintText: 'https://www.example.com',
                          onChange: (companyWebsite) {
                            setState(() {
                              memberCon.companyData.value = memberCon
                                  .companyData.value
                                  .copyWith(website: companyWebsite);
                            });
                          },
                          isValidate: true,
                          labelText: 'Link Website',
                          initialValue: memberCon.companyData.value.website,
                        ),
                        CustomTextFieldNew(
                          hintText: 'About Us',
                          onChange: (comAboutAs) {
                            setState(() {
                              memberCon.companyData.value = memberCon
                                  .companyData.value
                                  .copyWith(companyProfile: comAboutAs);
                            });
                          },
                          isValidate: true,
                          labelText: 'About Us',
                          maxLine: 7,
                          initialValue:
                              memberCon.companyData.value.companyProfile,
                        ),
                        CustomTextFieldNew(
                          hintText: 'Product & Service',
                          onChange: (companyProduct) {
                            setState(() {
                              memberCon.companyData.value =
                                  memberCon.companyData.value.copyWith(
                                      companyProductAndService: companyProduct);
                            });
                          },
                          isValidate: true,
                          labelText: 'Product & Service',
                          maxLine: 7,
                          initialValue: memberCon
                              .companyData.value.companyProductAndService,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: widget.isEditCompany == false
                ? Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10, left: 20, right: 20, top: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onPressed: () {
                              memberCon.onClearCompany();
                              Navigator.pop(context);
                            },
                            title: 'Cancel',
                            isDisable: false,
                            isOutline: true,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Obx(
                          () => Expanded(
                            child: memberCon.isLoadingSubmitCompany.value
                                ? const CustomLoadingButton()
                                : CustomButton(
                                    onPressed: memberCon.companyData.value
                                                    .companyName !=
                                                "" &&
                                            widget.id == null
                                        ? () {
                                            // isValidation();
                                            memberCon.onSubmitCompany(context);
                                          }
                                        : null,
                                    title: 'Done',
                                    isDisable: false,
                                    isOutline: false,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  )
                : null,
          );
  }

  Widget _buildProfile(ImageProvider<Object> imageProvider) {
    return Container(
      height: 85,
      width: 85,
      margin: const EdgeInsets.only(top: 23),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            width: 3.5,
            color: uploadImageCon.isLoading.value
                ? Colors.white
                : Theme.of(context).primaryColor),
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    );
  }
}
