import 'package:beamer/beamer.dart';
import 'package:cicgreenloan/modules/ut_trading/screens/trading_platform.dart';
import 'package:flutter/material.dart';

import '../../modules/dashboard/buttom_navigation_bar.dart';

class UtTrandingLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pageList = [
      const BeamPage(
        child: PaymentSchedule(),
        key: ValueKey('home'),
      )
    ];
    if (state.uri.pathSegments.contains('ut_trading')) {
      pageList.add(const BeamPage(
        child: UTtrading(),
        key: ValueKey("ut_trading"),
      ));
    }
    return pageList;
  }

  @override
  List<Pattern> get pathPatterns => ["/home", "/home/ut_trading"];
}
