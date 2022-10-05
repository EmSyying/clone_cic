import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
CustomAppBar(
    {required BuildContext context,
    Widget? leading,
    List<Widget>? action,
    required String? title,
    Widget? iconBack,
    double? elevation,
    Color? backgroundColor,
    bool? isLeading,
    bool? isLogo = true,
    bool? isCallonPressed = false,
    VoidCallback? onPressed,
    GestureTapCallback? onTap}) {
  return AppBar(
    centerTitle: false,
    automaticallyImplyLeading: false,
    // ignore: deprecated_member_use
    brightness: Get.theme.brightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark,
    elevation: elevation ?? 1.0,
    actions: action,
    backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
    //  backgroundColor: DynamicTheme.of(context).brightness == Brightness.light
    //      ? Theme.of(context).primaryColor
    //      : Color(0xffDEE8E9).withOpacity(0.1),
    // leading: leading,
    title: leading != null
        ? Row(
            children: [
              leading,
              const SizedBox(
                width: 10,
              ),
              if (isLeading != null && isLeading)
                const SizedBox(
                  width: 10,
                ),
              if (!isLogo!)
                SvgPicture.asset(
                  'assets/images/svgfile/Logocic.svg',
                  height: 27,
                ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: SizedBox(
                  width: action != null
                      ? MediaQuery.of(context).size.width * 0.45
                      : MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    title!,
                    style: Theme.of(context).textTheme.headline6,
                    // style: TextStyle(
                    //     fontFamily: 'DMSans',
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 25),
                    // maxLines: 1,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          )
        : Row(
            children: [
              if (isLeading != null && isLeading)
                IconButton(
                  onPressed: isCallonPressed == false
                      ? () {
                          // Beamer.of(context!).beamBack();
                          Navigator.pop(context);
                        }
                      : onPressed,
                  icon: kIsWeb
                      ? const Icon(Icons.arrow_back)
                      : Icon(Platform.isAndroid
                          ? Icons.arrow_back
                          : Icons.arrow_back_ios),
                ),
              // if (isLeading != null && isLeading)
              //   const SizedBox(
              //     width: 10,
              //   ),
              if (!isLogo!)
                SvgPicture.asset(
                  'assets/images/svgfile/Logocic.svg',
                  height: 27,
                ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: SizedBox(
                  width: action != null
                      ? MediaQuery.of(context).size.width * 0.45
                      : MediaQuery.of(context).size.width * 0.9,
                  child: !isLogo
                      ? GestureDetector(
                          onTap: onTap,
                          child: Text(
                            title!,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(right: 70),
                          child: Center(
                            child: Text(
                              title!,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
  );
}
