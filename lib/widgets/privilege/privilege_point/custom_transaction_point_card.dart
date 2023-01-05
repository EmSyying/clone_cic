import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

class CustomTransactionPoint extends StatelessWidget {
  final String? title, datetime, svg;
  final int? point;
  const CustomTransactionPoint(
      {super.key, this.title, this.datetime, this.point, this.svg});

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '$point',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 26,
                                  foreground: Paint()
                                    ..shader = const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: <Color>[
                                        Color(0xffF9D423),
                                        Color(0xffE65C00),
                                        // Colors.green
                                        //add more color here.
                                      ],
                                    ).createShader(const Rect.fromLTWH(
                                        0.0, 0.0, 200.0, 100.0))),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text('Point',
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
                      width: 280,
                      child: Text(
                        title ?? '',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      datetime ?? '',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black45),
                    )
                  ],
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
              Expanded(
                child: Image.asset(
                  '$svg',
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
