import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Utils/helper/color.dart';

class CustomCopyBank extends StatelessWidget {
  const CustomCopyBank({
    Key? key,
    required this.imgUrl,
    required this.bankName,
    required this.accountNumber,
    required this.accountName,
  }) : super(key: key);

  final String? imgUrl, bankName, accountNumber, accountName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.transparent,
              backgroundImage: CachedNetworkImageProvider(imgUrl!),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bankName ?? ''),
                  const SizedBox(height: 5),
                  Text(
                    'Account Name : $accountName',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColor.chartLabelColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 51,
          decoration: BoxDecoration(
            border:
                Border.all(color: const Color(0xffafafaf).withOpacity(0.25)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    accountNumber ?? '0',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(text: accountNumber),
                  ).then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/svgfile/copy_svg.svg',
                              color: Colors.white,
                            ),
                            const SizedBox(width: 15),
                            const Text("Copied to clipboard."),
                          ],
                        ),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  });
                },
                icon: SvgPicture.asset('assets/images/svgfile/copy_svg.svg'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 26)
      ],
    );
  }
}
