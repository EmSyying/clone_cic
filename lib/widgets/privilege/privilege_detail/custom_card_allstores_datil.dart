import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:flutter/material.dart';

class CustomCardPrivilegeDetail extends StatelessWidget {
  final String? sloganLogo;
  final String? status;
  final String? titile;
  final String? slogan;
  final String? discount;
  const CustomCardPrivilegeDetail({
    Key? key,
    this.sloganLogo,
    this.status,
    this.titile,
    this.slogan,
    this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16.0),
        width: double.infinity,
        height: 96,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            // end: Alignment(0.2, 0.1),
            colors: <Color>[
              Color.fromARGB(248, 217, 219, 201),
              Color.fromARGB(248, 255, 255, 255),
            ],
            tileMode: TileMode.mirror,
          ),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.5,
              blurRadius: 0.5,
              // offset: const Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 54,
              height: 54,
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    sloganLogo ?? '',
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      status ?? '',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 10,
                            color: status == "Closed"
                                ? AppColor.statusColor['late']
                                : status == "Permanently Closed"
                                    ? AppColor.statusColor['warning']
                                    : AppColor.statusColor['green'],
                          ),
                      // color: status == "Open Now"
                      //     ? AppColor.statusColor['green']
                      //     : AppColor.statusColor['late']),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    titile ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    slogan ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          color: const Color(0xff848F92),
                        ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                discount ?? '',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: AppColor.statusColor['pending'],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
