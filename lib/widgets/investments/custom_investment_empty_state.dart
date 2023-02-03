import 'package:cicgreenloan/widgets/investments/custom_card.dart';
import 'package:flutter/material.dart';

class CustomInvestmentEmptyState extends StatelessWidget {
  final String? title;
  final String? description;
  final String? titleLine;
  const CustomInvestmentEmptyState(
      {Key? key, this.title, this.description, this.titleLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCard(
          child: SizedBox(
            width: double.infinity,
            height: 259,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/investment_empthystate.png',
                width: 100,
                height: 99.15,
              ),
              const SizedBox(
                height: 26.0,
              ),
              Text(
                title ?? '',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 4.0,
              ),
              SizedBox(
                width: 273,
                child: Text(
                  description ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: const Color(0xff848F92),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              )
            ]),
          ),
        ),
        const SizedBox(
          height: 35.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            titleLine ?? '',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
