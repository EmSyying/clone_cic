import 'dart:io';

import 'package:cicgreenloan/Utils/helper/custom_appbar_colorswhite.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/defualt_size_web.dart';
import '../../../widgets/investments/deposit_card.dart';
import '../controller/investment_controller.dart';

class DepositeScreen extends StatefulWidget {
  const DepositeScreen({Key? key, this.id}) : super(key: key);

  final int? id;

  @override
  State<DepositeScreen> createState() => _DepositeScreenState();
}

class _DepositeScreenState extends State<DepositeScreen> {
  final fifController = Get.put(PriceController());
  @override
  void initState() {
    fifController.fetchFiFBank();
    if (widget.id != null) {
      fifController.fetchConfirmDetail(widget.id);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultSizeWeb(
        child: Scaffold(
          appBar: CustomAppBarWhiteColor(
            context: context,
            title: fifController.fiFApplicationDetailModel.value.accountName,
            leading: IconButton(
              icon: Platform.isIOS
                  ? const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.arrow_back,
                    ),
              onPressed: () {
                // fifController.tapcurrentIndex.value = 1;
                Navigator.pop(context);
              },
            ),
          ),
          body: fifController.isLoadingDetailAcc.value
              ? const LinearProgressIndicator()
              : DepositCard(
                  title: 'Amount to deposit',
                  amount: fifController
                      .fiFApplicationDetailModel.value.investmentAmount,
                ),
        ),
      ),
    );
  }
}
