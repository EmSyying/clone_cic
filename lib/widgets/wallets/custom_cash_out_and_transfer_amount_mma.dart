import 'package:flutter/material.dart';

class CustomCashOutAndTransferAmount extends StatelessWidget {
  final String? amountCashOutTransfer;
  final bool pointTrue;

  const CustomCashOutAndTransferAmount(
      {Key? key, this.amountCashOutTransfer, this.pointTrue = false})
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
              text: pointTrue == false ? ' USD' : ' MVP',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
