import 'package:cicgreenloan/modules/privilege_program/screen/privilege_point/point_emptystate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../widgets/privilege/custom_shimmer_point.dart';
import '../../../../widgets/privilege/privilege_point/custom_recent_card.dart';
import '../../../wallet/controller/wallet_controller.dart';

class RecentPointScreen extends StatelessWidget {
  const RecentPointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final walletController = Get.put(WalletController());
    walletController.onFetchRecentActivitiesTransaction();

    return Obx(
      () => walletController.isRecentActivitiesTransaction.value
          ? Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const CustomShimmerPoint();
                  }),
            )
          : walletController.recentActivitiesTransactionList.isNotEmpty
              ? SingleChildScrollView(
                  child: Column(
                      children: walletController.recentActivitiesTransactionList
                          .asMap()
                          .entries
                          .map((e) {
                    return CustomRecentCard(
                      onTap: () {
                        context.push('/recent-activity?id=${e.value.id}');
                      },
                      id: e.value.id,
                      shopLogo: e.value.shopLogo,
                      shopName: e.value.shopName,
                      description: e.value.description,
                      date: e.value.date,
                      code: e.value.code,
                      pointAmount: e.value.pointAmount,
                      label: e.value.label,
                    );
                  }).toList()),
                )
              : const PiointEmptyState(
                  title: 'No transaction yet!',
                  description: '',
                ),
    );
  }
}

// class RecentCardModel {
//   final String? title, datetime, action, image;
//   final int? price, minusPoint;

//   RecentCardModel(
//       {this.title,
//       this.datetime,
//       this.action,
//       this.price,
//       this.minusPoint,
//       this.image});
// }

// List<RecentCardModel> recentCardList = [
//   RecentCardModel(
//     title: 'Champei SpaLorem Ipsum Cham ...',
//     datetime: '23 December 2022',
//     price: 540,
//     minusPoint: 500,
//     action: 'APGQ',
//     image:
//         'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
//   ),
//   RecentCardModel(
//     title: 'Champei SpaLorem Ipsum Cham ...',
//     datetime: '23 December 2022',
//     price: 540,
//     minusPoint: 500,
//     action: 'APGQ',
//     image:
//         'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
//   ),
//   RecentCardModel(
//     title: 'Champei SpaLorem Ipsum Cham ...',
//     datetime: '23 December 2022',
//     price: 540,
//     minusPoint: 500,
//     action: 'APGQ',
//     image:
//         'https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg',
//   ),
// ];
