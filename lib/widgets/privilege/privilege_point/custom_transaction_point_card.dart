import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

import '../../../modules/wallet/model/exchange_point_transaction.dart/exchange_point_transaction.dart';

class CustomTransactionPoint extends StatelessWidget {
  final ExchangePointTransaction? exchangePointTransaction;
  const CustomTransactionPoint({
    super.key,
    this.exchangePointTransaction,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width - 40;
    const gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff3588E8),
        Color(0xff384593),
        // Colors.green
        //add more color here.
      ],
    );
    return Stack(
      children: [
        Container(
          height: 112,
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[600]!.withOpacity(0.1),
                spreadRadius: 0.1,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 20, bottom: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return gradient
                                    .createShader(Offset.zero & bounds.size);
                              },
                              child: Text(
                                exchangePointTransaction!.amount ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 25,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text('MVP',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        fontSize: 16)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        exchangePointTransaction!.description ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                              color: AppColor.darkColor,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        exchangePointTransaction!.date ?? "",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black45),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 1,
                height: double.infinity,
                decoration: DottedDecoration(
                    color: Colors.black26,
                    shape: Shape.line,
                    linePosition: LinePosition.right,
                    dash: const [4, 4]),
              ),
              SizedBox(
                width: cardWidth * 0.24,
                child: Image.asset(
                  'assets/images/union_point_card.png',
                  width: 35,
                  height: 35,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 8,
          top: 0,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffFAFAFA),
            ),
          ),
        ),
      ],
    );
  }
}
