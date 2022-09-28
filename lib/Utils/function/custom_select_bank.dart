import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:flutter/material.dart';

class CustomSelectBank extends StatefulWidget {
  final String? image;
  final String? bankName;
  final String? accountName;
  final String? accountNo;

  const CustomSelectBank({
    Key? key,
    this.image,
    this.bankName,
    this.accountName,
    this.accountNo,
  }) : super(key: key);

  @override
  State<CustomSelectBank> createState() => _CustomSelectBankState();
}

class _CustomSelectBankState extends State<CustomSelectBank> {
  bool? isSelect = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSelect = !isSelect!;
            });
          },
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
                          image: NetworkImage('${widget.image}'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 17,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.bankName}',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${widget.accountName}',
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '${widget.accountNo}',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: isSelect == true
                      ? const Icon(
                          Icons.check_circle,
                          color: AppColor.mainColor,
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
