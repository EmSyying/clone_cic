import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/investment_module/controller/investment_controller.dart';

final fifCon = Get.put(PriceController());

customShowBottomSheet(
    {BuildContext? context,
    String? title,
    Widget? widget,
    Widget? bottomBar,
    GestureTapCallback? onTap,
    Widget? leading}) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      context: context!,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: leading ??
                        IconButton(
                          icon: Platform.isIOS
                              ? const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                )
                              : const Icon(Icons.arrow_back,
                                  color: Colors.black),
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text(
                      '$title',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Text(''),
                ],
              ),
              Divider(
                thickness: 1.2,
                color: Colors.grey[300],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: widget,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: bottomBar,
              )
            ],
          ),
        );
      });
}
