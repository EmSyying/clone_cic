import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Utils/helper/color.dart';

class CustomRecentCard extends StatelessWidget {
  // final RecentActivities? recentActivities;
  final String? shopLogo;
  final String? shopName;
  final String? description;
  final String? date;
  final String? code;
  final String? pointAmount;
  final String? label;
  final int? id;
  final GestureTapCallback? onTap;

  final EdgeInsets? margin;
  const CustomRecentCard({
    super.key,
    this.margin,
    this.shopLogo,
    this.shopName,
    this.description,
    this.date,
    this.code,
    this.pointAmount,
    this.label,
    // this.recentActivities,
    this.id,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            margin: margin ??
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 10.0,
              bottom: 10.0,
            ),
            width: double.infinity,
            height: 104,
            decoration: BoxDecoration(
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 84,
                  height: 84,
                  padding: const EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    color: AppColor.secondaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        shopLogo ?? '',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          shopName ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          description ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff848F92),
                              ),
                        ),
                        const SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          date ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.w300,
                                color: const Color(0xff464646),
                                letterSpacing: 0.2,
                              ),
                        ),
                        const Spacer(),
                        // Text(
                        //   amount ?? '',
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        //   softWrap: false,
                        //   style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        //         fontWeight: FontWeight.w700,
                        //       ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      code ?? '',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w300,
                                color: const Color(0xff464646),
                                letterSpacing: 0.2,
                              ),
                    ),
                    const Spacer(),
                    Container(
                      height: 20,
                      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            colors: [
                              Color.fromRGBO(255, 200, 55, 1),
                              Color.fromRGBO(255, 128, 8, 1),
                            ]),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              pointAmount != null ? pointAmount.toString() : "",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset(
                              'assets/images/svgfile/Union.svg',
                              width: 15,
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: margin != null ? 10.0 : 30.0,
            bottom: margin != null ? 36.0 : 26.0,
            child: Container(
              height: 16,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(234, 63, 78, 163),
                    Color.fromARGB(234, 53, 137, 232),
                  ],
                ),
              ),
              child: Text(
                "$label",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 8,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: const Offset(0.0, 1),
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
