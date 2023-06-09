import 'package:flutter/material.dart';

class TransactionStore extends StatelessWidget {
  final String? title;
  final String? content;
  final String? image;
  const TransactionStore({super.key, this.title, this.content, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 5,
            spreadRadius: 3,
            color: Colors.grey[200]!,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 5, top: 20, bottom: 20, right: 10),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  '$image',
                ),
              ),
            ),
            // child: Image.network(
            //   '',
            // ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$title',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '$content',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
