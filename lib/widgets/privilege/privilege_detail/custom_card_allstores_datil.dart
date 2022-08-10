import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:flutter/material.dart';

import '../../../modules/privilege_program/model/stores_model/model_pre.dart';

class CustomCardPrivilegeDetail extends StatelessWidget {
  final StoreModel? detailCardPri;
  const CustomCardPrivilegeDetail({Key? key, t, this.detailCardPri})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      child: Container(
        padding:
            const EdgeInsets.only(right: 10.0, left: 10.0, top: 10, bottom: 10),
        width: double.infinity,
        height: 96,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.2, 0.1),
            colors: <Color>[
              Color.fromARGB(255, 241, 241, 225),
              Color.fromARGB(139, 255, 255, 255),
            ],
            tileMode: TileMode.mirror,
          ),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(detailCardPri!.logoCard ?? ''),
                  )),
            ),
            // Image.asset(
            //   imageCard ?? '',
            //   fit: BoxFit.cover,
            //   width: 90,
            // ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        detailCardPri!.steusTitle ?? '',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 10,
                              color: detailCardPri!.steusTitle!.toLowerCase() ==
                                      'closed'
                                  ? AppColor.statusColor['late']
                                  : AppColor.statusColor['green'],
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      detailCardPri!.titleStores ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      detailCardPri!.description ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            color: const Color(0xff848F92),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                '${detailCardPri!.numberPercentage ?? ''}%',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: Theme.of(context).textTheme.headline6!.copyWith(
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
