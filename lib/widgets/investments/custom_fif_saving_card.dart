import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/widgets/investments/fif_contract/custom_popupmenu_item.dart';
import 'package:flutter/material.dart';

class FIFSavingCard extends StatelessWidget {
  //Hide/unhide status of card value
  final bool status;

  ///Show/hide button popupmenu
  final bool showPopUp;

  ///Show Hide Textbutton
  final bool showHidebutton;

  ///Pending popupmenu style
  final bool pendingStyle;

  ///
  final String? title;
  final String? id;
  final String? amount;

  ///actionbutton

  ///amount Color
  final Color? amountColor;

  ///Left sheet color
  final Color? sheetColor;

  ///card background Color
  final Color? backgroundColor;

  ///

  final GestureTapCallback? onTapCard;
  final GestureTapCallback? ontapHide;
  final GestureTapCallback? onTapEdit;
  final GestureTapCallback? ontapAgreement;
  final GestureTapCallback? ontapHistory;
  final GestureTapCallback? ontapCancel;

  final bool? istitle;
  const FIFSavingCard({
    this.showHidebutton = false,
    Key? key,
    this.istitle = false,
    this.title,
    this.id,
    this.amount,
    this.amountColor,
    this.sheetColor,
    this.backgroundColor,
    this.ontapHide,
    this.onTapEdit,
    this.ontapAgreement,
    this.ontapHistory,
    this.ontapCancel,
    this.status = true,
    this.showPopUp = true,
    this.pendingStyle = false,
    this.onTapCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: Container(
        height: 85.0,
        margin: const EdgeInsets.only(left: 20, top: 10, bottom: 8, right: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 3.0),
                color: Colors.grey[200]!,
                blurRadius: 6,
                spreadRadius: 0)
          ],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: const Color(0xffAFAFAF).withOpacity(0.25), width: 1),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 4,
                // padding:
                //     const EdgeInsets.symmetric(horizontal: 5, vertical: 45),
                color: sheetColor,
                // child: Container(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 15, bottom: showPopUp ? 15 : 0, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$title',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    fontSize: 15,
                                    fontFamily: "DMSans-Bold",
                                    fontWeight: FontWeight.w700),
                          ),
                          showPopUp
                              ? PopupMenuButton(
                                  color: Colors.white,
                                  offset: const Offset(0, 35),
                                  padding: const EdgeInsets.only(
                                      left: 30, bottom: 8),
                                  elevation: 3,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.more_horiz,
                                    color: Theme.of(context).primaryColor,
                                  ),

                                  ///
                                  itemBuilder: (BuildContext context) =>
                                      pendingStyle
                                          ? <PopupMenuEntry>[
                                              PopupMenuItem(
                                                padding: EdgeInsets.zero,
                                                child: CustomPopUpMenu(
                                                  onTap: onTapEdit,
                                                  imagePath:
                                                      "assets/images/menu_edit.svg",
                                                  title: istitle!
                                                      ? "Edit Application"
                                                      : "Rename Title",
                                                ),
                                              ),
                                              const PopupMenuDivider(height: 0),
                                              PopupMenuItem(
                                                padding: EdgeInsets.zero,
                                                child: CustomPopUpMenu(
                                                  onTap: ontapCancel,
                                                  textColor:
                                                      AppColor.newRedStatus,
                                                  imagePath:
                                                      "assets/images/cancel_certificate.svg",
                                                  title: "Cancel Application",
                                                ),
                                              ),
                                            ]
                                          : <PopupMenuEntry>[
                                              PopupMenuItem(
                                                padding: EdgeInsets.zero,
                                                child: CustomPopUpMenu(
                                                  onTap: ontapHide,
                                                  imagePath: !status
                                                      ? 'assets/images/eye_hide.svg'
                                                      : 'assets/images/eye_unhide.svg',
                                                  title: !status
                                                      ? 'Hide Contract'
                                                      : 'Unhide Contract',
                                                ),
                                              ),
                                              const PopupMenuDivider(height: 0),

                                              ///
                                              PopupMenuItem(
                                                padding: EdgeInsets.zero,
                                                child: CustomPopUpMenu(
                                                  onTap: onTapEdit,
                                                  imagePath:
                                                      "assets/images/menu_edit.svg",
                                                  title: "Rename Title",
                                                ),
                                              ),
                                              const PopupMenuDivider(height: 0),

                                              ///
                                              PopupMenuItem(
                                                padding: EdgeInsets.zero,
                                                child: CustomPopUpMenu(
                                                  onTap: ontapAgreement,
                                                  imagePath:
                                                      "assets/images/document.svg",
                                                  title: "View Agreement",
                                                ),
                                              ),

                                              ///
                                              // PopupMenuItem(
                                              //   padding: EdgeInsets.zero,
                                              //   child: CustomPopUpMenu(
                                              //     onTap: ontapHistory,
                                              //     imagePath:
                                              //         "assets/images/clock.svg",
                                              //     title: "Principal History",
                                              //   ),
                                              // ),
                                            ],
                                )
                              : const SizedBox.shrink(),
                          if (showHidebutton)
                            GestureDetector(
                              onTap: ontapHide,
                              child: Text(
                                'Unhide',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        color: AppColor.mainColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(
                        height: !showPopUp ? 15 : 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            id ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "$amount",
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontSize: 14,
                                      color: amountColor ?? Colors.black,
                                      fontFamily: "DMSans-Bold",
                                      fontWeight: FontWeight.w700,
                                    ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
