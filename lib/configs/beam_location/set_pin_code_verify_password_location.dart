import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../core/auth/set_pin_code.dart';
import '../../core/auth/verify_set_password.dart';

class SetPinCodeVerifyPassword extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pageList = [
      const BeamPage(
        child: VerifySetPassword(),
        key: ValueKey('verify_set_password'),
      )
    ];
    if (state.uri.pathSegments.contains('set_pin_code')) {
      pageList.add(
        const BeamPage(
          key: ValueKey('set_pin_code'),
          child: SetPinCode(),
        ),
      );
    }
    return pageList;
  }

  @override
  List<Pattern> get pathPatterns =>
      ["/verify_set_password", "/verify_set_password/set_pin_code"];
}
