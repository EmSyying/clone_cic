import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/color.dart';
import '../../../Utils/helper/container_partern.dart';
import '../../../Utils/helper/format_number.dart';

class CustomSubscriptionCard extends StatelessWidget {
  const CustomSubscriptionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subscribeCon = Get.put(BonusController());
    return Obx(
      () => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRaduis),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(30),
              blurRadius: 6,
              offset: const Offset(0, 1),
            ),
          ],
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/images/svgfile/totalUT.svg'),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total UT',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                if (subscribeCon.utSubscription.value.unpaidUt != 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Unpaid UT',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                        subscribeCon.utSubscription.value.totalUt != null
                            ? '${FormatNumber.formatNumberDefualt(subscribeCon.utSubscription.value.totalUt!)}'
                            : "0",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 16, fontWeight: FontWeight.w500)),
                    const SizedBox(width: 5),
                    Text(
                      'UT',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                if (subscribeCon.utSubscription.value.unpaidUt != 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text(
                            FormatToK.digitNumber(
                                subscribeCon.utSubscription.value.unpaidUt),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.statusColor['late'])),
                        const SizedBox(width: 5),
                        Text(
                          'UT',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.statusColor['late']),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
