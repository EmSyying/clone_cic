import 'package:flutter/material.dart';

class InquiryCardShimmer extends StatelessWidget {
  const InquiryCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: Colors.grey[100],
            ),
            height: 80,
            width: 10,
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[100],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: Colors.grey[100],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width * 0.15,
                    color: Colors.grey[100],
                  ),
                ],
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width * 0.12,
                    color: Colors.grey[100],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.grey[100],
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
