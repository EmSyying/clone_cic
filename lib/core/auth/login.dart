import 'dart:async';

import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/widgets/defualt_size_web.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  String? flagEmoji = "🇰🇭";

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
                    Image.asset(
                      'assets/images/Logo/cic.png',
                      width: 100,
                    ),
                    const Text(
                      'Welcome to',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        color: AppColor.mainColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'CiC Mobile App',
                      // style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      //       color: AppColor.mainColor,
                      //     )
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        color: AppColor.mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
                          prefix: InkWell(
                            child: Text(
                              flagEmoji!,
                              style: const TextStyle(fontSize: 26),
                            ),
                            onTap: () {
                              showCountryPicker(
                                  favorite: <String>['KH'],
                                  showPhoneCode: true,
                                  context: context,
                                  countryListTheme: CountryListThemeData(
                                    // flagSize: 25,

                                    backgroundColor: Colors.white,
                                    textStyle: const TextStyle(
                                        fontSize: 16, color: Colors.blueGrey),
                                    bottomSheetHeight: MediaQuery.of(context)
                                            .size
                                            .height *
                                        0.8, // Optional. Country list modal height
                                    //Optional. Sets the border radius for the bottomsheet.
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                    //Optional. Styles the search field.
                                    inputDecoration: InputDecoration(
                                      focusColor:
                                          Theme.of(context).primaryColor,
                                      labelText: 'Search',
                                      hintText: 'Start typing to search',
                                      prefixIcon: const Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xFF8C98A8)
                                              .withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onSelect: (Country country) {
                                    setState(() {
                                      flagEmoji = country.flagEmoji;
                                      // _authController.countryCode.value =
                                      //     country.phoneCode;
                                    });
                                    debugPrint(
                                        "Phone Number code: ${_authController.countryCode.value}");
                                  });
                            },
                          ),
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
}
