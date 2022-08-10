import 'package:cicgreenloan/widgets/ut_tradding/sub_min_max.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../Utils/helper/color.dart';

class CustomMaxMinCard extends StatelessWidget {
  final bool? isLoading;
  final String? maximum;
  final String? base;
  final String? minimum;
  final bool isOpen;
  const CustomMaxMinCard(
      {Key? key,
      this.base,
      this.maximum,
      this.minimum,
      this.isLoading = false,
      this.isOpen = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90,
      decoration: BoxDecoration(
          color: AppColor.mainColor, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20.0),
              height: double.infinity,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[Color(0xff0f488e), Color(0xff0B3C7C)],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 20.0,
            bottom: 0,
            child: Row(
              children: [
                Expanded(
                  child: minimum == null
                      ? const SubMinMax(
                          title: "Minimum",
                          price: '--',
                        )
                      : SubMinMax(
                          title: "Minimum",
                          price: isOpen == true ? minimum : '--',
                        ),
                ),
                Expanded(
                  child: base == null
                      ? const SubMinMax(
                          title: "Base",
                          price: "--",
                        )
                      : SubMinMax(
                          title: "Base",
                          price: isOpen == true ? base : '--',
                        ),
                ),
                Expanded(
                  child: maximum == null
                      ? const SubMinMax(
                          title: "Maximum",
                          price: "--",
                        )
                      : SubMinMax(
                          title: "Maximum",
                          price: isOpen == true ? maximum : '--',
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
