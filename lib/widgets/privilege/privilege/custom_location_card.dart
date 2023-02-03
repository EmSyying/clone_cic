import 'package:cicgreenloan/modules/privilege_program/model/search_loation_list/search_location_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Utils/helper/color.dart';

class CustomLocationCard extends StatelessWidget {
  final SearchLocationListModel? locatModel;
  const CustomLocationCard({Key? key, this.locatModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.2,
            color: AppColor.chartLabelColor,
          ),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/privilege/location_svg.svg',
          ),
          const SizedBox(
            width: 14.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  locatModel!.province ?? '',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                ),
                Text(
                  locatModel!.fullAdress ?? '',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.2,
                      ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
