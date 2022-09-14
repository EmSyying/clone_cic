import 'package:cicgreenloan/widgets/bonus/custom_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/member_controller.dart';

class PersonalProfileTap extends StatelessWidget {
  final String? description;
  final int? id;

  const PersonalProfileTap({Key? key, this.description, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final memberCon = Get.put(MemberController());

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (description != '' && description != null)
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'About',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          Padding(
            padding:
                const EdgeInsets.only(right: 20, top: 10, bottom: 20, left: 20),
            child: description == '' || description == null
                ? const CustomEmptyState(
                    title: 'No Description Yet!',
                    description:
                        'You have not completed your personal profile yet,please go to edit button to fill in your personal profile.',
                  )
                : Text(
                    '$description',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
          ),
        ],
      ),
    );
  }
}
