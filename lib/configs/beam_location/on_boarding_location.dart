import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../core/auth/login.dart';
import '../../core/auth/login_with_password.dart';
import '../../core/walk_through/start_slide.dart';
import '../../modules/setting_modules/screens/sub_setting_screen/contract_terms.dart';

class OnBoardingLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pageList = [
      const BeamPage(child: StartupSlide(), key: ValueKey('on_boarding'))
    ];
    if (state.uri.pathSegments.contains('construct_term')) {
      pageList.add(
        const BeamPage(
          child: ContractTerm(),
          key: ValueKey('construct_term'),
        ),
      );
    }
    if (state.uri.pathSegments.contains('log_in')) {
      pageList.add(
        const BeamPage(
          key: ValueKey('log_in'),
          child: LoginScreen(),
        ),
      );
    }
    if (state.uri.pathSegments.contains('log_in_with_password')) {
      pageList.add(
        const BeamPage(
          key: ValueKey('log_in_with_password'),
          child: LoginWithPassWord(),
        ),
      );
    }
    return pageList;
  }

  @override
  List<Pattern> get pathPatterns => [
        "/on_boarding",
        "/on_boarding/construct_term",
        "/on_boarding/contruct_term/log_in",
        "/on_boarding/contruct_term/log_in/log_in_with_password"
      ];
}
