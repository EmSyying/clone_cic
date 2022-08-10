// ignore_for_file: must_be_immutable

import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  final String? accountName;
  final String? content;
  final String? image;
  final Function? onTab;
  late int? currentIndex;
  late int? selectIndex;
  final bool? isSeleted;

  PaymentCard({
    Key? key,
    this.isSeleted,
    this.accountName,
    this.content,
    this.image,
    this.onTab,
    this.currentIndex = 0,
    this.selectIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTab!(),
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 1,
                color: currentIndex != selectIndex
                    ? Colors.grey[300]!
                    : AppColor.mainColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('$image'), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$accountName',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    '$content',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
            selectIndex != currentIndex
                ? Icon(
                    Icons.circle_outlined,
                    color: Colors.grey[400],
                  )
                : const Icon(
                    Icons.check_circle,
                    color: AppColor.mainColor,
                  ),
          ],
        ),
      ),
    );
  }
}
