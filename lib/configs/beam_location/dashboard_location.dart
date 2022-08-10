import 'package:beamer/beamer.dart';
import 'package:cicgreenloan/modules/dashboard/main_dashboard.dart';
import 'package:flutter/material.dart';
import '../../modules/dashboard/buttom_navigation_bar.dart';

class DashboardLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pageList = [
      const BeamPage(
        child: PaymentSchedule(fromPage: 'loginPage'),
        key: ValueKey('home'),
      )
    ];
    if (state.uri.pathSegments.contains('main_dashboard')) {
      pageList.add(
        const BeamPage(child: MainDashboard(), key: ValueKey('main_dashboard')),
      );
    }

    return pageList;
  }

  @override
  List<Pattern> get pathPatterns => ["/home", "/home/main_dashboard"];
}
