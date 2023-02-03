import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'fif_contract/custom_popupmenu_item.dart';

class FamilySaving extends StatelessWidget {
  const FamilySaving({
    Key? key,
    this.image,
    this.title,
    this.subTitle,
    this.investmentAmount,
    this.interestEarned,
    this.isMoreIcon = false,
    this.isHideEarned = true,
    this.ontapHide,
    this.ontapAgreement,
    this.ontapHistory,
    this.status = true,
    this.ontapRename,
  }) : super(key: key);
  final String? image;
  final String? title;
  final String? subTitle;
  final String? investmentAmount;
  final String? interestEarned;
  final bool? isMoreIcon;
  final bool? isHideEarned;
  final bool status;

  final GestureTapCallback? ontapHide;
  final GestureTapCallback? ontapRename;
  final GestureTapCallback? ontapAgreement;
  final GestureTapCallback? ontapHistory;

  @override
  Widget build(BuildContext context) {
    // final familyCon =  Get.put(PriceController());
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    '$image',
                    color: Theme.of(context).primaryColor,
                  )),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subTitle ?? '',
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                ],
              ),
              const Spacer(),
              if (isMoreIcon!)
                PopupMenuButton(
                  color: Colors.white,
                  offset: const Offset(0, 35),
                  padding: const EdgeInsets.only(left: 30),
                  elevation: 3,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).primaryColor,
                  ),

                  ///
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      padding: EdgeInsets.zero,
                      child: CustomPopUpMenu(
                        onTap: ontapHide,
                        imagePath: !status
                            ? 'assets/images/eye_hide.svg'
                            : 'assets/images/eye_unhide.svg',
                        title: !status ? 'Hide Contract' : 'Unhide Contract',
                      ),
                    ),
                    const PopupMenuDivider(height: 0),

                    ///
                    PopupMenuItem(
                      padding: EdgeInsets.zero,
                      child: CustomPopUpMenu(
                        onTap: ontapRename,
                        imagePath: "assets/images/menu_edit.svg",
                        title: "Rename Title",
                      ),
                    ),
                    const PopupMenuDivider(height: 0),

                    ///
                    PopupMenuItem(
                      padding: EdgeInsets.zero,
                      child: CustomPopUpMenu(
                        onTap: ontapAgreement,
                        imagePath: "assets/images/document.svg",
                        title: "View Agreement",
                      ),
                    ),
                    const PopupMenuDivider(height: 0),

                    ///
                    PopupMenuItem(
                      padding: EdgeInsets.zero,
                      child: CustomPopUpMenu(
                        onTap: ontapHistory,
                        imagePath: "assets/images/clock.svg",
                        title: "Contract History",
                      ),
                    ),
                  ],
                )
            ],
          ),
        ],
      ),
    );
  }
}
