import 'package:flutter/material.dart';

class CustomEmptyState extends StatelessWidget {
  final String? title;
  final String? description;
  final bool? isEmptyBox;
  final bool colors;
  const CustomEmptyState({
    Key? key,
    this.isEmptyBox = false,
    this.title,
    this.description,
    this.colors = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isEmptyBox!
        ? Container(
            color: colors ? Colors.transparent : Colors.white,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/emptyState.png',
                  width: 250,
                  height: 250,
                ),
                Text(title ?? 'No transaction',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                Text(description ?? 'It seems you have no transactions yet.',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w400)),
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 7,
                      spreadRadius: 5,
                      color: Colors.grey.shade100)
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.white24,
                border: Border.all(width: 2, color: Colors.white)),
            child: Center(
              child: Image.asset(
                'assets/images/emptyState.png',
                width: 250,
                height: 250,
              ),
            ),
          );
  }
}
