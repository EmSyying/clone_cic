import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cicgreenloan/Utils/image_view/image_view_file.dart';
import 'package:cicgreenloan/generated/l10n.dart';
import 'package:cicgreenloan/modules/get_funding/models/payment_model/payment_schedule.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/helper/custom_appbar.dart';

class PaymentInfo extends StatefulWidget {
  final PaymentSchedules? paymentSchedule;
  const PaymentInfo({Key? key, this.paymentSchedule}) : super(key: key);

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: S.of(context).paymentInfo,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: kIsWeb
              ? Icon(
                  Icons.arrow_back,
                  color: Get.theme.brightness == Brightness.light
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                )
              : Platform.isAndroid
                  ? Icon(
                      Icons.arrow_back,
                      color: Get.theme.brightness == Brightness.light
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    )
                  : Icon(
                      Icons.arrow_back_ios,
                      color: Get.theme.brightness == Brightness.light
                          ? Colors.white
                          : Theme.of(context).primaryColor,
                    ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 20.0,
                    ),
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 3,
                            color: Colors.black12),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.paymentSchedule!.paidInfo != null
                                  ? widget.paymentSchedule!.paidInfo!.bankName!
                                  : '',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const Spacer(),
                            Container(
                              height: 50,
                              width: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(widget
                                      .paymentSchedule!.paidInfo!.bankLogo!),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Divider(
                          color: Theme.of(context).primaryColor,
                          thickness: 1,
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).paymentDate,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    widget.paymentSchedule!.paymentDate!,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).amount,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    widget.paymentSchedule!.totalPayment!,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).bank,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    widget.paymentSchedule!.paidInfo!.bankName!,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).paymentStatus,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    widget.paymentSchedule!.paidInfo!.status!,
                                    style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      S.of(context).invoice,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        height: 400.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            Hero(
                              tag: 'invoice',
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ImageViewerFile(
                                        heroTag: 'invoice',
                                        imageUrl: widget
                                            .paymentSchedule!.paidInfo!.image!,
                                      ),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: CachedNetworkImage(
                                      imageUrl: widget
                                          .paymentSchedule!.paidInfo!.image!,
                                      fit: BoxFit.cover,
                                      fadeInCurve: Curves.easeIn,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
