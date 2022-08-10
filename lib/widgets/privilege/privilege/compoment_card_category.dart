import 'package:flutter/material.dart';

import '../../../Utils/helper/color.dart';
import '../../../modules/privilege_program/model/category_model/model_categories.dart';

class ComponentCardCategory extends StatelessWidget {
  final ModelsCategories? modelCardCategory;
  final bool? isOnClickCard;
  final GestureTapCallback? onTapCatego;
  const ComponentCardCategory({
    Key? key,
    this.modelCardCategory,
    this.isOnClickCard = false,
    this.onTapCatego,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTapCatego,
          child: Container(
            height: 80,
            width: 150,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              border: Border.all(
                color: isOnClickCard! ? AppColor.mainColor : Colors.white,
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
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Image.asset(
                    modelCardCategory!.svgPicture ?? '',
                    width: 80,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: Text(
                    modelCardCategory!.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.w700,
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
