import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatefulWidget {
  final String? title;
  final GestureTapCallback? onPressed;
  final bool? isDisable;
  final bool? isOutline;
  final String? iconUrl;
  const CustomButton(
      {Key? key,
      this.title,
      this.onPressed,
      this.isDisable,
      this.isOutline,
      this.iconUrl})
      : super(key: key);

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
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              color: AppColor.mainColor,
              onPressed: widget.onPressed,
              child: Text(
                widget.title!,
                style: Theme.of(context).textTheme.button,
              ),
            ),
          )
        : Platform.isAndroid
            ? SizedBox(
                height: 50,
                width: double.infinity,
                child: !widget.isDisable! && !widget.isOutline!
                    // ignore: deprecated_member_use
                    ? RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        color: AppColor.mainColor,
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
                              style: Theme.of(context).textTheme.button,
                            ),
                          ],
                        ),
                      )
                    : widget.isOutline! && !widget.isDisable!
                        // ignore: deprecated_member_use
                        ? OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              side: const BorderSide(color: AppColor.mainColor),
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
                            ? RaisedButton(
                                onPressed: null,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Text(widget.title!,
                                    style: Theme.of(context).textTheme.button),
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
                                    child: const Text('Save Draft'),
                                  )
                                // ignore: deprecated_member_use
                                : RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    color: AppColor.mainColor,
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
                                              .button,
                                        ),
                                      ],
                                    ),
                                  ),
              )
            : Platform.isIOS
                ? SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: !widget.isDisable! && !widget.isOutline!
                        ? CupertinoButton(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            color: AppColor.mainColor,
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
                                  style: Theme.of(context).textTheme.button,
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
                                      border: Border.all(
                                          color:
                                              Theme.of(context).primaryColor),
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
                                      Text(
                                        widget.title!,
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : widget.isDisable! && !widget.isOutline!
                                ? CupertinoButton(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    color: AppColor.mainColor,
                                    onPressed: null,
                                    child: Text(
                                      widget.title!,
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  )
                                : CupertinoButton(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    color: AppColor.mainColor,
                                    onPressed: null,
                                    child: Text(
                                      widget.title!,
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                  )
                : Container();
  }
}