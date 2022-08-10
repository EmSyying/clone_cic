import 'package:beamer/beamer.dart';
import 'package:cicgreenloan/modules/member_directory/screens/directory.dart';
import 'package:flutter/material.dart';

import '../../modules/dashboard/buttom_navigation_bar.dart';

class DirectoryLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pageList = [
      const BeamPage(
        child: PaymentSchedule(),
        key: ValueKey("home"),
      )
    ];
    if (state.uri.pathSegments.contains('directory_member')) {
      pageList.add(
        const BeamPage(
            child: Directory(isNavigator: true),
            key: ValueKey('directory_member')),
      );
    }
    return pageList;
  }

  @override
  List<Pattern> get pathPatterns => ["/home", "home/directory_member"];
}
