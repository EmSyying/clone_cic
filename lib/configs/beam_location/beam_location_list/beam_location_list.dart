import 'package:beamer/beamer.dart';

import '../dashboard_location.dart';
import '../directory_location.dart';
import '../get_funding_location.dart';
import '../invesment_location.dart';
import '../on_boarding_location.dart';
import '../report_location.dart';
import '../set_pin_code_verify_password_location.dart';
import '../splash_screen_location.dart';
import '../ut_trading_location.dart';
import '../wallet_location.dart';

class BeamLocationList {
  static final routerDelegate = BeamerDelegate(
    initialPath: '/splash_screen',
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        SplashScreenLocation(),
        OnBoardingLocation(),
        InvestmentLocation(),
        WalletLocation(),
        GetFundingLocation(),
        UtTrandingLocation(),
        ReportLocation(),
        DirectoryLocation(),
        SetPinCodeVerifyPassword(),
        DashboardLocation()
      ],
    ),
  );
}
