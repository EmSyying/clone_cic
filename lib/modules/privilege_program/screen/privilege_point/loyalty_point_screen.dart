import 'package:cicgreenloan/widgets/privilege/privilege_point/custom_transaction_point_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/privilege/custom_shimmer_point.dart';
import '../../../wallet/controller/wallet_controller.dart';

class LoyaltyPointScreen extends StatelessWidget {
  const LoyaltyPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    return SingleChildScrollView(
      child: Obx(
        () => walletController.isMyPoint.value
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomShimmerPoint(),
              )
            : Column(
                children: loyaltyCardList.asMap().entries.map((e) {
                return CustomTransactionPoint(
                  title: e.value.title,
                  point: e.value.point,
                  svg: e.value.image,
                  datetime: e.value.datetime,
                );
              }).toList()),
      ),
    );
  }
}

class LoyaltyCardModel {
  final String? title, datetime, image;
  final int? point;

  LoyaltyCardModel({this.title, this.datetime, this.point, this.image});
}

List<LoyaltyCardModel> loyaltyCardList = [
  LoyaltyCardModel(
    title: 'Lorem ipsum dolor sit amet consecteture cuis mollis turbime.',
    datetime: '23 December 2022',
    point: 300,
    image: 'assets/images/union_point_card.png',
  ),
  LoyaltyCardModel(
    title: 'Lorem ipsum dolor sit amet consecteture cuis mollis turbime.',
    datetime: '23 December 2022',
    point: 300,
    image: 'assets/images/union_point_card.png',
  ),
  LoyaltyCardModel(
    title: 'Lorem ipsum dolor sit amet consecteture cuis mollis turbime.',
    datetime: '23 December 2022',
    point: 300,
    image: 'assets/images/union_point_card.png',
  ),
];
