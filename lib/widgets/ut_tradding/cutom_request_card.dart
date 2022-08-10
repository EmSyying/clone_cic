import 'package:flutter/material.dart';

class CutomRequestCard extends StatelessWidget {
  const CutomRequestCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
        border: const Border(
          left: BorderSide(width: 10, color: Colors.green),
        ),
      ),
      child: const Center(
        child: Text('Hello'),
      ),
    );
  }
}
