// import 'package:cicgreenloan/pages/security/loginwithpassword.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:cicgreenloan/main.dart' as app;
// import 'package:cicgreenloan/pages/security/loginwithpassword.dart'
//     as loginWithPassWord;
// import 'package:cicgreenloan/pages/splashScreen/start_slide.dart' as startslide;

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   group('end-to-end test', () {
//     testWidgets('tap on the floating action button, verify counter',
//         (WidgetTester tester) async {
//       app.main();

//       await tester.pumpAndSettle(Duration(seconds: 5));

//       // loginWithPassWord.LoginWithPassWord();
//       // Verify the counter starts at 0.
//       final Finder fab = find.byKey(Key("SkipStartSlide"));
//       await tester.tap(fab);

//       // Finds the floating action button to tap on.
//       // final Finder fab = find.byTooltip('SkipStartSlide');
//       // expect(find.text('Welcome'), findsOneWidget);
//       // expect(find.text('Allow'), findsOneWidget);
//       // // Emulate a tap on the floating action button.
//       // // await tester.tap(fab);
//       await tester.pumpAndSettle(Duration(seconds: 1));
//       final Finder ihaveread = find.byKey(Key("IhaveReadAndAgree"));
//       await tester.tap(ihaveread);
//       await tester.pumpAndSettle(Duration(seconds: 1));
//       //final password = find.byKey(Key("phoneNumber"));
//       final phonenumberworng = find.byKey(Key("phoneNumber"));
//       await tester.enterText(phonenumberworng, "09999");
//       await tester.pumpAndSettle(Duration(milliseconds: 500));
//       final Finder registerIconwrong = find.byKey(Key("registerIcon"));
//       await tester.tap(registerIconwrong);

//       // expect(find.text('invalid'), findsOneWidget);
//       await tester.pumpAndSettle(Duration(milliseconds: 500));
//       final phonenumber = find.byKey(Key("phoneNumber"));
//       await tester.enterText(phonenumber, "099994334");
//       await tester.pumpAndSettle(Duration(seconds: 1));
//       final Finder registerIcon = find.byKey(Key("registerIcon"));
//       await tester.tap(registerIcon);
//       await tester.pumpAndSettle(Duration(seconds: 1));
//       final passwordwrong = find.byKey(Key("password"));
//       await tester.enterText(passwordwrong, "Chhan3");
//       await tester.pumpAndSettle(Duration(seconds: 1));
//       final Finder loginwrong = find.byKey(Key("Login"));
//       await tester.tap(loginwrong);
//       await tester.pumpAndSettle(Duration(seconds: 1));
//       final password = find.byKey(Key("password"));
//       await tester.enterText(password, "Chhany12");
//       await tester.pumpAndSettle(Duration(seconds: 1));
//       final Finder login = find.byKey(Key("Login"));
//       await tester.tap(login);
//       await tester.pumpAndSettle(Duration(seconds: 5));

//       // // Trigger a frame.
//       // await tester.pumpAndSettle();

//       // Verify the counter increments by 1.
//     });
//   });
// }
