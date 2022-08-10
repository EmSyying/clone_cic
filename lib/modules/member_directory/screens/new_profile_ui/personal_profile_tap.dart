import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/member_controller.dart';

class PersonalProfileTap extends StatelessWidget {
  final String? description;

  const PersonalProfileTap({Key? key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final memberCon = Get.put(MemberController());
    return Column(
      children: [
        if (memberCon.personalProfile.value.about == '' &&
            memberCon.personalProfile.value.about == null)
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'About',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                          'assets/images/svgfile/editedIcon.svg')),
                ),
              ],
            ),
          ),
        Padding(
          padding:
              const EdgeInsets.only(right: 20, top: 10, bottom: 20, left: 20),
          child: Text(
            '$description',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
