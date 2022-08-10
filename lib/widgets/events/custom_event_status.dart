import 'package:flutter/material.dart';

class CustomEventStatus extends StatelessWidget {
  final String? title;
  final String? icon;
  const CustomEventStatus({Key? key, this.title, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0.0, 0.0), blurRadius: 6, color: Colors.black12)
          ]),
      child: Row(
        children: [
          Image.asset(
            icon!,
            height: 20,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(title!)
        ],
      ),
    );
  }
}
