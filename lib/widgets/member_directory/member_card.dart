import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/modules/member_directory/models/personal_profile_model.dart/personal_profile_model.dart';
import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final PersonalProfile? member;
  final bool? isInvite;
  final bool? isTick;
  const MemberCard(
      {Key? key, this.member, this.isInvite = false, this.isTick = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final memberController = Get.put(MemberController());

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          member!.profile != null && member!.profile != ""
              ? CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(member!.profile!,
                      errorListener: () {
                    debugPrint('Error');
                  }),
                  radius: 25,
                  backgroundColor: Theme.of(context).primaryColor,
                )
              : CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).primaryColor,
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
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        member!.position ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
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
                  member!.companyName ?? "",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
