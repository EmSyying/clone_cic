import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:cicgreenloan/utils/helper/container_partern.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'custom_invest_amount_card.dart';

class CustomBulletPaymentCard extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final bool? isRenewal;
  final Widget? child;
  final String? investAmount;
  final bool isFromCreate;
  final String? textUSD;
  final bool? isAnnullyRate;

  const CustomBulletPaymentCard({
    Key? key,
    this.isAnnullyRate = false,
    this.child,
    this.subTitle,
    this.title,
    this.isRenewal = false,
    this.investAmount,
    this.isFromCreate = false,
    this.textUSD,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bulletCon = Get.put(PriceController());
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                borderRaduis,
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 7,
                    spreadRadius: 4,
                    color: Colors.grey.shade200)
              ]),
          child: Column(
            children: [
              bulletCon.productCode.value == 'MPC-0001'
                  ? Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColor.mainColor.withOpacity(0.2)),
                      child: SvgPicture.asset(
                        'assets/images/principal_compounding.svg',
                        width: 30,
                        height: 30,
                      ))
                  : bulletCon.productCode.value == 'MPD-0002'
                      ? Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColor.mainColor.withOpacity(0.2)),
                          child: SvgPicture.asset(
                            'assets/images/principal_deduction.svg',
                            width: 30,
                            height: 30,
                          ),
                        )
                      : SvgPicture.asset('assets/images/svgfile/bullet.svg'),
              const SizedBox(height: 20),
              Text(
                '$title',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              if (isAnnullyRate == false)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/svgfile/star.svg'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      subTitle != null ? '$subTitle' : '0% annally',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              Container(
                decoration: DottedDecoration(shape: Shape.line),
              ),
              const SizedBox(height: 20),
              CustomInvestAmonutCard(
                textUsd: textUSD,
                isFromCreate: isFromCreate,
                isColors: true,
                title: 'Investment Amount',
                investAmount: investAmount,
              ),
              const SizedBox(height: 30),
              Container(child: child!)
            ],
          ),
        ),
      ],
    );
  }
}
