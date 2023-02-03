import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/ut_trading/controllers/trading_controller.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/modules/ut_trading/models/trading_model.dart';
import 'package:cicgreenloan/widgets/ut_tradding/custom_buy_card.dart';
import 'package:cicgreenloan/widgets/ut_tradding/trading_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CancelTrade extends StatefulWidget {
  const CancelTrade({Key? key}) : super(key: key);

  @override
  State<CancelTrade> createState() => _CancelTradeState();
}

class _CancelTradeState extends State<CancelTrade> {
  final inquiryController = Get.put(InquiryController());
  final int index = 0;
  Future<List<InquiryModel>>? inquiryFuture;
  final refreshKey = GlobalKey<RefreshIndicatorState>();
  final priceController = Get.put(PriceController());
  final constomerController = Get.put(CustomerController());

  Future<void> onRefresh() async {
    inquiryController.page.value = 0;
    inquiryController.update();
  }

  @override
  void initState() {
    inquiryController.getInquiryList(
      'cancelled',
      '',
      constomerController.customer.value.customerId.toString(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // print('Loading cancel ${inquiryController.isLoadingInquiryCancel.value}');
      return !inquiryController.isLoadingInquiryCancel.value &&
              inquiryController.listinquiryData.isEmpty
          ? Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset(
                  'assets/images/svgfile/Trading.svg',
                  height: 100,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'No Share Request',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Text('You can create Sell Share Request',
                //     style: Theme.of(context).textTheme.bodyMedium),
                // Text('by tap on button below.',
                //     style: Theme.of(context).textTheme.bodyMedium),
              ],
            )
          : !inquiryController.isLoadingInquiryCancel.value &&
                  inquiryController.listinquiryData.isNotEmpty
              ? SizedBox(
                  height: 20,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          if (inquiryController.listinquiryData.isNotEmpty)
                            const SizedBox(
                              height: 10,
                            ),
                          if (inquiryController.listinquiryData.isNotEmpty)
                            CustomBuyCard(
                              listData: inquiryController.listinquiryData
                                ..reversed.toList(),
                            ),
                        ],
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[100]!,
                      highlightColor: Colors.white,
                      child: const InquiryCardShimmer(),
                    );
                  },
                  itemCount: 10,
                );
    });
  }
}
