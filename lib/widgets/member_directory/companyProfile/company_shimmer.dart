import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CompanyShimmer extends StatelessWidget {
  const CompanyShimmer({Key? key}) : super(key: key);

  Widget companyShimmerCard() {
    final wiget = Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              height: 10,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(height: 10),
            Container(
              height: 10,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(height: 10),
            Container(
              height: 10,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(8)),
            ),
          ],
        ),
        const SizedBox(width: 50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              height: 10,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(height: 10),
            Container(
              height: 10,
              width: 75,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(height: 10),
            Container(
              height: 10,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(8)),
            ),
          ],
        )
      ],
    );

    final icon = Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(8)),
    );

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 13,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(8)),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black,
              ),
              const SizedBox(width: 20),
              Container(
                height: 10,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
              ),
              const Spacer(),
              Column(
                children: [
                  icon,
                  const SizedBox(height: 40),
                  icon,
                ],
              )
            ],
          ),
          wiget,
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                height: 13,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
              ),
              const Spacer(),
              icon
            ],
          ),
          const SizedBox(height: 10),
          wiget,
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                height: 13,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
              ),
              const Spacer(),
              icon
            ],
          ),
          const SizedBox(height: 10),
          wiget,
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                height: 13,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
              ),
              const Spacer(),
              icon
            ],
          ),
          const SizedBox(height: 10),
          wiget,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[100]!,
        highlightColor: Colors.white,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          // itemCount: 10,
          children: [
            companyShimmerCard(),
            companyShimmerCard(),
            companyShimmerCard(),
            companyShimmerCard(),
          ],
        ),
      ),
    );
  }
}
