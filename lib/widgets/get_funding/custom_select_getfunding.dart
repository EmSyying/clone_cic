import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';

class CustomSelectgetFunding extends StatelessWidget {
  final String? title;
  final VoidCallback? ontap;
  final bool? onSelect;
  const CustomSelectgetFunding(
      {Key? key, this.title, this.ontap, this.onSelect})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: onSelect!
                ? Theme.of(context).primaryColor.withOpacity(0.2)
                : AppColor.dividerBackground,
            borderRadius: BorderRadius.circular(5)),
        height: 35,
        width: 95,
        alignment: Alignment.center,
        child: Text(
          title!,
          style: TextStyle(
              color: onSelect! ? Theme.of(context).primaryColor : Colors.black),
        ),
      ),
    );
  }
}
