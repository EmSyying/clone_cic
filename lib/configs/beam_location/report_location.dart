import 'package:beamer/beamer.dart';
import 'package:cicgreenloan/modules/report_module/screens/report.dart';
import 'package:flutter/material.dart';

import '../../modules/dashboard/buttom_navigation_bar.dart';

class ReportLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pageList = [
      const BeamPage(
        child: PaymentSchedule(),
        key: ValueKey("home"),
      )
    ];
    if (state.uri.pathSegments.contains('report')) {
      pageList.add(
        const BeamPage(
          child: Report(),
          key: ValueKey('report'),
        ),
      );
    }
    return pageList;
  }

  @override
  List<Pattern> get pathPatterns => ["/home", "/home/report"];
}
