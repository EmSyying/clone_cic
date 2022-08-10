import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../modules/investment_module/controller/investment_controller.dart';

class CustomCardFIFDeducSelection extends StatelessWidget {
  final fifDeducSelection = Get.put(PriceController());
  final bool selected;

  final String? title;

  final String? description;
  final GestureTapCallback? onPressed;
  final GestureTapCallback? onExploreMore;
  CustomCardFIFDeducSelection({
    Key? key,
    this.selected = false,
    this.title,
    this.description,
    this.onPressed,
    this.onExploreMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var _width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: selected
                  ? Theme.of(context).primaryColor
                  : Colors.transparent),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[200]!, blurRadius: 6, spreadRadius: 0.1)
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///leading

                  ///text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  fontFamily: "DMSans-Bold",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text(
                                description ?? "",
                                overflow: TextOverflow.visible,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.5,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: onExploreMore!,
                          child: Text(
                            'Explore More',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Theme.of(context).primaryColor),
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        )
                      ],
                    ),
                  ),

                  ///
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: selected
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selected
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                        width: 1.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.done_rounded,
                      size: 11,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
