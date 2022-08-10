import 'package:cicgreenloan/modules/event_module/models/event_ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/helper/color.dart';
import '../../Utils/helper/container_partern.dart';

class CustomTicketCard extends StatelessWidget {
  final EventTicket? eventTicket;
  final GestureTapCallback? onViewMap;
  final GestureTapCallback? onViewListing;

  const CustomTicketCard(
      {Key? key, this.eventTicket, this.onViewListing, this.onViewMap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      decoration: containerCiCPartern,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: AppColor.mainColor.withOpacity(0.06),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      'assets/images/svgfile/ticketIcon.svg',
                      height: 40,
                    )),
                const SizedBox(
                  height: padding,
                ),
                Text(
                  'Ticket ${eventTicket!.ticket!.id}',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 2,
            indent: 0,
            height: padding * 2,
          ),
          Text(
            'Name',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff6D7174)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(eventTicket!.ticket!.name!,
              style: Theme.of(context).textTheme.headline2),
          const SizedBox(
            height: padding - 5,
          ),
          Text(
            'Event',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff6D7174)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            eventTicket!.ticket!.event ?? "",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: padding - 5,
          ),
          Text(
            'Date',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff6D7174)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            eventTicket!.ticket!.date ?? "",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "${eventTicket!.ticket!.fromTime} to ${eventTicket!.ticket!.toTime}",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: padding - 5,
          ),
          Text(
            'Location',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff6D7174)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            eventTicket!.ticket!.location!,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
            onPressed: onViewMap,
            child:
                Text('View Maps', style: Theme.of(context).textTheme.headline3),
          ),
          Divider(
            color: Colors.grey[500],
            thickness: 1,
            indent: 0,
            height: padding * 2,
          ),
          Text(
            'ID',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff6D7174)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            eventTicket!.ticket!.id.toString(),
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: padding - 5,
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: onViewListing,
            child: TextButton(
              onPressed: onViewListing,
              child: Text(
                'View Event Listing',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
