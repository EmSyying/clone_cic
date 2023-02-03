import 'package:flutter/material.dart';

class CustomInviteMemberProfile extends StatelessWidget {
  final String? profileName;
  final String? noted;
  final String? profileUrl;
  const CustomInviteMemberProfile(
      {Key? key, this.noted, this.profileName, this.profileUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(profileUrl!, scale: 1.0),
          radius: 25,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profileName!,
                style: Theme.of(context).textTheme.displayMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                noted!,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                    fontFamily: 'DMSans'),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
