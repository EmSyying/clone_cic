import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/modules/learning_platform_module/models/voucher_model.dart';
import 'package:flutter/material.dart';

class VoucherCard extends StatelessWidget {
  final VoucherModel? voucher;
  final bool? elevant;
  const VoucherCard({Key? key, this.voucher, this.elevant = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: elevant != false ? Colors.white : null,
            boxShadow: [
              elevant != false
                  ? const BoxShadow(
                      offset: Offset(1.0, 0.0),
                      color: Colors.black12,
                      blurRadius: 6)
                  : const BoxShadow(
                      offset: Offset(0.0, 0.0),
                      color: Colors.transparent,
                      blurRadius: 0),
            ]),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  SizedBox(
                    height: 160,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: voucher!.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  statusBanner(isActive: voucher!.isActive!),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              voucher!.title!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Until ${voucher!.expiredDate!}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: voucher!.shopImageUrl!,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  statusBanner({bool? isActive}) {
    return Positioned(
      top: 10,
      right: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1.0, 0.0),
                  blurRadius: 6,
                  color: Colors.black12)
            ]),
        child: Text(
          isActive! ? 'Active' : 'Expired',
          style: TextStyle(
              color: isActive ? Colors.red : Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
      ),
    );
  }
}
