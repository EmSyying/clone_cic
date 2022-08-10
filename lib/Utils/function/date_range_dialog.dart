import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/modules/ut_trading/controllers/trading_controller.dart';
import 'package:cicgreenloan/modules/ut_trading/models/last_trading_date_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

final inquityCon = Get.put(InquiryController());

dateRangDialog({
  int? initTabNumber = 0,
  BuildContext? context,
  String? contents,

  // LastTradingData? lastTradingData,
  List<TradingOption>? tradingOptionList,
}) {
  // final lastTradingCon = Get.put(InquiryController());
  return showDialog(
    context: context!,
    builder: (context) => AlertDialog(
      titlePadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(contents!,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: AppColor.textColor, fontWeight: FontWeight.w800)),
            ),
            Obx(
              () => Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: tradingOptionList!
                        .asMap()
                        .entries
                        .map((e) => GestureDetector(
                            onTap: () async {
                              Get.back();
                              // inquityCon.isLoadingCard.value = true;
                              await inquityCon.fetchLastTradingDetail(
                                  id: e.value.id);

                              // Get.back();
                              // Get.back();

                              initTabNumber =
                                  inquityCon.lastTradinInfoIndex.value;

                              // inquityCon.isInitSelct.value = true;

                              inquityCon.isSelect.value = true;
                              inquityCon.lastTradinInfoIndex.refresh();

                              inquityCon.lastTradinInfoIndex.value = e.key;

                              // Get.back();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  Container(
                                    color: inquityCon.isSelect.value &&
                                            inquityCon.lastTradinInfoIndex
                                                    .value ==
                                                e.key
                                        ? Colors.grey[200]
                                        : null,
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.value.label!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                            Text(
                                              '${e.value.date}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: inquityCon.isSelect.value ==
                                                      true &&
                                                  inquityCon.lastTradinInfoIndex
                                                          .value ==
                                                      e.key
                                              ? SvgPicture.asset(
                                                  'assets/images/svgfile/circle_check-selected.svg')
                                              : SvgPicture.asset(
                                                  'assets/images/svgfile/cicle_check.svg'),
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                      endIndent: 0,
                                      height: 0,
                                      indent: 0,
                                      thickness: 1.2,
                                      color: Colors.grey[300])
                                ],
                              ),
                            )))
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
