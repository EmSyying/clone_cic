import 'package:beamer/beamer.dart';
import 'package:cicgreenloan/core/walk_through/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreenLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pageList = [
      const BeamPage(
          child: Splashscreen(),
          key: ValueKey("splash_screen"),
          type: BeamPageType.fadeTransition)
    ];
    return pageList;
  }

  @override
  List<Pattern> get pathPatterns => ["/splash_screen"];
}
