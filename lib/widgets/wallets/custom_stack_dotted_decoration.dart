import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomStackDottedDecoration extends StatelessWidget {
  final bool dottedDecorationTransfer;
  final String? title;
  final String? assetName;
  const CustomStackDottedDecoration({
    Key? key,
    this.dottedDecorationTransfer = false,
    this.title,
    this.assetName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dottedDecorationTransfer == false
        ? Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: DottedDecoration(
                    strokeWidth: 2,
                    shape: Shape.line,
                    color: Colors.grey[100]!),
              ),
              Container(
                color: Colors.white,
                child: SvgPicture.asset(
                  assetName ?? '',
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          )
        : Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: DottedDecoration(
                  strokeWidth: 2,
                  shape: Shape.line,
                  color: Colors.grey[100]!,
                ),
              ),
              Container(
                color: Colors.white,
                child: Text(
                  title ?? '',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.28,
                        fontSize: 16.0,
                        color: const Color(0xff515151),
                      ),
                ),
              ),
            ],
          );
  }
}
