import 'package:cicgreenloan/Utils/function/format_date_time.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/investment_module/controller/investment_controller.dart';

class DropDownItem extends StatefulWidget {
  final Map<dynamic, dynamic>? itemList;
  final bool? isSelect;
  final EdgeInsets? isPadding;
  final bool? profile;
  final bool? isUserAccount;
  final String? imageUrl;
  final bool? isPayment;
  final String? date;
  final EdgeInsets? paddingSuffixIcon;

  const DropDownItem(
      {Key? key,
      this.itemList,
      this.paddingSuffixIcon,
      this.isPayment = false,
      this.isSelect,
      this.isPadding,
      this.profile = false,
      this.isUserAccount = false,
      this.imageUrl,
      this.date})
      : super(key: key);
  @override
  State<DropDownItem> createState() => _DropDownItemState();
}

class _DropDownItemState extends State<DropDownItem> {
  final fifCon = Get.put(PriceController());
  @override
  Widget build(BuildContext context) {
    // debugPrint("==image:${widget.itemList!['picture']}");
    return Container(
      color: Theme.of(context).cardColor,
      padding: widget.isPadding ??
          const EdgeInsets.only(left: 0, top: 14, bottom: 14, right: 0),
      //  const EdgeInsets.only(left: 35, top: 10, bottom: 10, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.profile == true
              ? Container(
                  margin: const EdgeInsets.only(right: 15.0),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(widget.itemList!['picture'] ?? ""),
                        // image: NetworkImage(widget.itemList!['picture']),
                        //     image: AssetImage(widget.itemList!['Name'] == 'ABA'
                        //         ? 'assets/images/logoABA.png'
                        //         : 'assets/images/logoAcleda.png'),
                        fit: BoxFit.cover),
                  ),
                  // child: CachedNetworkImage(
                  //   imageUrl: widget.itemList!['picture'],
                  // ),
                )
              : Container(),
          Expanded(
            // margin: const EdgeInsets.only(top: 0),
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !widget.isSelect!
                      ? Text(widget.itemList!['Name'] ?? "",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 14,
                                  ),
                          overflow: TextOverflow.ellipsis)
                      : Text(widget.itemList!['Name']!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 14),
                          overflow: TextOverflow.ellipsis),
                  widget.isUserAccount!
                      ? Padding(
                          padding: const EdgeInsets.only(top: 7.0),
                          child: Text(
                            widget.itemList!['accountName']!,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        )
                      : Container(),
                  widget.isUserAccount!
                      ? Padding(
                          padding: const EdgeInsets.only(top: 7.0),
                          child: Text(
                            widget.itemList!['accountNumber']!,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(fontSize: 13),
                          ),
                        )
                      : Container(),
                  widget.isPayment!
                      ? Text(
                          FormatDate.investmentDateDisplay(
                            widget.itemList!['datePayment'],
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 12),
                        )
                      : Container()
                ],
              ),
            ),
          ),
          // const Spacer(),
          // if (fifCon.isCreateNewDate.value == "")
          //   !widget.isSelect!
          //       ? Padding(
          //           padding: widget.paddingSuffixIcon == null
          //               ? const EdgeInsets.only(top: 15)
          //               : widget.paddingSuffixIcon!,
          //           child: Icon(
          //             Icons.circle_outlined,
          //             color: Colors.grey[300],
          //           ),
          //         )
          //       : Padding(
          //           padding: widget.paddingSuffixIcon == null
          //               ? const EdgeInsets.only(top: 15)
          //               : widget.paddingSuffixIcon!,
          //           child: Icon(
          //             Icons.check_circle,
          //             color: Theme.of(context).primaryColor,
          //           ),
          //         ),
        ],
      ),
    );
  }
}
