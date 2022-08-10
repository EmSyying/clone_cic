import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../modules/dashboard/buttom_navigation_bar.dart';
import '../../modules/dashboard/dashboard.dart';

class InvestmentLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pageList = [
      const BeamPage(
        child: PaymentSchedule(),
        key: ValueKey("home"),
      )
    ];
    if (state.uri.pathSegments.contains('investment_location')) {
      pageList.add(
        const BeamPage(
            child: Dashboard(isNavigator: true),
            key: ValueKey('investment_location')),
      );
    }
    return pageList;
  }

  @override
  List<Pattern> get pathPatterns => ["/home", "home/investment_location"];
}
