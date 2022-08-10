import 'package:cicgreenloan/modules/event_module/models/registered_member.dart';
import 'package:flutter/material.dart';

class RegisteredMemberCard extends StatelessWidget {
  final RegistrationEventData? eventMember;

  const RegisteredMemberCard({Key? key, this.eventMember}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(eventMember!.image!, scale: 1.0),
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
                  eventMember!.participantName! != ''
                      ? eventMember!.participantName!
                      : '',
                  style: Theme.of(context).textTheme.headline2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                eventMember!.position != ''
                    ? const SizedBox(
                        height: 5,
                      )
                    : Container(),
                eventMember!.position != ''
                    ? Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${eventMember!.position}",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                  fontFamily: 'DMSans'),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      )
                    : Container(),
                const SizedBox(
                  height: 5,
                ),
                if (eventMember!.phoneNumber != "")
                  Text(
                    "${eventMember!.phoneNumber}",
                    style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'DMSans',
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
