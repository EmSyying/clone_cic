import 'package:cicgreenloan/modules/member_directory/controllers/customer_controller.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/post_data.dart';
import 'package:cicgreenloan/modules/ut_trading/controllers/trading_controller.dart';
import 'package:cicgreenloan/modules/ut_trading/models/trading_model.dart';
import 'package:cicgreenloan/widgets/learning/custom_player_bottom_sheet.dart';
import 'package:cicgreenloan/widgets/learning/custom_video_shimmer.dart';
import 'package:cicgreenloan/widgets/ut_tradding/custom_expantion_cards.dart';
import 'package:flutter/material.dart';
import 'package:cicgreenloan/Utils/custom_video_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Utils/helper/color.dart';

class UTManagement extends StatefulWidget {
  final List<VideoPost>? videoTrading;
  const UTManagement({Key? key, this.videoTrading}) : super(key: key);
  @override
  State<UTManagement> createState() => _UTManagementState();
}

class _UTManagementState extends State<UTManagement> {
  final inquiryController = Get.put(InquiryController());
  final constomerController = Get.put(CustomerController());
  List<InquiryModel> listSuccess = [];

  bool isExpandScope = false;
  bool isExpandTradeMethod = false;
  bool isExpandTradeSession = false;
  @override
  void initState() {
    inquiryController.getInstruction();
    inquiryController.getVideoTrading();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (context) => CupertinoPageScaffold(
          child: Scaffold(
            body: Obx(
              () => inquiryController.isVideoTrading.value
                  ? const CustomVideoShimmer()
                  : Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    bottom: 15,
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: inquiryController
                                          .instructionData.data!
                                          .map((e) {
                                        return CustomExpansionCards(
                                          isExpand: isExpandTradeSession,
                                          title: e.key!,
                                          description: e.value!,
                                        );
                                      }).toList()),
                                ),
                                if (inquiryController
                                    .videoTradingList.isNotEmpty)
                                  Container(
                                    height: 13,
                                    width: double.infinity,
                                    color: AppColor.dividerBackground,
                                  ),
                                if (inquiryController
                                    .videoTradingList.isNotEmpty)
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 20.0, left: 20.0),
                                    child: Text(
                                      'Video Trading',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ),
                                if (inquiryController
                                    .videoTradingList.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 15),
                                    child: Column(
                                        children: inquiryController
                                            .videoTradingList
                                            .asMap()
                                            .entries
                                            .map((e) {
                                      return VideoCard(
                                        onTap: () {
                                          customPlayerBottomSheet(
                                              context: context, video: e.value);
                                        },
                                        videoDuration: e.value.duration!,
                                        title: e.value.title!,
                                        vidoeURL: e.value.video!,
                                        trainerName: e.value.trainer!,
                                        pitching: e.value.module!.title!,
                                        thumnail: e.value.image!,
                                      );
                                    }).toList()),
                                  ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        showButton(),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showButton() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
          border: BorderDirectional(
            top: BorderSide(
                color: Colors.grey, width: 0.2, style: BorderStyle.solid),
          ),
          color: Colors.white),
      child: Container(
        height: 50.0,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
        child: CustomButton(
          isDisable: false,
          isOutline: false,
          title: 'Close',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
