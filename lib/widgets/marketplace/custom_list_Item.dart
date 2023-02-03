import 'package:flutter/material.dart';

import '../../modules/market_place/models/nearest.dart';
import 'custom_item_card.dart';

class CustomItemList extends StatelessWidget {
  final List<Nearest> rearest;
  final String title;
  final Function onTap;

  const CustomItemList(
      {required this.onTap,
      required this.rearest,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Nearest to you',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: GridView.builder(
              itemCount: nearest.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                crossAxisCount: 2,
                mainAxisExtent: 220,
                // childAspectRatio: 4.2 / 5,
              ),
              itemBuilder: (context, index) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    Nearest currentIndex = nearest[index];
                    return GestureDetector(
                      child: CustomItemCard(
                        isRecommendCard: false,
                        nearest: currentIndex,
                      ),
                      onTap: () => onTap(currentIndex),
                    );
                  },
                );
              },
            )),
      ],
    );
  }
}
