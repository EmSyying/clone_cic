import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EventAddressLabel extends StatelessWidget {
  final String? location;
  const EventAddressLabel({Key? key, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return location != ''
        ? Container(
            padding: const EdgeInsets.only(top: 20.0, right: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (location != null)
                  Container(
                    margin: const EdgeInsets.only(right: 10.0, left: 15.0),
                    child:
                        SvgPicture.asset('assets/images/svgfile/address.svg'),
                  ),
                Expanded(
                  child: Container(
                    child: location != null
                        ? Text(
                            '$location',
                            style: const TextStyle(
                              color: Color(0xff6D7174),
                              fontFamily: 'DMSans',
                              fontSize: 14,
                            ),
                          )
                        : const Text(''),
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
