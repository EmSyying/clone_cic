import 'package:flutter/material.dart';

import '../../Utils/helper/color.dart';

// ignore: must_be_immutable
class FilterByType extends StatelessWidget {
  final bool? isSelect;
  final String? display;
  const FilterByType({Key? key, this.display, this.isSelect = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 16.0),
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                border: Border.all(
                  color:
                      isSelect! ? AppColor.mainColor : AppColor.chartLabelColor,
                  width: 0.6,
                ),
                shape: BoxShape.rectangle,
                color: Theme.of(context).cardColor,
              ),
              child: isSelect!
                  ? Center(
                      child: Icon(
                        Icons.done,
                        size: 18.0,
                        color: isSelect!
                            ? AppColor.mainColor
                            : AppColor.chartLabelColor,
                      ),
                    )
                  : Container(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 15.0),
                child: Text(
                  display!,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: isSelect! ? AppColor.mainColor : Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
