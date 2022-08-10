import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Utils/helper/container_partern.dart';

class CustomMakePaymentCard extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final Function? onTab;
  final bool? isDisable;
  const CustomMakePaymentCard(
      {Key? key, this.title, this.imageUrl, this.onTab, this.isDisable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isDisable! ? null : onTab!(),
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRaduis),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withAlpha(30),
                  offset: const Offset(0, 1),
                  blurRadius: 6)
            ]),
        child: Row(
          children: [
            SvgPicture.asset(
              imageUrl!,
              color: isDisable! ? Colors.grey[300] : null,
            ),
            const SizedBox(width: 10),
            Text(
              title!,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: isDisable! ? Colors.grey[300] : null),
            )
          ],
        ),
      ),
    );
  }
}
