import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../modules/privilege_program/screen/choose_gift_template.dart';
import '../../custom_menu_holder.dart';

class CustomCardGiftMVPForm extends StatelessWidget {
  final String? acountName;
  final String? accountNumber;
  final String? imageAccount;
  final String? defaultImage;
  final GestureTapCallback? onTapHistory;
  final GestureTapCallback? onTapEdit;
  final GestureTapCallback? onTapDeleted;
  final int? id;
  const CustomCardGiftMVPForm({
    super.key,
    this.acountName,
    this.accountNumber,
    this.imageAccount,
    this.onTapHistory,
    this.onTapEdit,
    this.onTapDeleted,
    this.id,
    this.defaultImage,
  });

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Container(
      height: 70.0,
      width: double.infinity,
      padding: const EdgeInsets.only(
          left: 14.0, top: 10.0, bottom: 10.0, right: 10.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withAlpha(30),
          blurRadius: 6,
          offset: const Offset(0, 1),
        )
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blueAccent.withOpacity(0.1),
              // image: DecorationImage(
              //   image: NetworkImage(
              //     imageAccount ?? '',
              //   ),
              //   fit: BoxFit.cover,
              // ),
            ),
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,
            child: imageAccount != null
                ? CachedNetworkImage(
                    imageUrl: imageAccount ?? '',
                    fit: BoxFit.cover,
                  )
                : Text(
                    defaultImage ?? ' ',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
          ),
          const SizedBox(
            width: 14.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  acountName ?? '',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(
                        accountNumber ?? '',
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          CustomFocusedMenuHolder(
            openWithTap: true,
            blurSize: 0,
            menuWidth: (MediaQuery.of(context).size.width * 0.6),
            blurBackgroundColor: Colors.grey[900]!.withOpacity(0.2),
            menuItems: [
              CustomFocusedMenuItem(
                  mainAxisAlignment: MainAxisAlignment.start,
                  paddingBetweenItem: const EdgeInsets.only(right: 13),
                  title: Text(
                    "Transaction History",
                    style: txtTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    onTapHistory?.call();
                  },
                  leadingIcon: SvgPicture.asset(
                      "assets/images/transaction-history.svg")),
              CustomFocusedMenuItem(
                  paddingBetweenItem: const EdgeInsets.only(right: 13),
                  mainAxisAlignment: MainAxisAlignment.start,
                  title: Text(
                    "Edit Template",
                    style: txtTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    onTapEdit?.call();
                  },
                  leadingIcon:
                      SvgPicture.asset("assets/images/edit-pencil.svg")),
              CustomFocusedMenuItem(
                  paddingBetweenItem: const EdgeInsets.only(right: 13),
                  mainAxisAlignment: MainAxisAlignment.start,
                  title: Text(
                    "Delete Template",
                    style: txtTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    // onTapDeleted?.call();
                    if (Platform.isIOS) {
                      buildAlertIos(context, txtTheme, id);
                    } else {
                      buildAlertAndroid(context, txtTheme, id);
                    }
                  },
                  leadingIcon: SvgPicture.asset("assets/images/trash.svg"))
            ],
            onPressed: () {
              debugPrint('Hello');
            },
            child: const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.more_vert,
                size: 20,
                color: Colors.black,
              ),
            ),
          )

          //More Option

          // PopupMenuButton(
          //   color: Colors.white,
          //   offset: const Offset(0, 35),
          //   padding: EdgeInsets.zero,
          //   elevation: 1,
          //   shape: const RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
          //   ),
          //   icon: const
          // Align(
          //     alignment: Alignment.topRight,
          //     child: Icon(
          //       Icons.more_vert,
          //       size: 20,
          //       color: Colors.black,
          //     ),
          //   ),
          //   itemBuilder: (BuildContext context) => <PopupMenuEntry>[
          //     PopupMenuItem(
          //       padding: const EdgeInsets.only(right: 10, left: 10),
          //       child: GestureDetector(
          //         onTap: onTapHistory,
          //         child: Container(
          //           color: Colors.transparent,
          //           height: 49,
          //           child: Row(
          //             children: [
          //               const SizedBox(width: 18.0),
          //               SvgPicture.asset(
          //                 'assets/images/history.svg',
          //                 color: Colors.black,
          //                 width: 22,
          //               ),
          //               const SizedBox(width: 15.0),
          //               Expanded(
          //                 child: Text(
          //                   "Transaction History",
          //                   style: Theme.of(context)
          //                       .textTheme
          //                       .titleSmall!
          //                       .copyWith(
          //                           fontWeight: FontWeight.w400,
          //                           color: AppColor.darkColor),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //     const PopupMenuDivider(height: 0),
          //     PopupMenuItem(
          //       padding: const EdgeInsets.only(right: 10, left: 10),
          //       child: GestureDetector(
          //         onTap: onTapEdit,
          //         child: Container(
          //           height: 49,
          //           color: Colors.transparent,
          //           child: Row(
          //             children: [
          //               const SizedBox(width: 18.0),
          //               SvgPicture.asset(
          //                 'assets/images/menu_edit.svg',
          //               ),
          //               const SizedBox(width: 15.0),
          //               Expanded(
          //                 child: Text(
          //                   "Edit Template",
          //                   style: Theme.of(context)
          //                       .textTheme
          //                       .titleSmall!
          //                       .copyWith(
          //                           fontWeight: FontWeight.w400,
          //                           color: AppColor.darkColor),
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //     const PopupMenuDivider(height: 0),
          //     PopupMenuItem(
          //       padding: const EdgeInsets.only(right: 10, left: 10),
          //       child: GestureDetector(
          //         onTap: onTapDeleted,
          //         child: Container(
          //           color: Colors.transparent,
          //           height: 49,
          //           child: Row(
          //             children: [
          //               const SizedBox(width: 18.0),
          //               SvgPicture.asset(
          //                 'assets/images/new_getfunding_delete.svg',
          //                 color: Colors.black,
          //               ),
          //               const SizedBox(width: 15.0),
          //               Expanded(
          //                 child: Text(
          //                   "Delete Template",
          //                   style: Theme.of(context)
          //                       .textTheme
          //                       .titleSmall!
          //                       .copyWith(
          //                           fontWeight: FontWeight.w400,
          //                           color: AppColor.darkColor),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
