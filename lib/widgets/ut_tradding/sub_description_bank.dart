import 'package:flutter/material.dart';

class SubDescriptionBank extends StatelessWidget {
  final String? title;
  final String? description;
  final bool isTranid;
  const SubDescriptionBank(
      {Key? key, this.title, this.description, this.isTranid = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 7),
          height: 5,
          width: 5,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            '$title:',
            style: TextStyle(
                color: isTranid == true ? Colors.red : Colors.black54),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: Text(
            isTranid ? 'Trans ID' : '$description',
            style: TextStyle(
                color: isTranid == true ? Colors.red : Colors.black,
                fontWeight:
                    isTranid == true ? FontWeight.bold : FontWeight.w500),
          ),
        )
      ],
    );
  }
}
