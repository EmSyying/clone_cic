import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar_colorswhite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/function/upload_file_controller.dart';
import '../../controllers/customer_controller.dart';
import '../../controllers/member_controller.dart';

class EditProfileScreen extends StatefulWidget {
  final int? id;
  const EditProfileScreen({Key? key, this.id}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final memberCon = Get.put(MemberController());
  final customerCon = Get.put(CustomerController());
  final uploadImageCon = Get.put(UploadFileController());
  // memberCon.fetchMemberPersonProfile(id!);

  @override
  Widget build(BuildContext context) {
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
        title: 'Edit Profile',
        action: [
          TextButton(
            onPressed: () {
              memberCon.updatePersonalProfile(context);

              debugPrint(
                  'Member Personal Name:${memberCon.personalProfilemember.value.fullName}');
            },
            child: memberCon.isLaodingUpdateProfile.value
                ? const CircularProgressIndicator(
                    strokeWidth: 4,
                    color: AppColor.mainColor,
                  )
                : Text(
                    'Done',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppColor.mainColor,
                        ),
                  ),
          ),
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
                  customerCon.customer.value.profile != null &&
                          customerCon.customer.value.profile! != ''
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
                                image: NetworkImage(
                                    customerCon.customer.value.profile!),
                                fit: BoxFit.cover),
                          ),
                        )
                      : Container(
                          height: 85,
                          width: 85,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://cicstaging.z1central.com//uploads//files//default//default-user-icon.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                ],
              ),
              TextButton(
                onPressed: () {
                  uploadImageCon.uploadImage(context);
                },
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
                  child: Padding(
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
                          initialValue: memberCon
                                  .personalProfile.value.customerLatinName ??
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
                          hintText: 'Company Name',
                          onChange: (company) {
                            if (company == '') {
                              memberCon.companyName.value;
                            } else {
                              memberCon.position.value = company;
                            }
                          },
                          isValidate: true,
                          labelText: 'Company Name',
                          initialValue: '',
                        ),
                        CustomTextFieldNew(
                          hintText: 'Phone Number',
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
                              memberCon.personalProfile.value.telegram ?? '',
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
                              memberCon.personalProfile.value.website ?? '',
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
