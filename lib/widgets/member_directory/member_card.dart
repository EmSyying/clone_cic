import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/member_directory/controllers/member_controller.dart';

class MemberCard extends StatelessWidget {
  final Member? member;
  final bool? isInvite;
  final bool? isTick;
  const MemberCard(
      {Key? key, this.member, this.isInvite = false, this.isTick = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final memberController = Get.put(MemberController());

    return Container(
      height: 90,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          member!.photo != null && member!.photo != ""
              ? CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(member!.photo!,
                      errorListener: () {
                    debugPrint('Error');
                  }),
                  radius: 25,
                )
              : CircleAvatar(
                  radius: 25,
                  child: Center(
                    child: Text(
                      member!.defaultPhoto!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member!.name ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        member!.position!,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: AppColor.darkColor),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    isInvite!
                        ? Icon(
                            isTick!
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          )
                        : Container(),
                  ],
                ),
                Text(
                  member!.company!.isNotEmpty
                      ? member!.company!
                      : 'Here is Company name',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColor.chartLabelColor,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
