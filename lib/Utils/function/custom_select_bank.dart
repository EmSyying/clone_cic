import 'package:flutter/material.dart';

class CustomSelectBank extends StatelessWidget {
  final String? image;
  final String? bankName;
  final String? accountName;
  final String? accountNo;
  final int? selected;
  final int? selectIndex;
  final GestureTapCallback? onTapSelectBank;
  const CustomSelectBank({
    Key? key,
    this.onTapSelectBank,
    this.selected = 0,
    this.image,
    this.bankName,
    this.accountName,
    this.accountNo,
    this.selectIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTapSelectBank,
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                      image: DecorationImage(
                          image: NetworkImage('$image'), fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 17,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$bankName',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '$accountName',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '$accountNo',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: selectIndex == selected
                      ? Icon(
                          Icons.check_circle,
                          color: Theme.of(context).primaryColor,
                        )
                      : const Icon(
                          Icons.circle_outlined,
                          color: Colors.black,
                        ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Divider(
            thickness: 1.2,
            color: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}
