import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';
import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/Utils/helper/custom_appbar_colorswhite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/member_controller.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final memberCon = Get.put(MemberController());
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
              Navigator.pop(context);
            },
            child: Text(
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
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 25),
            child: memberCon.personalProfilemember.value.profile != null &&
                    memberCon.personalProfilemember.value.profile != ''
                ? Container(
                    height: 85,
                    width: 85,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 3.5, color: AppColor.mainColor),
                      image: DecorationImage(
                          image: NetworkImage(
                              memberCon.personalProfilemember.value.profile!),
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
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Change Profile Photo',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w700),
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
                      onChange: (name) {},
                      isValidate: true,
                      labelText: 'Name',
                    ),
                    CustomTextFieldNew(
                      hintText: 'Title',
                      onChange: (name) {},
                      isValidate: true,
                      labelText: 'Title',
                    ),
                    CustomTextFieldNew(
                      hintText: 'Company Name',
                      onChange: (name) {},
                      isValidate: true,
                      labelText: 'Company Name',
                    ),
                    CustomTextFieldNew(
                      hintText: 'Phone Number',
                      onChange: (name) {},
                      isValidate: true,
                      labelText: 'Phone Number',
                    ),
                    CustomTextFieldNew(
                      hintText: 'Email',
                      onChange: (name) {},
                      isValidate: true,
                      labelText: 'Email',
                    ),
                    CustomTextFieldNew(
                      hintText: 'Telegram',
                      onChange: (name) {},
                      isValidate: true,
                      labelText: 'Telegram',
                    ),
                    CustomTextFieldNew(
                      hintText: 'Website',
                      onChange: (name) {},
                      isValidate: true,
                      labelText: 'Website',
                    ),
                    CustomTextFieldNew(
                      hintText: 'About Us',
                      onChange: (name) {},
                      isValidate: true,
                      labelText: 'About Us',
                      maxLine: 7,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
