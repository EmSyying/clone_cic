import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/modules/event_module/models/event_data.dart';
import 'package:cicgreenloan/widgets/events/custom_member.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/helper/container_partern.dart';

class FeatureCard extends StatelessWidget {
  final EventData? eventData;
  const FeatureCard({Key? key, this.eventData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 45.0, right: 5.0, bottom: 10, left: 3),
          child: Container(
            height: 260.0,
            width: 290.0,
            decoration: containerCiCPartern,
            child: Padding(
              padding: const EdgeInsets.only(top: 130.0, left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventData!.date!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'DMSans',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      eventData!.title!,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10.0, right: 5.0),
                        child: SvgPicture.asset(eventData!.hostAt == "online"
                            ? 'assets/images/svgfile/online.svg'
                            : 'assets/images/svgfile/address.svg'),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                          ),
                          child: Text(
                              eventData!.hostAt == "online"
                                  ? eventData!.hostAt.toString()
                                  : eventData!.location!,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleSmall),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10.0, right: 5),
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
                        CustomMember(
                          memberList: eventData!.registerProfile!.toList(),
                          registerNumber: eventData!.registerNumber!,
                        ),
                        // Container(
                        //   width: 30,
                        //   height: 30,
                        //   margin: const EdgeInsets.only(right: 5),
                        //   alignment: Alignment.topLeft,
                        //   child: CustomMember(
                        //       memberList: eventData!.registerProfile!.toList(),
                        //       registerNumber: eventData!.registerNumber!),
                        // ),
                        // eventData!.registerProfile!.isNotEmpty
                        //     ? (eventData!.registerNumber == 1
                        //         ? Container(
                        //             width: 30,
                        //             height: 30,
                        //             margin: const EdgeInsets.only(right: 5),
                        //             alignment: Alignment.topLeft,
                        //             child: CustomMember(
                        //                 memberList: eventData!.registerProfile!
                        //                     .toList(),
                        //                 registerNumber:
                        //                     eventData!.registerNumber!),
                        //           )
                        //         : eventData!.registerNumber == 2
                        //             ? Container(
                        //                 width: 30,
                        //                 height: 30,
                        //                 margin: const EdgeInsets.only(right: 5),
                        //                 alignment: Alignment.topLeft,
                        //                 child: CustomMember(
                        //                     memberList: eventData!
                        //                         .registerProfile!
                        //                         .toList(),
                        //                     registerNumber:
                        //                         eventData!.registerNumber!),
                        //               )
                        //             : Container(
                        //                 width: 65,
                        //                 height: 30,
                        //                 margin: const EdgeInsets.only(right: 5),
                        //                 alignment: Alignment.topLeft,
                        //                 child: CustomMember(
                        //                     memberList: eventData!
                        //                         .registerProfile!
                        //                         .toList(),
                        //                     registerNumber:
                        //                         eventData!.registerNumber!),
                        //               ))
                        //     : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 140.0,
          left: 20.0,
          right: 18.0,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: SizedBox(
              height: 150.0,
              child: CachedNetworkImage(
                imageUrl: eventData!.cover!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
