import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:cicgreenloan/Utils/helper/container_partern.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/investment_module/model/fif_application/withdraw_notice/withdraw_notice.dart';

class WithdrawNoticeCard extends StatelessWidget {
  const WithdrawNoticeCard({
    Key? key,
    this.title,
    this.description,
    this.optionTitle,
    this.optionDescription,
    this.withdrawNotice,
  }) : super(key: key);
  final String? title;
  final String? description;
  final String? optionTitle;
  final String? optionDescription;
  final List<WithdrawNotice>? withdrawNotice;
  @override
  Widget build(BuildContext context) {
    final fifController = Get.put(PriceController());
    return Container(
      margin: const EdgeInsets.all(20),
      // padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRaduis),
          color: AppColor.statusColor['pending']!.withOpacity(0.2)),
      child: Column(
        children: [
          Column(
            children: fifController
                .fifAccountDetailModel.value.withdrawalNotice!
                .asMap()
                .entries
                .map((e) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: AppColor.statusColor['pending'],
                        ),
                        const SizedBox(width: 15),
                        Text(
                          e.value.title ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.statusColor['pending']),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      e.value.description ?? '',
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),
                    if (e.value.options != null && e.value.options!.isNotEmpty)
                      Column(
                        children: e.value.options!.asMap().entries.map((e) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Icon(
                                  Icons.check_circle,
                                  color: AppColor.statusColor['pending'],
                                  size: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(e.value.title ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        e.value.description ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
