import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatefulWidget {
  final String? title;
  final GestureTapCallback? onPressed;
  @required
  final bool? isDisable;
  @required
  final bool? isOutline;
  final String? iconUrl;
  final Color? backgroundColor;
  final Color? colorText;
  final double? height;
  final double? width;
  final bool isCardInvestfif;
  final TextStyle? style;
  const CustomButton({
    Key? key,
    this.colorText,
    this.backgroundColor,
    this.title,
    this.onPressed,
    this.isDisable,
    this.isOutline,
    this.iconUrl,
    this.height,
    this.width,
    this.isCardInvestfif = false,
    this.style,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? SizedBox(
            height: 50,
            width: double.infinity,
            // ignore: deprecated_member_use
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                backgroundColor:
                    widget.backgroundColor ?? Theme.of(context).primaryColor,
              ),
              onPressed: widget.onPressed,
              child: Text(
                widget.title!,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          )
        : Platform.isAndroid
            ? SizedBox(
                height: widget.isCardInvestfif == false ? 50 : widget.height,
                width: widget.isCardInvestfif ? double.infinity : widget.width,
                child: !widget.isDisable! && !widget.isOutline!
                    // ignore: deprecated_member_use
                    ? GestureDetector(
                        onTap: widget.onPressed,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: widget.backgroundColor ??
                                  Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              widget.iconUrl != null
                                  ? SvgPicture.asset(widget.iconUrl!)
                                  : Container(),
                              if (widget.iconUrl != null)
                                const SizedBox(
                                  width: 15,
                                ),
                              widget.colorText != null
                                  ? Text(
                                      widget.title!,
                                      style: widget.isCardInvestfif == false
                                          ? Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(color: widget.colorText)
                                          : widget.style,
                                    )
                                  : Text(
                                      widget.title!,
                                      style: widget.isCardInvestfif == false
                                          ? Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(color: Colors.white)
                                          : widget.style,
                                    ),
                            ],
                          ),
                        ),
                      )
                    : widget.isOutline! && !widget.isDisable!
                        // ignore: deprecated_member_use
                        ? OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            onPressed: widget.onPressed,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                widget.iconUrl != null
                                    ? SvgPicture.asset(widget.iconUrl!)
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
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                          )
                        : widget.isDisable! && !widget.isOutline!
                            // ignore: deprecated_member_use
                            ? SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: null,
                                  style: ElevatedButton.styleFrom(
                                    disabledBackgroundColor:
                                        widget.backgroundColor!,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15.0,
                                    ),
                                  ),
                                  child: Text(widget.title!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                              color: widget.colorText ??
                                                  Colors.grey)),
                                ),
                              )
                            : widget.isDisable! && widget.isOutline!
                                // ignore: deprecated_member_use
                                ? OutlinedButton(
                                    onPressed: null,

                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    // shape: RoundedRectangleBorder(
                                    //     borderRadius:
                                    //         BorderRadius.circular(80)),
                                    child: Text(
                                      widget.title!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(color: Colors.grey),
                                    ),
                                  )
                                // ignore: deprecated_member_use
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      backgroundColor: widget.backgroundColor ??
                                          Theme.of(context).primaryColor,
                                    ),
                                    onPressed: widget.onPressed,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        widget.iconUrl != null
                                            ? SvgPicture.asset(widget.iconUrl!)
                                            : Container(),
                                        if (widget.iconUrl != null)
                                          const SizedBox(
                                            width: 15,
                                          ),
                                        Text(
                                          widget.title!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                      ],
                                    ),
                                  ),
              )
            : Platform.isIOS
                ? SizedBox(
                    height:
                        widget.isCardInvestfif == false ? 50 : widget.height,
                    width: widget.isCardInvestfif == false
                        ? double.infinity
                        : widget.width,
                    child: !widget.isDisable! && !widget.isOutline!
                        ? CupertinoButton(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            color: widget.backgroundColor ??
                                Theme.of(context).primaryColor,
                            onPressed: widget.onPressed,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                widget.iconUrl != null
                                    ? SvgPicture.asset(widget.iconUrl!)
                                    : Container(),
                                if (widget.iconUrl != null)
                                  const SizedBox(
                                    width: 15,
                                  ),
                                widget.colorText != null
                                    ? Text(
                                        widget.title!,
                                        style: widget.isCardInvestfif == false
                                            ? Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(
                                                    color: widget.colorText)
                                            : widget.style,
                                      )
                                    : Text(
                                        widget.title!,
                                        style: widget.isCardInvestfif == false
                                            ? Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(color: Colors.white)
                                            : widget.style,
                                      ),
                              ],
                            ),
                          )
                        : widget.isOutline! && !widget.isDisable!
                            ? GestureDetector(
                                onTap: widget.onPressed,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: widget.backgroundColor ??
                                          Colors.transparent,
                                      border: Border.all(
                                        color: widget.backgroundColor ??
                                            Theme.of(context).primaryColor,
                                      ),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      widget.iconUrl != null
                                          ? SvgPicture.asset(widget.iconUrl!)
                                          : Container(),
                                      if (widget.iconUrl != null)
                                        const SizedBox(
                                          width: 15,
                                        ),
                                      widget.colorText != null
                                          ? Text(
                                              widget.title!,
                                              style: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: widget.colorText,
                                              ),
                                            )
                                          : Text(
                                              widget.title!,
                                              style: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              )
                            : widget.isDisable! && !widget.isOutline!
                                ? CupertinoButton(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    color: widget.backgroundColor ??
                                        Theme.of(context).primaryColor,
                                    onPressed: null,
                                    child: Text(
                                      widget.title!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                              color: widget.colorText ??
                                                  Colors.grey),
                                    ),
                                  )
                                : CupertinoButton(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    color: widget.backgroundColor ??
                                        Theme.of(context).primaryColor,
                                    onPressed: null,
                                    child: Text(
                                      widget.title!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(color: Colors.grey),
                                    ),
                                  ),
                  )
                : Container();
  }
}
