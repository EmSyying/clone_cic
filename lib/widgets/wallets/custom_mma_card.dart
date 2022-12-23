import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomMMACard extends StatelessWidget {
  final String? title;
  final String? imageMMAcard;
  final GestureTapCallback? onTap;
  const CustomMMACard({
    Key? key,
    this.title,
    this.imageMMAcard,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 6.0,
          ),
          margin: const EdgeInsets.only(
            bottom: 10.0,
          ),
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.arrowforwardColor['dark'],
            border: Border.all(
              width: 0.6,
              color: AppColor.dividerBackground,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(30),
                blurRadius: 6,
                offset: const Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColor.dividerBackground.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    imageMMAcard ?? '',
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  title ?? '',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          )),
    );
  }
}
