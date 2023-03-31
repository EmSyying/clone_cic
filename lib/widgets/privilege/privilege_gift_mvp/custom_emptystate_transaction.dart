import 'package:flutter/material.dart';

import '../../../modules/privilege_program/screen/choose_gift_template.dart';
import 'custom_header_transaction.dart';

Widget emtyStateTransactionTemplate(
    BuildContext context, ChosenMVPModel? chosenMVPModel) {
  return LayoutBuilder(builder: (context, constrain) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: constrain.maxHeight > 600
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 30.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/emptyState.png',
                      width: 250,
                      height: 250,
                    ),
                    Text(
                      'No Transaction History',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      'No Transaction History Here !',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                  titleGiftTemplate:
                      chosenMVPModel != null ? chosenMVPModel.receiverName : "",
                  acountNumGiftTemplate: chosenMVPModel != null
                      ? chosenMVPModel.receiverWallet
                      : "",
                  id: chosenMVPModel != null ? chosenMVPModel.id : 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 14.0, horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Transaction History',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff848F92)),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[400],
                height: 1,
              ),
            ],
          ),
        ),
      ],
    );
  });
}
