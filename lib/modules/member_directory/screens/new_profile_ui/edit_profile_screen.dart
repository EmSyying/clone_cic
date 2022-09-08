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
            // memberCon.onClearImage();
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
            onPressed: memberCon.isDisableDoneButton.value == true
                ? null
                : () {
                    widget.onTapDone!();

                    Navigator.pop(context);
                  },
            child: Obx(
              () => Text(
                widget.titleDone ?? '',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: memberCon.isDisableDoneButton.value == true
                          ? Colors.grey
                          : AppColor.mainColor,
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
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: const CircularProgressIndicator(
                                  backgroundColor: Colors.transparent,
                                  strokeWidth: 5,
                                  color: AppColor.mainColor,
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
                                  memberCon.fullName.value = '';
                                } else if (name ==
                                    memberCon.personalProfile.value
                                        .customerLatinName) {
                                  memberCon.isDisableDoneButton.value = true;
                                } else {
                                  memberCon.fullName.value = name;
                                  memberCon.isDisableDoneButton.value = false;
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
                                memberCon.memberPosition.value = '';
                              } else if (title ==
                                  memberCon.personalProfile.value.title) {
                                memberCon.isDisableDoneButton.value = true;
                              } else {
                                memberCon.memberPosition.value = title;
                                memberCon.isDisableDoneButton.value = false;
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
                                memberCon.membercomapnyName.value = '';
                              } else if (companyName ==
                                  memberCon.personalProfile.value.companyName) {
                                memberCon.isDisableDoneButton.value = true;
                              } else {
                                memberCon.membercomapnyName.value = companyName;
                                memberCon.isDisableDoneButton.value = false;
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
                                memberCon.phone.value = '';
                              } else if (phone ==
                                  memberCon.personalProfile.value.phone) {
                                memberCon.isDisableDoneButton.value = true;
                              } else {
                                memberCon.phone.value = phone;
                                memberCon.isDisableDoneButton.value = false;
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
                                memberCon.gmail.value = '';
                              } else if (email ==
                                  memberCon.personalProfile.value.email) {
                                memberCon.isDisableDoneButton.value = true;
                              } else {
                                memberCon.gmail.value = email;
                                memberCon.isDisableDoneButton.value = false;
                              }
                            });
                          },
                          isValidate: true,
                          labelText: 'Email',
                          initialValue: memberCon.gmail.value,
                        ),
                        CustomTextFieldNew(
                          hintText: 'Telegram',
                          onChange: (telegram) {
                            setState(() {
                              if (telegram == '') {
                                memberCon.telegram.value = '';
                              } else if (telegram ==
                                  memberCon.personalProfile.value.telegram) {
                                memberCon.isDisableDoneButton.value = true;
                              } else {
                                memberCon.isDisableDoneButton.value = false;
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
                                memberCon.webSite.value = '';
                              } else if (website ==
                                  memberCon.personalProfile.value.website) {
                                memberCon.isDisableDoneButton.value = true;
                              } else {
                                memberCon.webSite.value = website;
                                memberCon.isDisableDoneButton.value = false;
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
                            if (aboutAs != '') {
                              setState(() {
                                memberCon.isDisableDoneButton.value = false;
                              });
                            }
                            debugPrint(
                                "is disable button done: ${memberCon.isDisableDoneButton.value}");
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
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: const CircularProgressIndicator(
                                  backgroundColor: Colors.transparent,
                                  strokeWidth: 5,
                                  color: AppColor.mainColor,
                                ),
                              )
                            : uploadImageCon.imagePathFile.value == ""
                                ? _buildProfile(NetworkImage(memberCon
                                            .company.value.companyLogo ==
                                        ''
                                    ? 'https://cicstaging.z1central.com//uploads//files//default//default-user-icon.png'
                                    : memberCon.company.value.companyLogo!))
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
                          onChange: (comName) {
                            setState(() {
                              if (comName == '') {
                                memberCon.comCompanyName.value = '';
                                memberCon.isCompanyName.value = false;
                                memberCon.isDisableDoneButton.value = true;
                              } else if (comName.isNotEmpty) {
                                memberCon.comCompanyName.value = comName;
                                memberCon.isDisableDoneButton.value = false;
                                memberCon.isCompanyName.value = true;
                              } else if (comName ==
                                  memberCon.company.value.companyName) {
                                memberCon.isDisableDoneButton.value = true;
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
                          hintText: 'Input Slogan',
                          onChange: (slogan) {
                            setState(() {
                              if (slogan == '') {
                                memberCon.comSlogan.value = '';
                              } else if (slogan ==
                                  memberCon.company.value.companySlogan) {
                                memberCon.isDisableDoneButton.value = true;
                              } else {
                                memberCon.comSlogan.value = slogan;
                              }
                            });
                          },
                          isValidate: true,
                          labelText: 'Input Slogan',
                          initialValue: widget.id != null
                              ? memberCon.comSlogan.value
                              : '',
                        ),
                        CustomTextFieldNew(
                          // isReadOnly: true,
                          hintText: 'Phone Number',
                          onChange: (phoneNum) {
                            setState(() {
                              if (phoneNum == '') {
                                memberCon.comphonenumber.value = '';
                              } else if (phoneNum ==
                                  memberCon.company.value.phoneNumber) {
                                memberCon.isDisableDoneButton.value = true;
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
                                memberCon.comEmail.value = '';
                              } else if (companyEmail ==
                                  memberCon.company.value.email) {
                                memberCon.isDisableDoneButton.value = true;
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
                                memberCon.comaddress.value = '';
                              } else if (companyLocation ==
                                  memberCon.company.value.address) {
                                memberCon.isDisableDoneButton.value = true;
                              } else {
                                memberCon.comaddress.value = companyLocation;
                              }
                            });
                          },
                          isValidate: true,
                          labelText: 'Location',
                          initialValue: widget.id != null
                              ? memberCon.comaddress.value
                              : '',
                        ),
                        CustomTextFieldNew(
                          hintText: 'Website',
                          onChange: (companyWebsite) {
                            setState(() {
                              if (companyWebsite == '') {
                                memberCon.comWebsite.value = '';
                              } else if (companyWebsite ==
                                  memberCon.company.value.website) {
                                memberCon.isDisableDoneButton.value = true;
                              } else {
                                memberCon.comWebsite.value = companyWebsite;
                              }
                            });
                          },
                          isValidate: true,
                          labelText: 'Website',
                          initialValue: widget.id != null
                              ? memberCon.comWebsite.value
                              : '',
                        ),
                        CustomTextFieldNew(
                          hintText: 'About Us',
                          onChange: (comAboutAs) {
                            debugPrint("Entert about us $comAboutAs");
                            // setState(() {
                            //   memberCon.isDisableDoneButton.value = true;
                            // });
                            setState(() {
                              if (comAboutAs == '') {
                                memberCon.comProfile.value = '';
                              } else if (comAboutAs ==
                                  memberCon.company.value.companyProfile) {
                                memberCon.isDisableDoneButton.value = true;
                              } else {
                                memberCon.comProfile.value = comAboutAs;
                              }
                            });
                          },
                          isValidate: true,
                          labelText: 'About Us',
                          maxLine: 7,
                          initialValue: widget.id != null
                              ? memberCon.comProfile.value
                              : '',
                        ),
                        CustomTextFieldNew(
                          hintText: 'Product & Service',
                          onChange: (companyProduct) {
                            setState(() {
                              if (companyProduct == '') {
                                memberCon.comproductandservice.value = '';
                              } else if (companyProduct ==
                                  memberCon
                                      .company.value.companyProductAndService) {
                                memberCon.isDisableDoneButton.value = true;
                              } else {
                                memberCon.comproductandservice.value =
                                    companyProduct;
                              }
                            });
                          },
                          isValidate: true,
                          labelText: 'Product & Service',
                          maxLine: 7,
                          initialValue: widget.id != null
                              ? memberCon.comproductandservice.value
                              : '',
                        ),
                      ],
                    ),
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
