import 'package:cicgreenloan/modules/get_funding/controller/equity_investment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/helper/firebase_analytics.dart';

class CustomCallCenter extends StatefulWidget {
  final Color? color;
  final bool? isPading;
  final String? type;
  const CustomCallCenter(
      {Key? key, this.color, this.isPading = false, this.type})
      : super(key: key);

  @override
  State<CustomCallCenter> createState() => _CustomCallCenterState();
}

class _CustomCallCenterState extends State<CustomCallCenter> {
  final equityCon = Get.put(EquityInvestmentController());
  @override
  void initState() {
    equityCon.fetchCallCenter(type: widget.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.type != null) {
          FirebaseAnalyticsHelper.sendAnalyticsEvent("FIF Call Center");
        } else {
          FirebaseAnalyticsHelper.sendAnalyticsEvent("Get Funding Call Center");
        }
        await launchUrl(
          Uri.parse('${equityCon.callCenter.value.link}'),
          mode: LaunchMode.externalApplication,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: 8.0, right: widget.isPading == true ? 0 : 10.0),
        child: SvgPicture.asset(
          "assets/images/svgfile/telegram-icons.svg",
          height: 35.0,
          width: 35.0,
        ),
      ),
    );
  }
}
