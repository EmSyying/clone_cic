import 'package:cicgreenloan/modules/member_directory/models/member.dart';
import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final Member? member;
  final bool? isInvite;
  final bool? isTick;
  const MemberCard(
      {Key? key, this.member, this.isInvite = false, this.isTick = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      // margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          member!.photo != ""
              ? CircleAvatar(
                  backgroundImage: NetworkImage(member!.photo!, scale: 1.0),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member!.name != null ? member!.name! : '',
                  style: Theme.of(context).textTheme.headline2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                member!.position != ''
                    ? const SizedBox(
                        height: 5,
                      )
                    : Container(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        member!.position!,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                            fontFamily: 'DMSans'),
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
                const SizedBox(
                  height: 5,
                ),
                if (member!.phone != "")
                  Text(
                    member!.phone!,
                    style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'DMSans',
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  )
              ],
            ),
          ),
          // Row(
          //   children: [
          //     PopupMenuButton(
          //       icon: Icon(Icons.more_vert),
          //       itemBuilder: (BuildContext context) => <PopupMenuEntry>[
          //         const PopupMenuItem(
          //           child: ListTile(
          //             leading: Icon(Icons.sort),
          //             title: Text(
          //               'Sort',
          //               style: TextStyle(color: Colors.black),
          //             ),
          //           ),
          //         ),
          //         const PopupMenuItem(
          //           child: ListTile(
          //             leading: Icon(Icons.delete),
          //             title: Text(
          //               'Delete',
          //               style: TextStyle(color: Colors.black),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     IconButton(
          //         icon: Icon(
          //           Icons.send,
          //         ),
          //         onPressed: () {})
          //   ],
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 10),
          //   child: Icon(
          //     Icons.arrow_forward_ios,
          //     size: 18,
          //     color: Colors.grey[500],
          //   ),
          // ),
        ],
      ),
    );
  }
}
