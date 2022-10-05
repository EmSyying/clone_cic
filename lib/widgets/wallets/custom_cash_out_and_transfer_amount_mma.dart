import 'package:flutter/material.dart';

class CustomCashOutAndTransferAmount extends StatelessWidget {
  final String? amountCashOutTransfer;

  const CustomCashOutAndTransferAmount({Key? key, this.amountCashOutTransfer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: amountCashOutTransfer,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
          children: [
            TextSpan(
              text: 'USD',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
