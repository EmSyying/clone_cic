import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../modules/privilege_program/controller/privilege_controller.dart';

class CustomFovarite extends StatelessWidget {
  final bool isBoxIsScroll;
  final IconData? icon;
  final Function()? onPressed;
  final int? index;
  final bool? isPrivilege;
  final bool? isFav;
  const CustomFovarite({
    Key? key,
    this.isBoxIsScroll = false,
    this.icon,
    this.onPressed,
    this.index,
    this.isPrivilege = false,
    this.isFav = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preController = Get.put(PrivilegeController());
    return isPrivilege!
        ? Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            width: 22,
            height: 22,
            child: isFav!
                ? SvgPicture.asset(
                    'assets/images/privilege/favorite.svg',
                  )
                : SvgPicture.asset(
                    'assets/images/privilege/heart.svg',
                    color: Colors.red,
                    height: 12,
                  ),
          )
        : Container(
            margin: const EdgeInsets.only(
              right: 20,
            ),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isBoxIsScroll
                  ? Colors.transparent
                  : Colors.white.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                icon: icon == null
                    ? Obx(
                        () => preController.listAllStores[index!].isFav
                            ? SvgPicture.asset(
                                'assets/images/privilege/favorite.svg',
                                height: 20,
                              )
                            : SvgPicture.asset(
                                'assets/images/privilege/heart.svg',
                                height: 20,
                                color: isBoxIsScroll
                                    ? Colors.white
                                    : Colors.black),
                      )
                    : Icon(
                        icon,
                        color: isBoxIsScroll ? Colors.white : Colors.black,
                      ),
                onPressed: onPressed,
              ),
            ),
          );
  }
}
