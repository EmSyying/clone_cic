import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/helper/color.dart';
import '../../../../Utils/helper/container_partern.dart';

class CustomInvesDuration extends StatelessWidget {
  final String? duraton;
  // final Function? onTab;
  final bool isSeleced;
  final Function? onTap;
  final investDuraionCon = Get.put(BonusController());

  CustomInvesDuration(
      {Key? key, this.duraton, this.isSeleced = false, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(duraton),
      child: Container(
        width: 80,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRaduis),
          color: isSeleced == true
              ? Theme.of(context).primaryColor.withOpacity(0.3)
              : Colors.grey[200],
        ),
        child: Center(
            child: Text(
          duraton!,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
