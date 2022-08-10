import 'package:cicgreenloan/modules/learning_platform_module/screens/voucher_page_detail.dart';
import 'package:cicgreenloan/widgets/learning/voucher_card.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../Utils/helper/learning_platform/voucher_list.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({Key? key}) : super(key: key);

  @override
  State<VoucherPage> createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Column(
              children: voucherList
                  .map((voucher) => GestureDetector(
                      onTap: () {
                        CupertinoScaffold.showCupertinoModalBottomSheet(
                          context: context,
                          enableDrag: false,
                          builder: (context) => VoucherPageDetail(
                            voucher: voucher,
                          ),
                        );
                      },
                      child: VoucherCard(voucher: voucher)))
                  .toList()),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
