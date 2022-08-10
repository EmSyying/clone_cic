import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerFIFSavingCard extends StatelessWidget {
  final bool? isEmptyState;
  const CustomShimmerFIFSavingCard({Key? key, this.isEmptyState = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customShimmerFIFSavingCard(context, isEmptyState!),
        customShimmerFIFSavingCard(context, isEmptyState!),
        customShimmerFIFSavingCard(context, isEmptyState!),
        customShimmerFIFSavingCard(context, isEmptyState!),
        customShimmerFIFSavingCard(context, isEmptyState!),
        customShimmerFIFSavingCard(context, isEmptyState!),
        customShimmerFIFSavingCard(context, isEmptyState!),
        customShimmerFIFSavingCard(context, isEmptyState!),
        customShimmerFIFSavingCard(context, isEmptyState!),
      ],
    );
  }
}

Widget customShimmerFIFSavingCard(BuildContext context, bool isEmptyState) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
        height: 88,
        margin: EdgeInsets.only(
            bottom: isEmptyState == true ? 0 : 10,
            left: 20,
            right: 20,
            top: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0.3,
              blurRadius: 0.1,
              offset: const Offset(1.0, 0.0), // changes position of shadow
            ),
          ],
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[100]!,
          highlightColor: Colors.white,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                ),
                // height: 80,
                width: 6,
              ),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 8,
                        width: MediaQuery.of(context).size.width * 0.3,
                        color: Colors.grey[100],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 8,
                        width: MediaQuery.of(context).size.width * 0.15,
                        color: Colors.grey[100],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.more_horiz,
                          color: Colors.grey[200],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 8,
                          width: MediaQuery.of(context).size.width * 0.2,
                          color: Colors.grey[100],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                ],
              )),
            ],
          ),
        )),
  );
}
