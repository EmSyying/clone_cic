import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../modules/dashboard/buttom_navigation_bar.dart';
import '../../modules/get_funding/screens/get_funding.dart';

class GetFundingLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pageList = [
      const BeamPage(
        child: PaymentSchedule(),
        key: ValueKey("home"),
      )
    ];
    if (state.uri.pathSegments.contains('get_funding')) {
      pageList.add(
        const BeamPage(
            child: HomePage(
              isNavigator: true,
            ),
            key: ValueKey('get_funding')),
      );
    }
    return pageList;
  }

  @override
  List<Pattern> get pathPatterns => ["/home", "home/get_funding"];
}
