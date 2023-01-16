// ignore_for_file: use_key_in_widget_constructors

import 'package:cicgreenloan/modules/get_funding/models/appliication_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/helper/container_partern.dart';

class ApplicationCard extends StatelessWidget {
  final ApplicationData? model;

  final GestureTapCallback? onTapEdit;
  final GestureTapCallback? onTapDelete;
  final String? isGrid;

  const ApplicationCard({
    this.model,
    this.isGrid,
    this.onTapEdit,
    this.onTapDelete,
  });
  @override
  Widget build(BuildContext context) {
    return isGrid == "false"
        ? Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: padding,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0.0, 0.0),
                          color: Colors.black12,
                          blurRadius: 4),
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    model!.status != "Draft"
                        ? SvgPicture.asset('assets/images/application.svg')
                        : SvgPicture.asset('assets/images/save_draft.svg'),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    model!.companyName! != ""
                                        ? model!.companyName!
                                        : "No Company",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            fontFamily: "DMSans-Bold",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/images/svgfile/timeIcon.svg'),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  model!.updatedAt!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff464646)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              if (model!.status != "Draft")
                                CircleAvatar(
                                  radius: 5,
                                  backgroundColor: model!.status == 'Review'
                                      ? const Color(0xffE28112)
                                      : model!.status == 'Approved'
                                          ? const Color(0xff75BF72)
                                          : model!.status == 'Rejected'
                                              ? Colors.red
                                              : model!.status == 'New'
                                                  ? const Color(0xff0685CF)
                                                  : Colors.black,
                                ),
                              if (model!.status != "Draft")
                                const SizedBox(
                                  width: 10,
                                ),
                              if (model!.status != "Draft")
                                Text(
                                  model!.status!,
                                  style: TextStyle(
                                    fontFamily: 'DMSans-Medium',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: model!.status == 'Review'
                                        ? const Color(0xffE28112)
                                        : model!.status == 'Approved'
                                            ? const Color(0xff75BF72)
                                            : model!.status == 'Rejected'
                                                ? Colors.red
                                                : model!.status == 'New'
                                                    ? const Color(0xff0685CF)
                                                    : Colors.black,
                                  ),
                                )
                              else
                                Row(
                                  children: [
                                    Text(
                                      "Save Draft",
                                      style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: model!.status == 'Reviewing'
                                            ? const Color(0xffE28112)
                                            : model!.status == 'Approved'
                                                ? const Color(0xff75BF72)
                                                : model!.status == 'Rejected'
                                                    ? Colors.red
                                                    : model!.status == 'New'
                                                        ? const Color(
                                                            0xff0685CF)
                                                        : Theme.of(context)
                                                            .primaryColor,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        model!.countDownDate! != 0
                                            ? "(Expire in ${model!.countDownDate} days)"
                                            : "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ///Popup Menu
              model!.status == "Draft"
                  ? Positioned(
                      top: 15,
                      right: 0,
                      child: PopupMenuButton(
                        color: Colors.white,
                        offset: const Offset(0, 35),

                        elevation: 2,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        icon: const Icon(
                          Icons.more_horiz,
                          size: 22,
                          color: Color(0xff464646),
                        ),

                        ///
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                          PopupMenuItem(
                            padding: EdgeInsets.zero,
                            child: GestureDetector(
                              onTap: onTapEdit,
                              child: Container(
                                constraints:
                                    const BoxConstraints(minHeight: 45),
                                padding:
                                    const EdgeInsets.only(left: 18, right: 10),
                                color: Colors.transparent,
                                height: 40.0,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/getfunding _edit.svg'),
                                    const SizedBox(width: 15.0),
                                    const Text("Edit Application")
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const PopupMenuDivider(height: 0),
                          PopupMenuItem(
                            onTap: null,
                            padding: EdgeInsets.zero,
                            child: GestureDetector(
                              onTap: onTapDelete,
                              child: Container(
                                constraints:
                                    const BoxConstraints(minHeight: 45),
                                padding:
                                    const EdgeInsets.only(left: 18, right: 10),
                                color: Colors.transparent,
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/new_getfunding_delete.svg'),
                                    const SizedBox(width: 13.0),
                                    const Text(
                                      "Delete Application",
                                      style: TextStyle(color: Colors.red),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
            ],
          )
        : Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0.0, 0.0),
                      color: Colors.black12,
                      blurRadius: 4),
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: borderRaduis),
                  alignment: Alignment.center,
                  child: model!.status != "Draft"
                      ? SvgPicture.asset('assets/images/svgfile/docIcon.svg')
                      : SvgPicture.asset(
                          'assets/images/svgfile/drafticons.svg'),
                ),
                Text(
                  model!.companyName!,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: borderRaduis),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/svgfile/timeIcon.svg'),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        model!.updatedAt!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: model!.status == 'Reviewing'
                          ? const Color(0xffE28112)
                          : model!.status == 'Approved'
                              ? const Color(0xff75BF72)
                              : model!.status == 'Rejected'
                                  ? Colors.red
                                  : model!.status == 'New'
                                      ? const Color(0xff0685CF)
                                      : Colors.black,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      model!.status!,
                      style: const TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 12,
                        color: "status" == 'Reviewing'
                            ? Color(0xffE28112)
                            : "status" == 'Approved'
                                ? Color(0xff75BF72)
                                : "status" == 'Rejected'
                                    ? Colors.red
                                    : "status" == 'New'
                                        ? Color(0xff0685CF)
                                        : Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
