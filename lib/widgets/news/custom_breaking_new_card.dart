import 'package:flutter/material.dart';

class CustomBreakingNewCard extends StatelessWidget {
  final String? title, date, img, estimate;

  const CustomBreakingNewCard(
      {super.key, this.title, this.date, this.img, this.estimate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset.zero,
            blurRadius: 4,
            spreadRadius: 5,
            color: Colors.grey[200]!)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 240,
              height: 140,
              child: Image.network(
                '$img',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '$title',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                '$date ',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              Text(
                '· $estimate | ',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
              ),
              Text(
                'CiC News',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BreakingNewsModel {
  final String? title, date, img, estimate;
  BreakingNewsModel({this.title, this.date, this.img, this.estimate});
}

List<BreakingNewsModel> breakingModelList = [
  BreakingNewsModel(
      title:
          'The Future Investment on Startups & Businesses in CamThe Future Investment on Startups & Businesses in Cam',
      date: '6 Jan 2023',
      img:
          'https://www.tlnt.com/wp-content/uploads/sites/4/2019/09/meeting-bored-boring-long.jpg',
      estimate: '5 min read'),
  BreakingNewsModel(
      title: 'The Future Investment on Startups & Businesses in Cam',
      date: '6 Jan 2023',
      img:
          'https://www.tlnt.com/wp-content/uploads/sites/4/2019/09/meeting-bored-boring-long.jpg',
      estimate: '5 min read'),
  BreakingNewsModel(
      title: 'The Future Investment on Startups & Businesses in Cam',
      date: '6 Jan 2023',
      img:
          'https://www.tlnt.com/wp-content/uploads/sites/4/2019/09/meeting-bored-boring-long.jpg',
      estimate: '5 min read'),
];
