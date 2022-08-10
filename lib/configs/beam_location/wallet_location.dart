import 'package:beamer/beamer.dart';
import 'package:cicgreenloan/modules/bonus/screens/bonus_screen.dart';
import 'package:flutter/material.dart';

import '../../modules/dashboard/buttom_navigation_bar.dart';

class WalletLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pageList = [
      const BeamPage(
        child: PaymentSchedule(),
        key: ValueKey('home'),
      )
    ];
    if (state.uri.pathSegments.contains('wallet')) {
      pageList.add(
        const BeamPage(
          child: BonusScreen(),
          key: ValueKey('wallet'),
        ),
      );
    }
    return pageList;
  }

  @override
  List<Pattern> get pathPatterns => ["/home", "/home/wallet"];
}
