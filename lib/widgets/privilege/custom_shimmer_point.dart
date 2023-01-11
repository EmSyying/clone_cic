import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

class CustomShimmerPoint extends StatelessWidget {
  const CustomShimmerPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      width: double.infinity,
      height: 112,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[600]!.withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      height: 10,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      height: 8,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      height: 8,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      height: 6,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 86,
                decoration: DottedDecoration(
                    color: Colors.grey[300]!,
                    shape: Shape.line,
                    linePosition: LinePosition.right,
                    dash: const [4, 4]),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 28,
                width: 21,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
