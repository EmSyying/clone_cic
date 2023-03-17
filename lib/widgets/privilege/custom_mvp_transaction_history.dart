import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomMVPTransactionHistory extends StatelessWidget {
  final String? referenceId;
  final String? rewardText;
  final String? date;
  final double? amount;
  final String? type;

  const CustomMVPTransactionHistory({
    super.key,
    this.referenceId,
    this.rewardText,
    this.date,
    this.amount,
    this.type,
  });

  Widget amountWidget(TextStyle? textStyle) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _icon,
          const SizedBox(width: 4),
          RichText(
            text: TextSpan(
                text: amount.toString(),
                style: textStyle?.copyWith(
                    color: _color, fontSize: 14, fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: ' MVP',
                    style: textStyle?.copyWith(
                        color: _color,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ]),
          ),
        ],
      );

  Widget get _icon => type?.toLowerCase() == 'redemption'
      ? SvgPicture.asset('assets/images/mvp_transaction_in.svg')
      : SvgPicture.asset('assets/images/mvp_transaction_out.svg');

  Color get _color => type?.toLowerCase() == 'redemption'
      ? const Color(0xff4FA30F)
      : const Color(0xffDA1414);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelMedium;
    return Container(
      constraints: const BoxConstraints(minHeight: 100),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff384593),
                    Color(0xff3588E8),
                  ],
                ),
                shape: BoxShape.circle),
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/images/mini_mvp_logo.svg'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ref ID: ${referenceId?.toUpperCase() ?? ''}',
                    style: textStyle?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(height: rewardText == null ? 0 : 6),
                  rewardText == null
                      ? Container()
                      : Text(
                          rewardText ?? '',
                          style: textStyle?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff464646),
                              overflow: TextOverflow.clip),
                          maxLines: 2,
                        ),
                  const SizedBox(height: 6),
                  Text(
                    date ?? '',
                    style: textStyle?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff848F92)),
                  ),
                ],
              ),
            ),
          ),
          amountWidget(textStyle)
        ],
      ),
    );
  }
}
