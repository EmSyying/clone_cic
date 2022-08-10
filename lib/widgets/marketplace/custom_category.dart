import 'package:cicgreenloan/modules/market_place/models/recommend.dart';
import 'package:flutter/material.dart';
import 'package:cicgreenloan/widgets/marketplace/custom_item_card.dart';

class CustomCategory extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final List<Recommend>? recommendItem;

  const CustomCategory({Key? key, this.onTap, this.recommendItem, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Text(
            title!,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: double.infinity,
              height: 220,
              margin: const EdgeInsets.only(bottom: 20),
              child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 5,
                      ),
                  scrollDirection: Axis.horizontal,
                  itemCount: recommend.length,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemBuilder: (context, index) {
                    Recommend? currentItem = recommend[index];
                    return GestureDetector(
                      onTap: () => onTap!(currentItem),
                      child: CustomItemCard(
                        isRecommendCard: true,
                        recommendItem: currentItem,
                      ),
                    ); //product: productIndex
                  }),
            );
          },
        ),
      ],
    );
  }
}
