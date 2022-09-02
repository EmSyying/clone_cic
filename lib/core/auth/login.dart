import 'dart:async';

import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../../Utils/helper/color.dart';
import 'auth_controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String? languageCode = 'kh';

  Future<void> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    languageCode = prefs.getString('locale');
    if (prefs != null) {
      S.load(const Locale("en"));
    } else {
      S.load(const Locale('en'));
    }
  }

  @override
  void initState() {
    getLanguage();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    getLanguage();

    super.didChangeDependencies();
  }

  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: DefaultSizeWeb(
        child: Scaffold(
          key: _scaffoldKey,
          body: Obx(
            () => SafeArea(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/Logo/cic.png',
                        width: 160,
                      ),
                    ),
                    Text(S.of(context).continuePhone,
                        style: Theme.of(context).textTheme.headline1),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(S.of(context).enterPinCode,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(S.of(context).enterPhone,
                            style: Theme.of(context).textTheme.bodyText1),
                        CupertinoTextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          key: const Key('phoneNumber'),
                          onSubmitted: (v) {
                            _authController.checkPhoneNumber(context);
                            FocusScope.of(context).unfocus();
                          },
                          textInputAction: TextInputAction.done,
                          controller: _authController.phoneController.value,
                          style: Theme.of(context).textTheme.headline2,
                          prefix: _buildContryCodePicker(context),
                          padding: const EdgeInsets.all(15.0),
                          placeholder: S.of(context).enterPhone,
                          keyboardType: TextInputType.number,
                          placeholderStyle:
                              Theme.of(context).textTheme.bodyText1,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: AppColor.mainColor))),
                          suffix: IconButton(
                            key: const Key("registerIcon"),
                            icon: _authController.checkRegisteredLoading.value
                                ? const CupertinoActivityIndicator()
                                : Icon(
                                    Icons.arrow_forward_ios,
                                    color: Theme.of(context).primaryColor,
                                    size: 16,
                                  ),
                            onPressed: () {
                              _authController.checkPhoneNumber(context);
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 80.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  CountryCodePicker _buildContryCodePicker(BuildContext context) {
    return CountryCodePicker(
      searchStyle: TextStyle(
          fontFamily: 'Montserrat', color: Theme.of(context).primaryColor),
      textStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontFamily: 'Montserrat',
          color: Theme.of(context).primaryColor),
      dialogTextStyle: TextStyle(
          fontFamily: 'Montserrat', color: Theme.of(context).primaryColor),
      initialSelection: 'Kh',
      favorite: const ['+855', 'Kh'],
      onChanged: (e) {
        _authController.countryCode.value = e.dialCode!;
      },
    );
  }
}
