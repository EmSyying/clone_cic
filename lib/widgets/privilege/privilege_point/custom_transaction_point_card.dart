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
        Color(0xffF9D423),
        Color(0xffE65C00),
        // Colors.green
        //add more color here.
      ],
    );
    return Stack(
      children: [
        Container(
          height: 130,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(1, 0),
                  spreadRadius: 3,
                  blurRadius: 5,
                  color: Colors.grey[100]!)
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, bottom: 20),
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
                                      fontSize: 26,
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
                        height: 5,
                      ),
                      SizedBox(
                        child: Text(
                          exchangePointTransaction!.description ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  overflow: TextOverflow.visible),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
