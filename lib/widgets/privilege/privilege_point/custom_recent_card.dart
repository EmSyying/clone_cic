import 'package:cicgreenloan/Utils/function/format_to_k.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomRecentCard extends StatelessWidget {
  final String? title, datetime, action, image;
  final int? price, minusPoint;

  const CustomRecentCard({
    super.key,
    this.title,
    this.datetime,
    this.price,
    this.minusPoint,
    this.action,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 0),
              spreadRadius: 3,
              blurRadius: 5,
              color: Colors.grey[200]!),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: double.infinity,
                margin: const EdgeInsets.only(
                    left: 10, top: 10, bottom: 10, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    '$image',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 180,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Spacer(),
                Text(
                  '$datetime',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  FormatToK.digitNumber(price),
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                child: Text(
                  '$action',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffF9D423), Color(0xffE65C00)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      '- $minusPoint',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
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
            ],
          )
        ],
      ),
    );
  }
}
