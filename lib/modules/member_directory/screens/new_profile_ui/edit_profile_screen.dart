import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar_colorswhite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/function/upload_file_controller.dart';
import '../../controllers/customer_controller.dart';
import '../../controllers/member_controller.dart';
import '../../models/company_data.dart';

class EditProfileScreen extends StatefulWidget {
  final int? id;
  final bool? isEditCompany;
  final CompanyData? companyData;
  final bool? isCreateCompany;
  final GestureTapCallback? onTapProfile;
  final GestureTapCallback? onTapDone;
  final GestureTapCallback? onTapPhotoProfile;

  const EditProfileScreen(
      {Key? key,
      this.id,
      this.onTapPhotoProfile,
      this.isEditCompany = false,
      this.companyData,
      this.isCreateCompany = false,
      this.onTapProfile,
      this.onTapDone})
      : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final memberCon = Get.put(MemberController());
  final customerCon = Get.put(CustomerController());
  final uploadImageCon = Get.put(UploadFileController());
  // @override
  // void initState() {
  //   super.initState();
  //   memberCon.comCompanyName.value = widget.companyData!.companyName!;
  //   memberCon.comphonenumber.value = widget.companyData!.phoneNumber!;
  //   memberCon.comEmail.value = widget.companyData!.email!;
  //   memberCon.comaddress.value = widget.companyData!.address!;
  //   memberCon.comWebsite.value = widget.companyData!.website!;
  // }

  @override
  Widget build(BuildContext context) {
    // memberCon.fetchMemberPersonProfile();
    return Scaffold(
      appBar: CustomAppBarWhiteColor(
        context: context,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        title: widget.isEditCompany!
            ? 'Edit Company'
            : widget.isCreateCompany!
                ? 'Add Company'
                : 'Edit Profile',
        action: [
          !widget.isCreateCompany!
              ? TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    widget.onTapDone!();
                  },

                  // widget.isEditCompany == true
                  //     ? setState(() {
                  //         memberCon.update();
                  //         // formkey.currentState!.save();
                  //         memberCon.onUpdateCompany(context, widget.id!);
                  //         memberCon.fetchCompanyMember(
                  //             id: customerCon.customer.value.id);
                  //         // debugPrint(
                  //         //     'helooo name:${memberCon.personalProfilemember.value.fullName}');
                  //       })
                  //     : setState(() {
                  //         memberCon.update();
                  //         // formkey.currentState!.save();
                  //         memberCon.updatePersonalProfile(context);
                  //         memberCon.fetchMemberPersonProfile(
                  //             id: customerCon.customer.value.id);

                  //         debugPrint(
                  //             'helooo name:${memberCon.personalProfilemember.value.fullName}');
                  //       });

                  child: Text(
                    'Done',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColor.mainColor,
                        ),
                  ),
                )
              : Container(),
        ],
      ),
      body: Obx(
        () => Container(
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  if (uploadImageCon.isLoading.value)
                    Positioned(
                      top: 25.0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: 83.0,
                        height: 83.0,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: const CircularProgressIndicator(
                          backgroundColor: Colors.transparent,
                          strokeWidth: 5,
                          color: AppColor.mainColor,
                        ),
                      ),
                    ),
                  uploadImageCon.imagePathFile.value == ""
                      ? Container(
                          height: 85,
                          width: 85,
                          margin: const EdgeInsets.only(top: 23),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 3.5,
                                color: uploadImageCon.isLoading.value
                                    ? Colors.white
                                    : AppColor.mainColor),
                            image: DecorationImage(
                                image: NetworkImage(widget.isEditCompany == true
                                    ? widget.companyData!.companyLogo!
                                    : customerCon.customer.value.profile!),
                                fit: BoxFit.cover),
                          ),
                        )
                      : Container(
                          height: 85,
                          width: 85,
                          margin: const EdgeInsets.only(top: 23),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 3.5,
                                color: uploadImageCon.isLoading.value
                                    ? Colors.white
                                    : AppColor.mainColor),
                            image: DecorationImage(
                                image: FileImage(uploadImageCon.imageFile!),
                                fit: BoxFit.cover),
                          ),
                        ),
                ],
              ),
              TextButton(
                onPressed: widget.onTapPhotoProfile,
                child: Text(
                  'Change Profile Photo',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: !widget.isEditCompany!
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 30),
                          child: Column(
                            children: [
                              CustomTextFieldNew(
                                hintText: 'Name',
                                onChange: (name) {
                                  if (name == '') {
                                    memberCon.fullName.value;
                                  } else {
                                    memberCon.fullName.value = name;
                                  }
                                },
                                isValidate: true,
                                labelText: 'Name',
                                initialValue: memberCon.personalProfile.value
                                        .customerLatinName ??
                                    '',
                              ),
                              CustomTextFieldNew(
                                hintText: 'Title',
                                onChange: (title) {
                                  if (title == '') {
                                    memberCon.position.value;
                                  } else {
                                    memberCon.position.value = title;
                                  }
                                },
                                isValidate: true,
                                labelText: 'Title',
                                initialValue: '',
                              ),
                              CustomTextFieldNew(
                                keyboardType: TextInputType.number,
                                hintText: 'Phone Number',
                                enable: false,
                                onChange: (phone) {
                                  if (phone == '') {
                                    memberCon.phone.value;
                                  } else {
                                    memberCon.phone.value = phone;
                                  }
                                },
                                isValidate: true,
                                labelText: 'Phone Number',
                                initialValue:
                                    memberCon.personalProfile.value.phone ?? '',
                              ),
                              CustomTextFieldNew(
                                hintText: 'Email',
                                onChange: (email) {
                                  if (email == '') {
                                    memberCon.gmail.value;
                                  } else {
                                    memberCon.gmail.value = email;
                                  }
                                },
                                isValidate: true,
                                labelText: 'Email',
                                initialValue:
                                    memberCon.personalProfile.value.email ?? '',
                              ),
                              CustomTextFieldNew(
                                hintText: 'Telegram',
                                onChange: (telegram) {
                                  if (telegram == '') {
                                    memberCon.telegram.value;
                                  } else {
                                    memberCon.telegram.value = telegram;
                                  }
                                },
                                isValidate: true,
                                labelText: 'Telegram',
                                initialValue:
                                    memberCon.personalProfile.value.telegram ??
                                        '',
                              ),
                              CustomTextFieldNew(
                                hintText: 'Website',
                                onChange: (website) {
                                  if (website == '') {
                                    memberCon.webSite.value;
                                  } else {
                                    memberCon.webSite.value = website;
                                  }
                                },
                                isValidate: true,
                                labelText: 'Website',
                                initialValue:
                                    memberCon.personalProfile.value.website ??
                                        '',
                              ),
                              CustomTextFieldNew(
                                hintText: 'About Us',
                                onChange: (aboutAs) {
                                  if (aboutAs == '') {
                                    memberCon.aboutAs.value;
                                  } else {
                                    memberCon.aboutAs.value = aboutAs;
                                  }
                                },
                                isValidate: true,
                                labelText: 'About Us',
                                maxLine: 7,
                                initialValue:
                                    memberCon.personalProfile.value.about ?? '',
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 30),
                          child: Column(
                            children: [
                              // Text(
                              //     'heloo:${memberCon.companyDataList[0].companyName}'),
                              CustomTextFieldNew(
                                hintText: 'Company Name',
                                onChange: (companyName) {
                                  if (companyName == '') {
                                    memberCon.comCompanyName.value;
                                  } else {
                                    memberCon.comCompanyName.value =
                                        companyName;
                                  }
                                },
                                isValidate: true,
                                labelText: 'Company Name',
                                initialValue:
                                    memberCon.comCompanyName.value != ''
                                        ? widget.companyData!.companyName
                                        : '',
                              ),
                              CustomTextFieldNew(
                                // isReadOnly: true,
                                hintText: 'Phone Number',
                                onChange: (phoneNum) {
                                  if (phoneNum == '') {
                                    memberCon.comphonenumber.value;
                                  } else {
                                    memberCon.comphonenumber.value = phoneNum;
                                  }
                                },
                                keyboardType: TextInputType.number,
                                isValidate: true,
                                labelText: 'Phone Number',
                                initialValue:
                                    memberCon.comphonenumber.value != ''
                                        ? widget.companyData!.phoneNumber
                                        : '',
                              ),
                              CustomTextFieldNew(
                                hintText: 'Email',
                                onChange: (companyEmail) {
                                  if (companyEmail == '') {
                                    memberCon.comEmail.value;
                                  } else {
                                    memberCon.comEmail.value = companyEmail;
                                  }
                                },
                                isValidate: true,
                                labelText: 'Email',
                                initialValue: memberCon.comEmail.value != ''
                                    ? widget.companyData!.email
                                    : '',
                              ),
                              CustomTextFieldNew(
                                hintText: 'Location',
                                onChange: (companyLocation) {
                                  if (companyLocation == '') {
                                    memberCon.comaddress.value;
                                  } else {
                                    memberCon.comaddress.value =
                                        companyLocation;
                                  }
                                },
                                isValidate: true,
                                labelText: 'Location',
                                initialValue: memberCon.comaddress.value != ''
                                    ? widget.companyData!.address
                                    : '',
                              ),
                              CustomTextFieldNew(
                                hintText: 'Website',
                                onChange: (companyWebsite) {
                                  if (companyWebsite == '') {
                                    memberCon.comWebsite.value;
                                  } else {
                                    memberCon.comWebsite.value = companyWebsite;
                                  }
                                },
                                isValidate: true,
                                labelText: 'Website',
                                initialValue: memberCon.comWebsite.value != ''
                                    ? widget.companyData!.website
                                    : '',
                              ),
                              CustomTextFieldNew(
                                hintText: 'About Us',
                                onChange: (comAboutAs) {
                                  if (comAboutAs == '') {
                                    memberCon.comAboutUs.value;
                                  } else {
                                    memberCon.comAboutUs.value = comAboutAs;
                                  }
                                },
                                isValidate: true,
                                labelText: 'About Us',
                                maxLine: 7,
                                initialValue: '',
                              ),
                              CustomTextFieldNew(
                                hintText: 'Product & Service',
                                onChange: (companyProduct) {
                                  if (companyProduct == '') {
                                    memberCon.comProduct.value;
                                  } else {
                                    memberCon.comProduct.value = companyProduct;
                                  }
                                },
                                isValidate: true,
                                labelText: 'Product & Service',
                                maxLine: 7,
                                initialValue: '',
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
