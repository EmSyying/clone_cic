import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Utils/helper/container_partern.dart';
import 'bonus/custom_header_bottom_sheet_style.dart';

onShowBottomSheet({
  @required BuildContext? context,
  String? title,
  String? type,
  String? label,
  String? time,
  num? amount,
  Widget? child,
  IconData? icondata,
  Widget? icon,
  Widget? text,
  bool? isscroll = false,
  double? isHeight,
  bool? isLoading = false,
  Color? backgroundColor,
  bool? isNoAppBar = false,
  bool? isDismissible,
  Widget? action,
}) {
  showModalBottomSheet(
    backgroundColor: backgroundColor,
    isDismissible: isDismissible ?? true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10))),
    context: context!,
    isScrollControlled: true,
    builder: (context) {
      return isLoading!
          ? FractionallySizedBox(
              // heightFactor: 20,
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: isHeight ?? MediaQuery.of(context).size.height * 0.9,
                child: SingleChildScrollView(
                  physics: isscroll!
                      ? const ScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 50,
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(borderRaduis),
                            color: Colors.grey[300]),
                      ),
                      Row(
                        children: [
                          icondata != null
                              ? IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(icondata))
                              : icon ??
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: kIsWeb
                                          ? const Icon(Icons.arrow_back)
                                          : Platform.isAndroid
                                              ? const Icon(Icons.arrow_back)
                                              : const Icon(
                                                  Icons.arrow_back_ios),
                                    ),
                                  ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: text ??
                                Text(
                                  title ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(fontSize: 18),
                                ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      Divider(
                        thickness: 1.2,
                        color: Colors.grey[300],
                      ),
                      SingleChildScrollView(
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            child: const SizedBox(
                              height: 150,
                              width: 150,
                              child: Padding(
                                padding: EdgeInsets.all(50.0),
                                child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator()),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ))
          : FractionallySizedBox(
              // heightFactor: 20,
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: isHeight ?? MediaQuery.of(context).size.height * 0.9,
                child: SingleChildScrollView(
                  physics: isscroll!
                      ? const ScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (!isNoAppBar!)
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(borderRaduis),
                              color: Colors.grey[300]),
                        ),
                      if (label != null)
                        const SizedBox(
                          height: 10.0,
                        ),
                      if (!isNoAppBar)
                        label != null
                            ? CustomHeaderBottomStyle(
                                type: type,
                                label: label,
                                time: time,
                                amount: amount,
                                action: action,
                              )
                            : Row(
                                children: [
                                  icondata != null
                                      ? IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(icondata))
                                      : icon ??
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: kIsWeb
                                                  ? const Icon(Icons.arrow_back)
                                                  : Platform.isAndroid
                                                      ? const Icon(
                                                          Icons.arrow_back)
                                                      : const Icon(
                                                          Icons.arrow_back_ios),
                                            ),
                                          ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 50),
                                    child: text ??
                                        Text(
                                          title ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2!
                                              .copyWith(fontSize: 18),
                                        ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                      if (!isNoAppBar)
                        Divider(
                          thickness: 1.2,
                          color: Colors.grey[300],
                        ),
                      SingleChildScrollView(
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            child: child!),
                      ),
                    ],
                  ),
                ),
              ),
            );
    },
  );
}
