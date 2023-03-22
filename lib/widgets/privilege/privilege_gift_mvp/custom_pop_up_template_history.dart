import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

onShowPopUpTemplateHistory(
  BuildContext context, {
  double? isHeight,
  bool? isscroll = false,
  Widget? child,
  int? id,
  String? titleGiftTemplate,
  String? acountNumGiftTemplate,

  // String? titleGiftTemplate,
  // String? acountNumGiftTemplate,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: DraggableScrollableSheet(
          minChildSize: 0.05,
          maxChildSize: 1,
          initialChildSize: 1,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[300]),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  //Header Card Gift Template
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: headerCardGiftTemplate(
                      context,
                      titleGiftTemplate: titleGiftTemplate,
                      acountNumGiftTemplate: acountNumGiftTemplate,
                      id: id,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Transaction History',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff848F92)),
                      ),
                    ),
                  ),
                  Divider(
                    //thickness: 1.2,
                    color: Colors.grey[400],
                    height: 1,
                  ),
                  //List of Transaction History Gift MVP
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: child,
                  ),
                ],
              ),
            );
          }),
    ),
  );
  // showModalBottomSheet(
  //   //useRootNavigator: true,
  //  // isDismissible: true,
  //   shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(
  //     topRight: Radius.circular(10),
  //     topLeft: Radius.circular(10),
  //   )),
  //   context: context,
  //   isScrollControlled: true,
  //   builder: (context) {
  //     return SizedBox(
  //       height: isHeight != null
  //           ? MediaQuery.of(context).size.height * 0.6
  //           : isHeight,
  //       child: SingleChildScrollView(
  //         physics: isscroll!
  //             ? const ScrollPhysics()
  //             : const NeverScrollableScrollPhysics(),
  //         child: Column(
  //           // mainAxisAlignment: MainAxisAlignment.end,
  //           mainAxisSize: MainAxisSize.max,
  //           children: [
  //             Container(
  //               margin: const EdgeInsets.only(top: 10),
  //               width: 50,
  //               height: 5,
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(10.0),
  //                   color: Colors.grey[300]),
  //             ),
  //             const SizedBox(
  //               height: 10.0,
  //             ),
  //             //Header Card Gift Template
  //             Padding(
  //               padding: const EdgeInsets.symmetric(
  //                   horizontal: 20.0, vertical: 10.0),
  //               child: headerCardGiftTemplate(
  //                 context,
  //                 titleGiftTemplate: titleGiftTemplate,
  //                 acountNumGiftTemplate: acountNumGiftTemplate,
  //                 id: id,
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.symmetric(
  //                   vertical: 14.0, horizontal: 20.0),
  //               child: Align(
  //                 alignment: Alignment.centerLeft,
  //                 child: Text(
  //                   'Transaction History',
  //                   style: Theme.of(context).textTheme.displayMedium!.copyWith(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.w500,
  //                       color: const Color(0xff848F92)),
  //                 ),
  //               ),
  //             ),
  //             Divider(
  //               //thickness: 1.2,
  //               color: Colors.grey[400],
  //               height: 1,
  //             ),
  //             //List of Transaction History Gift MVP
  //             SingleChildScrollView(
  //               child: Container(
  //                 margin: const EdgeInsets.only(bottom: 10),
  //                 child: child,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   },
  // );
}

Row headerCardGiftTemplate(
  BuildContext context, {
  String? titleGiftTemplate,
  String? acountNumGiftTemplate,
  int? id,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment(0.8, 1),
              colors: [
                Color(0xff3588E8),
                Color(0xff384593),
              ]),
        ),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/images/privilege/transfer_icon.svg',
        ),
      ),
      const SizedBox(
        width: 10.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleGiftTemplate ?? '',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            acountNumGiftTemplate ?? '',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    ],
  );
}
