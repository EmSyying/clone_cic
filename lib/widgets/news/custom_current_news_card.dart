import 'package:flutter/material.dart';

class CustomCurrentNewCard extends StatelessWidget {
  final String? title, date, img, estimate;
  const CustomCurrentNewCard(
      {super.key, this.title, this.date, this.img, this.estimate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: const EdgeInsets.only(
        left: 12,
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset.zero,
                blurRadius: 4,
                spreadRadius: 5,
                color: Colors.grey[200]!),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: 80,
              height: 80,
              child: Image.network(
                '$img',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '$date ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '· $estimate | ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'CiC News',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BreakingNewsModel {
  final String? title, date, img, estimate;
  BreakingNewsModel({this.title, this.date, this.img, this.estimate});
}

List<BreakingNewsModel> currentNewsList = [
  BreakingNewsModel(
      title:
          'Cambodian Investors Community Association (CiC)Cambodian Investors Community Association (CiC)Cambodian Investors Community Association (CiC)Cambodian Investors Community Association (CiC)',
      date: '6 Jan 2023',
      img:
          'https://knowledge.wharton.upenn.edu/wp-content/uploads/2022/10/10.26.22-nano-tool-25-minute-meeting-600x500.jpg',
      estimate: '5 min read'),
  BreakingNewsModel(
      title: 'The Future Investment on Startups & Businesses in Cam',
      date: '6 Jan 2023',
      img:
          'https://knowledge.wharton.upenn.edu/wp-content/uploads/2022/10/10.26.22-nano-tool-25-minute-meeting-600x500.jpg',
      estimate: '5 min read'),
  BreakingNewsModel(
      title: 'TCiC-Beyond Investment Opportunity',
      date: '6 Jan 2023',
      img:
          'https://knowledge.wharton.upenn.edu/wp-content/uploads/2022/10/10.26.22-nano-tool-25-minute-meeting-600x500.jpg',
      estimate: '5 min read'),
];
