import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_controller/auth_controller.dart';
import '../../generated/l10n.dart';
import 'package:go_router/go_router.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: const Text("Registration Screen"),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           context.go("/login");
      //         },
      //         icon: const Icon(Icons.navigate_next))
      //   ],
      // ),
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        // const Color(0xff83A9D2).withOpacity(.0),
                        const Color(0xff83A9D2).withOpacity(.4),
                        // const Color(0xff83A9D2).withOpacity(.8),
                        const Color(0xff83A9D2),
                        const Color(0xff4483CB),
                      ]),
                ),
              ),
            ),
          ],
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: Get.height * .1),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/Logo/CIC_Logo.svg',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 34),
                child: Text(
                  "Welcome to",
                  style: textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "CiC Mobile App",
                  style: textTheme.bodyMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
                child: CupertinoTextField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  key: const Key('phoneNumber'),
                  onSubmitted: (v) {
                    _authController.checkPhoneNumber(context);
                    FocusScope.of(context).unfocus();
                  },
                  textInputAction: TextInputAction.done,
                  controller: _authController.phoneController.value,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                  prefix: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: InkWell(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              flagEmoji!,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              "+${_authController.countryCode.value}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "|",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: const Color(0xffEBEBEB),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w100),
                          ),
                        ],
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
                                focusColor: Theme.of(context).primaryColor,
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
                                _authController.countryCode.value =
                                    country.phoneCode;
                              });
                              debugPrint(
                                  "Phone Number code: ${_authController.countryCode.value}");
                            });
                      },
                    ),
                  ),
                  // padding: const EdgeInsets.all(15.0),
                  placeholder: "Phone Number",

                  keyboardType: TextInputType.number,
                  placeholderStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                  decoration: BoxDecoration(
                      color: const Color(0xff4483CB).withOpacity(.1),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(6)),
                  suffix: IconButton(
                    key: const Key("registerIcon"),
                    icon: _authController.checkRegisteredLoading.value
                        ? const CupertinoActivityIndicator()
                        : const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                    onPressed: () {
                      // _authController.checkPhoneNumber(context);
                    },
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: GestureDetector(
                  onTap: () {
                    context.go("/login");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Text(
                        "Login",
                        style: textTheme.bodyMedium!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
