import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/modules/event_module/models/event_data.dart';
import 'package:cicgreenloan/widgets/events/custom_member.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../Utils/helper/container_partern.dart';

class NewEventCard extends StatelessWidget {
  final EventData? eventData;
  const NewEventCard({Key? key, this.eventData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 140.0,
        margin: const EdgeInsets.only(bottom: 15.0),
        width: double.infinity,
        decoration: containerCiCPartern,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(1.0, 0.0),
                    color: Colors.black12,
                    blurRadius: 4)
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 135.0,
                  width: 110.0,
                  child: Hero(
                    tag: eventData!.cover!,
                    child: CachedNetworkImage(
                      imageUrl: eventData!.thumbnail!,
                      fit: BoxFit.cover,
                      placeholder: (_, text) => Shimmer.fromColors(
                          baseColor: Colors.grey[100]!,
                          highlightColor: Colors.white,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.grey[300],
                          )),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 12.5, left: 10.0),
                        child: Text(
                          eventData!.date!,
                          style: const TextStyle(
                            color: Color(0xff6D7174),
                            fontFamily: 'DMSans',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 5.0, left: 10.0, right: 15.0),
                        child: Text(
                          eventData!.title!,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10.0, right: 10.0, left: 10.0),
                            child: SvgPicture.asset(
                                eventData!.hostAt == "online"
                                    ? 'assets/images/svgfile/online.svg'
                                    : 'assets/images/svgfile/address.svg'),
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 10.0, right: 10.0),
                              child: Text(
                                eventData!.hostAt == "online"
                                    ? eventData!.hostAt.toString()
                                    : eventData!.location!,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        margin: const EdgeInsets.only(right: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 10.0, left: 10.0, right: 5),
                                child: Text(
                                  eventData!.interested != null
                                      ? "${eventData!.interested.toString()} interested"
                                      : "0 interested",
                                  style: const TextStyle(
                                    color: Color(0xff6D7174),
                                    fontFamily: 'DMSans',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            eventData!.registerProfile!.isNotEmpty
                                ? (eventData!.registerNumber == 1
                                    ? Container(
                                        width: 30,
                                        height: 30,
                                        margin: const EdgeInsets.only(right: 5),
                                        alignment: Alignment.topLeft,
                                        child: CustomMember(
                                            memberList: eventData!
                                                .registerProfile!
                                                .toList(),
                                            registerNumber:
                                                eventData!.registerNumber!))
                                    : eventData!.registerNumber == 2
                                        ? Container(
                                            width: 40,
                                            height: 30,
                                            margin:
                                                const EdgeInsets.only(right: 5),
                                            alignment: Alignment.topLeft,
                                            child: CustomMember(
                                                memberList: eventData!
                                                    .registerProfile!
                                                    .toList(),
                                                registerNumber:
                                                    eventData!.registerNumber!))
                                        : Container(
                                            width: 65,
                                            height: 30,
                                            margin:
                                                const EdgeInsets.only(right: 5),
                                            alignment: Alignment.topLeft,
                                            child: CustomMember(
                                                memberList: eventData!
                                                    .registerProfile!
                                                    .toList(),
                                                registerNumber: eventData!
                                                    .registerNumber!)))
                                : Container(),
                          ],
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
