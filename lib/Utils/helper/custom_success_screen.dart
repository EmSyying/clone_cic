import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomSucessScreen extends StatelessWidget {
  final String? title;
  final String? appbarTitle;
  final String? buttonTitle;
  final String? description;
  final EdgeInsetsGeometry? descriptionPadding;

  final Widget? icon;
  final Color? backgroundColor;
  final GestureTapCallback? onPressedButton;
  const CustomSucessScreen({
    Key? key,
    this.title,
    this.description,
    this.icon,
    this.onPressedButton,
    this.buttonTitle,
    this.backgroundColor,
    this.descriptionPadding,
    this.appbarTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        body: SafeArea(
          minimum: const EdgeInsets.only(bottom: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (appbarTitle != null)
                Text(
                  appbarTitle!,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              const Spacer(),

              ///
              icon ??
                  LottieBuilder.asset(
                    "assets/images/animation/done_animation.json",
                    height: 200,
                    repeat: false,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    frameRate: FrameRate(60),
                    options: LottieOptions(enableMergePaths: true),
                  ),
              Text(
                "$title",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: descriptionPadding ??
                    const EdgeInsets.symmetric(horizontal: 70),
                child: Text(
                  description ?? "",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.white,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),

              ///
              const Spacer(flex: 2),
              GestureDetector(
                onTap: onPressedButton,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Done",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: "SFProDisplayBold"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
