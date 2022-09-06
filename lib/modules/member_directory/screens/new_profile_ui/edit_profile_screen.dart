import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar_colorswhite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/function/upload_file_controller.dart';
import '../../controllers/customer_controller.dart';
import '../../controllers/member_controller.dart';

class EditProfileScreen extends StatefulWidget {
  final int? id;
  final bool? isCreateCompany;
  final GestureTapCallback? onTapProfile;
  final GestureTapCallback? onTapDone;
  final GestureTapCallback? onTapPhotoProfile;
  final String? appBarTitle;
  final bool? isEditCompany;

  final String? titleDone;

  const EditProfileScreen({
    Key? key,
    this.id,
    this.onTapPhotoProfile,
    this.isCreateCompany = false,
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
  bool? isDisableDone = true;

  // @override
  // void initState() {
  //   super.initState();
  //   memberCon.comCompanyName.value = widget.companyData!.companyName!;
  //   memberCon.comphonenumber.value = widget.companyData!.phoneNumber!;
  //   memberCon.comEmail.value = widget.companyData!.email!;
  //   memberCon.comaddress.value = widget.companyData!.address!;
  //   memberCon.comWebsite.value = widget.companyData!.website!;

  // }

  // onValicationProfile() {
  //   if (memberCon.fullName.value == '' ||
  //       memberCon.fullName.value ==
  //           memberCon.personalProfile.value.customerLatinName&&
  //           memberCon.position.value==''||memberCon.position.value==
  //           ) {
  //     isDisableDone = true;
  //   }
  // }
  bool isValidation() {
    setState(() {
      if (memberCon.comCompanyName.value == '') {
        memberCon.isCompanyName.value = false;
      } else {
        memberCon.isCompanyName.value = true;
      }
      if (memberCon.comCompanyName.value != '' &&
          memberCon.comCompanyName.value !=
              memberCon.company.value.companyName) {
        memberCon.onSubmitCompany(context);
      }
    });
    return false;
  }

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
        widgetTitle: Text(
          '${widget.appBarTitle}',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        action: [
          // widget.isEditCompany != true ? widget.actionDone! : Container()

          TextButton(
            onPressed: isDisableDone == true
                ? null
                : () {
                    widget.onTapDone!();
                    Navigator.pop(context);
                  },
            child: Text(
              widget.titleDone ?? '',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: isDisableDone == true
                        ? Colors.grey
                        : AppColor.mainColor,
                  ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: widget.isCreateCompany == false &&
                  widget.isEditCompany == false
              ? Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Column(
                    children: [
                      uploadImageCon.isLoading.value
                          ? Container(
                              width: 83.0,
                              height: 83.0,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const CircularProgressIndicator(
                                backgroundColor: Colors.transparent,
                                strokeWidth: 5,
                                color: AppColor.mainColor,
                              ),
                            )
                          : uploadImageCon.imagePathFile.value == ""
                              ? _buildProfile(NetworkImage(
                                  customerCon.customer.value.profile!))
                              : _buildProfile(
                                  FileImage(uploadImageCon.imageFile!)),
                      TextButton(
                        onPressed: widget.onTapPhotoProfile,
                        child: Text(
                          'Change Profile Photo',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
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
                              if (name == '') {
                                isDisableDone = true;
                                memberCon.fullName.value = '';
                              } else if (name ==
                                  memberCon.personalProfile.value
                                      .customerLatinName) {
                                isDisableDone = true;
                              } else {
                                isDisableDone = false;
                                memberCon.fullName.value = name;
                              }
                            });
                          },
                          isValidate: true,
                          labelText: 'Name',
                          initialValue: memberCon.fullName.value != ''
                              ? memberCon.fullName.value
                              : ''),
                      CustomTextFieldNew(
                        hintText: 'Title',
                        onChange: (title) {
                          setState(() {
                            if (title == '') {
                              isDisableDone = true;
                              memberCon.memberPosition.value = '';
                            } else if (title ==
                                memberCon.personalProfile.value.title) {
                              isDisableDone = true;
                            } else {
                              isDisableDone = false;
                              memberCon.memberPosition.value = title;
                            }
                          });
                        },
                        isValidate: true,
                        labelText: 'Title',
                        initialValue: memberCon.memberPosition.value != ''
                            ? memberCon.memberPosition.value
                            : '',
                      ),
                      CustomTextFieldNew(
                        hintText: 'Company Name',
                        onChange: (companyName) {
                          setState(() {
                            if (companyName == '') {
                              isDisableDone = true;

                              memberCon.membercomapnyName.value = '';
                            } else if (companyName ==
                                memberCon.personalProfile.value.companyName) {
                              isDisableDone = true;
                            } else {
                              isDisableDone = false;
                              memberCon.membercomapnyName.value = companyName;
                            }
                          });
                        },
                        isValidate: true,
                        labelText: 'Company Name',
                        initialValue: memberCon.membercomapnyName.value != ''
                            ? memberCon.membercomapnyName.value
                            : '',
                      ),
                      CustomTextFieldNew(
                        keyboardType: TextInputType.number,
                        hintText: 'Phone Number',
                        enable: false,
                        onChange: (phone) {
                          setState(() {
                            if (phone == '') {
                              isDisableDone = true;
                              memberCon.phone.value = '';
                            } else if (phone ==
                                memberCon.personalProfile.value.phone) {
                              isDisableDone = true;
                            } else {
                              isDisableDone = false;
                              memberCon.phone.value = phone;
                            }
                          });
                        },
                        isValidate: true,
                        labelText: 'Phone Number',
                        initialValue: memberCon.phone.value != ''
                            ? memberCon.phone.value
                            : '',
                      ),
                      CustomTextFieldNew(
                        hintText: 'Email',
                        onChange: (email) {
                          setState(() {
                            if (email == '') {
                              isDisableDone = true;
                              memberCon.gmail.value = '';
                            } else if (email ==
                                memberCon.personalProfile.value.email) {
                              isDisableDone = true;
                            } else {
                              isDisableDone = false;
                              memberCon.gmail.value = email;
                            }
                          });
                        },
                        isValidate: true,
                        labelText: 'Email',
                        initialValue: memberCon.gmail.value != ''
                            ? memberCon.gmail.value
                            : '',
                      ),
                      CustomTextFieldNew(
                        hintText: 'Telegram',
                        onChange: (telegram) {
                          setState(() {
                            if (telegram == '') {
                              isDisableDone = true;
                              memberCon.telegram.value = '';
                            } else if (telegram ==
                                memberCon.personalProfile.value.telegram) {
                              isDisableDone = true;
                            } else {
                              isDisableDone = false;
                              memberCon.telegram.value = telegram;
                            }
                          });
                        },
                        isValidate: true,
                        labelText: 'Telegram',
                        initialValue: memberCon.telegram.value != ''
                            ? memberCon.telegram.value
                            : '',
                      ),
                      CustomTextFieldNew(
                        hintText: 'Website',
                        onChange: (website) {
                          setState(() {
                            if (website == '') {
                              isDisableDone = true;
                              memberCon.webSite.value = '';
                            } else if (website ==
                                memberCon.personalProfile.value.website) {
                              isDisableDone = true;
                            } else {
                              isDisableDone = false;
                              memberCon.webSite.value = website;
                            }
                          });
                        },
                        isValidate: true,
                        labelText: 'Website',
                        initialValue: memberCon.webSite.value != ''
                            ? memberCon.webSite.value
                            : '',
                      ),
                      CustomTextFieldNew(
                        hintText: 'About Us',
                        onChange: (aboutAs) {
                          setState(() {
                            if (aboutAs == '') {
                              isDisableDone = true;

                              memberCon.memberAboutAs.value = '';
                            } else if (aboutAs ==
                                memberCon.personalProfile.value.about) {
                              isDisableDone = true;
                            } else {
                              isDisableDone = false;
                              memberCon.memberAboutAs.value = aboutAs;
                            }
                          });
                        },
                        isValidate: true,
                        labelText: 'About Us',
                        maxLine: 7,
                        initialValue: memberCon.memberAboutAs.value != ''
                            ? memberCon.memberAboutAs.value
                            : '',
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 30),
                  child: Column(
                    children: [
                      uploadImageCon.isLoading.value
                          ? Container(
                              width: 83.0,
                              height: 83.0,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: const CircularProgressIndicator(
                                backgroundColor: Colors.transparent,
                                strokeWidth: 5,
                                color: AppColor.mainColor,
                              ),
                            )
                          : uploadImageCon.imagePathFile.value == ""
                              ? _buildProfile(NetworkImage(
                                  memberCon.company.value.companyLogo!))
                              : _buildProfile(
                                  FileImage(uploadImageCon.imageFile!)),
                      TextButton(
                        onPressed: widget.onTapPhotoProfile,
                        child: Text(
                          'Change Profile Photo',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFieldNew(
                        hintText: 'Company Name*',
                        onChange: (companyName) {
                          setState(() {
                            if (companyName == '') {
                              memberCon.comCompanyName.value = '';
                              memberCon.isCompanyName.value = false;
                              isDisableDone = true;
                            } else if (companyName ==
                                memberCon.company.value.companyName) {
                              isDisableDone = true;
                            } else {
                              memberCon.comCompanyName.value = companyName;
                              memberCon.isCompanyName.value = true;
                            }
                          });
                        },
                        isValidate: memberCon.isCompanyName.value,
                        labelText: 'Company Name*',
                        initialValue: widget.id != null
                            ? memberCon.comCompanyName.value
                            : '',
                      ),
                      CustomTextFieldNew(
                        // isReadOnly: true,
                        hintText: 'Slogan',
                        onChange: (slogan) {
                          setState(() {
                            if (slogan == '') {
                              memberCon.comSlogan.value;
                              isDisableDone = true;
                            } else if (slogan ==
                                memberCon.company.value.companySlogan) {
                              isDisableDone = true;
                            } else {
                              memberCon.comSlogan.value = slogan;
                              isDisableDone = false;
                            }
                          });
                        },
                        isValidate: true,
                        labelText: 'Slogan',
                        initialValue:
                            widget.id != null ? memberCon.comSlogan.value : '',
                      ),
                      CustomTextFieldNew(
                        // isReadOnly: true,
                        hintText: 'Phone Number',
                        onChange: (phoneNum) {
                          setState(() {
                            if (phoneNum == '') {
                              memberCon.comphonenumber.value;
                              isDisableDone = true;
                            } else if (phoneNum ==
                                memberCon.company.value.phoneNumber) {
                              isDisableDone = true;
                            } else {
                              memberCon.comphonenumber.value = phoneNum;
                            }
                          });
                        },
                        keyboardType: TextInputType.number,
                        isValidate: true,
                        labelText: 'Phone Number',
                        initialValue: widget.id != null
                            ? memberCon.comphonenumber.value
                            : '',
                      ),
                      CustomTextFieldNew(
                        hintText: 'Email',
                        onChange: (companyEmail) {
                          setState(() {
                            if (companyEmail == '') {
                              memberCon.comEmail.value;
                              isDisableDone = true;
                            } else if (companyEmail ==
                                memberCon.company.value.email) {
                              isDisableDone = true;
                            } else {
                              memberCon.comEmail.value = companyEmail;
                            }
                          });
                        },
                        isValidate: true,
                        labelText: 'Email',
                        initialValue:
                            widget.id != null ? memberCon.comEmail.value : '',
                      ),
                      CustomTextFieldNew(
                        hintText: 'Location',
                        onChange: (companyLocation) {
                          setState(() {
                            if (companyLocation == '') {
                              memberCon.comaddress.value;
                              isDisableDone = true;
                            } else if (companyLocation ==
                                memberCon.company.value.address) {
                              isDisableDone = true;
                            } else {
                              memberCon.comaddress.value = companyLocation;
                            }
                          });
                        },
                        isValidate: true,
                        labelText: 'Location',
                        initialValue:
                            widget.id != null ? memberCon.comaddress.value : '',
                      ),
                      CustomTextFieldNew(
                        hintText: 'Website',
                        onChange: (companyWebsite) {
                          setState(() {
                            if (companyWebsite == '') {
                              memberCon.comWebsite.value;
                              isDisableDone = true;
                            } else if (companyWebsite ==
                                memberCon.company.value.website) {
                              isDisableDone = true;
                            } else {
                              memberCon.comWebsite.value = companyWebsite;
                            }
                          });
                        },
                        isValidate: true,
                        labelText: 'Website',
                        initialValue:
                            widget.id != null ? memberCon.comWebsite.value : '',
                      ),
                      CustomTextFieldNew(
                        hintText: 'About Us',
                        onChange: (comAboutAs) {
                          setState(() {
                            if (comAboutAs == '') {
                              memberCon.comCompanyProfile.value;
                              isDisableDone = true;
                            } else if (comAboutAs ==
                                memberCon.company.value.companyProfile) {
                              isDisableDone = true;
                            } else {
                              memberCon.comCompanyProfile.value = comAboutAs;
                            }
                          });
                        },
                        isValidate: true,
                        labelText: 'About Us',
                        maxLine: 7,
                        initialValue: widget.id != null
                            ? memberCon.comCompanyProfile.value
                            : '',
                      ),
                      CustomTextFieldNew(
                        hintText: 'Product & Service',
                        onChange: (companyProduct) {
                          setState(() {
                            if (companyProduct == '') {
                              memberCon.comcompanyproductandservice.value;
                              isDisableDone = true;
                            } else if (companyProduct ==
                                memberCon
                                    .company.value.companyProductAndService) {
                              isDisableDone = true;
                            } else {
                              memberCon.comcompanyproductandservice.value =
                                  companyProduct;
                            }
                          });
                        },
                        isValidate: true,
                        labelText: 'Product & Service',
                        maxLine: 7,
                        initialValue: widget.id != null
                            ? memberCon.comcompanyproductandservice.value
                            : '',
                      ),
                    ],
                  ),
                ),
        ),
      ),
      bottomNavigationBar:
          widget.isCreateCompany == true && widget.isEditCompany == false
              ? Padding(
                  padding: const EdgeInsets.only(
                      bottom: 30, left: 20, right: 20, top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          title: 'Cancel',
                          isDisable: false,
                          isOutline: true,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CustomButton(
                          onPressed: () {
                            isValidation();
                            Navigator.pop(context);
                            // memberCon.onSubmitCompany(context);
                          },
                          title: 'Done',
                          isDisable: false,
                          isOutline: false,
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
                : AppColor.mainColor),
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    );
  }
}
