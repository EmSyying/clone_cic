import 'package:flutter/material.dart';

class ProductTypeDetailText extends StatelessWidget {
  const ProductTypeDetailText(
      {Key? key, this.label, this.value, this.isAmount = false, this.isPassive})
      : super(key: key);
  final String? label;
  final String? value;
  final bool? isAmount;
  final String? isPassive;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label',
          style:
              Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 14),
        ),
        Text(
          value ?? '',
          style: isPassive != null
              ? Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: isPassive!.toLowerCase() == 'passive'
                      ? Colors.red
                      : Colors.green)
              : Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isAmount == true ? Colors.red : Colors.black),
        ),
      ],
    );
  }
}
