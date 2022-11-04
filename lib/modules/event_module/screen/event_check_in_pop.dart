import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Utils/form_builder/custom_button.dart';
import '../../../Utils/helper/color.dart';
import '../../../widgets/wallets/custom_positioned_boxshape_circle.dart';
import '../controller/event_controller.dart';

class EventCheckInPOP extends StatelessWidget {
  final bool isSelect;
  const EventCheckInPOP({Key? key, this.isSelect = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contro = Get.put(EventController());

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              spreadRadius: 0.1,
                              offset: const Offset(0, 2),
                              blurRadius: 8),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: SvgPicture.asset(
                                "assets/images/checkIn.svg",
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(
                              bottom: 10.0,
                              top: 20.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: RichText(
                                        text: TextSpan(
                                            text: 'Ticket Numbe',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2!
                                                .copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18.0,
                                                ),
                                            children: const <TextSpan>[
                                              TextSpan(
                                                text: '\n #CiC0534532',
                                                style: TextStyle(
                                                  color: AppColor.mainColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              )
                                            ]),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            decoration: DottedDecoration(
                                strokeWidth: 2,
                                shape: Shape.line,
                                color: const Color(0xffDBDBDB)),
                          ),
                          const SizedBox(height: 15),

                          ///===
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: contro.eventCheckIn
                                .asMap()
                                .entries
                                .map(
                                  (e) => customTitleTicket(
                                    context,
                                    title: e.value.title,
                                    descript: e.value.description,
                                  ),
                                )
                                .toList(),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    //PositionedBoxShapCircle =shap border=====
                    const CustomPositionedBoxShapCircle(
                      top: 216,
                      left: 6,
                    ),
                    const CustomPositionedBoxShapCircle(
                      top: 216,
                      right: 6,
                    ),
                  ],
                ),
                //==========Column Contain 2====
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: 0.1,
                          offset: const Offset(0, 2),
                          blurRadius: 8),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: DottedDecoration(
                            strokeWidth: 2,
                            shape: Shape.line,
                            color: const Color(0xffDBDBDB)),
                      ),
                      const SizedBox(height: 15),

                      ///===
                      Container(
                        margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Guests',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.0,
                                  ),
                            ),
                            const Spacer(),
                            Text(
                              'Select all',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: AppColor.mainColor,
                                  ),
                            ),
                          ],
                        ),
                      ),

                      ///all Guests======

                      Column(
                        children: contro.cardGuestsList
                            .map((e) => customCardGuest(
                                  context,
                                  guest: e.guest,
                                  nameGuest: e.nameGuest,
                                  who: e.who,
                                ))
                            .toList(),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          top: false,
          minimum: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: CustomButton(
            width: double.infinity,
            onPressed: () {},
            isDisable: true,
            isOutline: false,
            title: 'Submit',
          ),
        ),
      ],
    );
  }

  Widget customTitleTicket(BuildContext context,
      {String? title, String? descript}) {
    return Container(
      margin: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: const Color(0xff464646),
                ),
          ),
          Text(
            descript ?? '',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                ),
          ),
        ],
      ),
    );
  }

  Widget customCardGuest(
    BuildContext context, {
    String? guest,
    String? nameGuest,
    String? who,
  }) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  guest ?? '',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Text(
                  'Name',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: const Color(0xff464646),
                      ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text(
                      nameGuest ?? '',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 15.0,
                          ),
                    ),
                    const SizedBox(
                      height: 14,
                      child: VerticalDivider(
                        thickness: 1,
                        width: 30,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      who ?? '',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 15.0,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            //===Check Box====
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color:
                      isSelect ? AppColor.mainColor : AppColor.chartLabelColor,
                  width: 0.6,
                ),
                shape: BoxShape.rectangle,
                color:
                    isSelect ? AppColor.mainColor : Theme.of(context).cardColor,
              ),
              child: isSelect
                  ? Center(
                      child: Icon(
                        Icons.done,
                        size: 16.0,
                        color: isSelect
                            ? AppColor.paymentBackgroundColor
                            : AppColor.chartLabelColor,
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          child: Divider(
            height: 1,
            color: Colors.black12,
          ),
        ),
      ],
    );
  }
}
