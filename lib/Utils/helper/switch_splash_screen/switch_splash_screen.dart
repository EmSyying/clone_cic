import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../modules/member_directory/controllers/customer_controller.dart';
import '../../app_settings/controllers/appsetting_controller.dart';

class SwitchSplashScreen extends StatefulWidget {
  final Offset offset;
  final String? userType;
  const SwitchSplashScreen({Key? key, required this.offset, this.userType})
      : super(key: key);

  @override
  State<SwitchSplashScreen> createState() => _BooksState();
}

class _BooksState extends State<SwitchSplashScreen>
    with SingleTickerProviderStateMixin {
  final _settingCon = Get.put(SettingController());
  final _cusCon = Get.put(CustomerController());
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      await _settingCon.onSwitchScreen(
          value: widget.userType == 'am' ? true : false);
      await _settingCon.onGetScreenMode();
      await _settingCon.fetchSetting(userType: widget.userType);
      await _settingCon.fetchAppBottomBar(userType: widget.userType);
      await _settingCon.fetchAppSetting(
          context: context,
          isSwitchSplashScreen: true,
          userType: widget.userType);
      await _cusCon.getUser();
    });
    super.initState();
    _settingCon.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      upperBound: 1.3,
    );

    _settingCon.animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _settingCon.animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _settingCon.animationController,
        child:
            // SvgPicture.asset('assets/images/svgfile/swich-am.svg'),
            Scaffold(
          // backgroundColor: Theme.of(context).primaryColor,
          body:
              // Stack(
              //   children: [
              Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff3588E8),
                Color(0xff384593),
              ],
            )),
            child: Center(
              child:
                  SvgPicture.asset('assets/images/svgfile/cic_Logo_switch.svg'),
            ),
          ),
          // Obx(() => _settingCon.isLoading.value
          //     ?
          //     // SvgPicture.asset(
          //     //     'assets/images/svgfile/swich-am.svg',)
          //     const Center(
          //         child: CircularProgressIndicator(
          //           color: Colors.white,
          //         ),
          //       )
          //     : Container()),
          //   ],
          // ),
        ),
        builder: (context, child) {
          // animationController.reverse().then((value) => Navigator.pop(context));
          return ClipPath(
            clipper: MyClipPath(
                value: _settingCon.animationController.value,
                offset: widget.offset),
            child: child,
          );
        });
  }
}

class MyClipPath extends CustomClipper<Path> {
  MyClipPath({this.value, this.offset});
  final double? value;
  final Offset? offset;
  @override
  Path getClip(Size size) {
    var path = Path();
    path.addOval(
      Rect.fromCircle(
        center: offset!,
        radius: value! * size.height,
      ),
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
