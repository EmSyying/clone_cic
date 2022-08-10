// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_svg/svg.dart';

import '../../Utils/helper/color.dart';

class CustomButtonSelected extends StatefulWidget {
  final bool? isDasable;
  final String? title;
  final GestureTapCallback? onPressed;
  final bool? isSelect;
  final bool? isOutline;
  final iconUrl;
  const CustomButtonSelected(
      {Key? key,
      this.title,
      this.isDasable = false,
      this.isSelect = false,
      this.onPressed,
      this.isOutline = false,
      this.iconUrl})
      : super(key: key);

  @override
  State<CustomButtonSelected> createState() => _CustomButtonSelectedState();
}

class _CustomButtonSelectedState extends State<CustomButtonSelected> {
  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? SizedBox(
            height: 60,
            width: double.infinity,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              color: AppColor.mainColor,
              onPressed: widget.onPressed!,
              child: Text(
                widget.title!,
                style: Theme.of(context).textTheme.button,
              ),
            ),
          )
        : Platform.isAndroid
            ? SizedBox(
                height: 60,
                width: double.infinity,
                //outline False---------------------
                child: !widget.isOutline!
                    ? RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20),
                        color: AppColor.mainColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                widget.iconUrl != null
                                    ? SvgPicture.asset(widget.iconUrl)
                                    : Container(),
                                if (widget.iconUrl != null)
                                  const SizedBox(
                                    width: 15,
                                  ),
                                Text(
                                  widget.title!,
                                  style: Theme.of(context).textTheme.button,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                              child: widget.isSelect!
                                  ? SvgPicture.asset(
                                      'assets/images/Circle Check-selected.svg')
                                  : const Image(
                                      image: AssetImage(
                                          'assets/images/Circle_outline.png'),
                                    ),
                            ),
                          ],
                        ),
                        onPressed: () => widget.onPressed,
                      )
                    //outline true----------------------
                    : OutlinedButton(
                        // color: Theme.of(context).primaryColor,
                        // borderSide: BorderSide(
                        //     width: 1,
                        //     color: widget.isSelect!
                        //         ? Theme.of(context).primaryColor
                        //         : Colors.black12),
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(
                        //     8.0,
                        //   ),
                        // ),
                        // padding: const EdgeInsets.symmetric(
                        //     vertical: 15.0, horizontal: 20),
                        onPressed: widget.isDasable! ? null : widget.onPressed!,
                        // color: Theme.of(context).primaryColor,
                        // borderSide: BorderSide(
                        //     width: 1,
                        //     color: widget.isSelect!
                        //         ? Theme.of(context).primaryColor
                        //         : Colors.black12),
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(
                        //     8.0,
                        //   ),
                        // ),
                        // padding: const EdgeInsets.symmetric(
                        //     vertical: 15.0, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                widget.iconUrl != null
                                    ? SvgPicture.asset(widget.iconUrl)
                                    : Container(),
                                if (widget.iconUrl != null)
                                  const SizedBox(
                                    width: 15,
                                  ),
                                Text(
                                  widget.title!,
                                  style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: widget.isDasable!
                                          ? Colors.grey
                                          : Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                              child: widget.isSelect!
                                  ? SvgPicture.asset(
                                      'assets/images/Circle Check-selected.svg')
                                  : const Image(
                                      image: AssetImage(
                                          'assets/images/Circle_outline.png'),
                                    ),
                            ),
                          ],
                        ),
                      ),
              )
            : Platform.isIOS
                ? SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: !widget.isOutline!
                        ? CupertinoButton(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            color: AppColor.mainColor,
                            onPressed: widget.onPressed!,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    widget.iconUrl != null
                                        ? SvgPicture.asset(widget.iconUrl)
                                        : Container(),
                                    if (widget.iconUrl != null)
                                      const SizedBox(
                                        width: 15,
                                      ),
                                    Text(
                                      widget.title!,
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                  child: widget.isSelect!
                                      ? SvgPicture.asset(
                                          'assets/images/Circle Check-selected.svg')
                                      : const Image(
                                          image: AssetImage(
                                              'assets/images/Circle_outline.png'),
                                        ),
                                ),
                              ],
                            ),
                          )
                        : GestureDetector(
                            onTap: widget.isDasable! ? null : widget.onPressed,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: widget.isSelect!
                                          ? Theme.of(context).primaryColor
                                          : Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      widget.iconUrl != null
                                          ? SvgPicture.asset(widget.iconUrl)
                                          : Container(),
                                      if (widget.iconUrl != null)
                                        const SizedBox(
                                          width: 15,
                                        ),
                                      Text(
                                        widget.title!,
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: widget.isDasable!
                                                ? Colors.grey
                                                : Theme.of(context)
                                                    .primaryColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                    child: widget.isSelect!
                                        ? SvgPicture.asset(
                                            'assets/images/Circle Check-selected.svg')
                                        : const Image(
                                            image: AssetImage(
                                                'assets/images/Circle_outline.png'),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                : SizedBox(
                    height: 60,
                    width: double.infinity,
                    //outline False---------------------
                    child: !widget.isOutline!
                        ? RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20),
                            color: AppColor.mainColor,
                            onPressed: widget.onPressed!,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    widget.iconUrl != null
                                        ? SvgPicture.asset(widget.iconUrl)
                                        : Container(),
                                    if (widget.iconUrl != null)
                                      const SizedBox(
                                        width: 15,
                                      ),
                                    Text(
                                      widget.title!,
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                  child: widget.isSelect!
                                      ? SvgPicture.asset(
                                          'assets/images/Circle Check-selected.svg')
                                      : const Image(
                                          image: AssetImage(
                                              'assets/images/Circle_outline.png'),
                                        ),
                                ),
                              ],
                            ),
                          )
                        //outline true----------------------
                        : OutlinedButton(
                            // color: Theme.of(context).primaryColor,
                            // borderSide: BorderSide(
                            //     width: 1,
                            //     color: widget.isSelect!
                            //         ? Theme.of(context).primaryColor
                            //         : Colors.black12),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(
                            //     8.0,
                            //   ),
                            // ),
                            // padding: const EdgeInsets.symmetric(
                            //     vertical: 15.0, horizontal: 20),
                            onPressed:
                                widget.isDasable! ? null : widget.onPressed!,
                            // color: Theme.of(context).primaryColor,
                            // borderSide: BorderSide(
                            //     width: 1,
                            //     color: widget.isSelect!
                            //         ? Theme.of(context).primaryColor
                            //         : Colors.black12),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(
                            //     8.0,
                            //   ),
                            // ),
                            // padding: const EdgeInsets.symmetric(
                            //     vertical: 15.0, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    widget.iconUrl != null
                                        ? SvgPicture.asset(widget.iconUrl)
                                        : Container(),
                                    if (widget.iconUrl != null)
                                      const SizedBox(
                                        width: 15,
                                      ),
                                    Text(
                                      widget.title!,
                                      style: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: widget.isDasable!
                                              ? Colors.grey
                                              : Theme.of(context).primaryColor),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                  child: widget.isSelect!
                                      ? SvgPicture.asset(
                                          'assets/images/Circle Check-selected.svg')
                                      : const Image(
                                          image: AssetImage(
                                              'assets/images/Circle_outline.png'),
                                        ),
                                ),
                              ],
                            ),
                          ),
                  );
  }
}
