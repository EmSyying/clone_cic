import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Utils/helper/color.dart';

class ComponentCardCategory extends StatelessWidget {
  //final ModelsCategories? modelCardCategory;
  final String? iconCard;
  final String? cardTitle;
  final bool selected;
  final bool widthTrue;
  final bool numStoresTrue;
  final String? numStores;
  final GestureTapCallback? onTapCatego;
  const ComponentCardCategory({
    Key? key,
    //this.modelCardCategory,
    this.selected = false,
    this.onTapCatego,
    this.iconCard,
    this.cardTitle,
    this.widthTrue = false,
    this.numStoresTrue = false,
    this.numStores,
  }) : super(key: key);
//==
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTapCatego,
          child: Container(
            height: 80,
            width: widthTrue == true ? double.infinity : 150,
            // margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              border: Border.all(
                color: selected ? AppColor.mainColor : Colors.white,
                width: 1.0,
              ),
              color: AppColor.arrowforwardColor['dark'],
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[600]!.withOpacity(0.1),
                  spreadRadius: 0.1,
                  blurRadius: 5,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: -5,
                  right: -5,
                  child: SvgPicture.network(
                    iconCard ?? '',
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 14.0, right: 14.0, top: 10.0, bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cardTitle ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        numStoresTrue == true
                            ? Text(
                                '25 Stores',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.chartLabelColor,
                                      fontSize: 12.0,
                                    ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
