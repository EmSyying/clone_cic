import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final List<Color>? colors;
  const CustomCard({Key? key, this.child, this.colors}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(1.0, 0.0), blurRadius: 4.0, color: Colors.black12)
      ]),
      child: ClipRect(
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: colors ??
                          [
                            Colors.white,
                            Colors.grey.shade200.withOpacity(0.6),
                          ],
                      end: Alignment.topCenter,
                      begin: Alignment.bottomCenter),
                ),
                width: double.infinity,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
