import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
            blurRadius: 3,
            spreadRadius: 2,
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
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 1,
                )
              ],
              shape: BoxShape.circle,
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   onError: (exception, stackTrace) => {},
              //   image: NetworkImage(
              //     '$image',
              //   ),
              // ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  // color: Colors.red,
                  // height: 40,
                  // width: 40,
                  child: CachedNetworkImage(
                    imageUrl: '$image',
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      color: Colors.blue[900],
                    ),
                    // width: 30,
                    // height: 30,
                    fit: BoxFit.fill,
                  ),
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  '$title',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              const SizedBox(
                height: 8,
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

  static Widget buildShimer(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 3,
              spreadRadius: 2,
              color: Colors.grey[200]!,
            ),
          ],
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[100]!,
          highlightColor: Colors.white,
          child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              )),
        ));
  }
}
