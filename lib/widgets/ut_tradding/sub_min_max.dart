import 'package:flutter/material.dart';

class SubMinMax extends StatelessWidget {
  final String? title;
  final String? price;
  const SubMinMax({Key? key, this.title, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$title',
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'DM Sans',
              fontSize: 13,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            price != null ? '$price' : '--',
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'DM Sans',
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
