import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DefaultSizeWeb extends StatelessWidget {
  final Widget? child;
  final double? height;
  const DefaultSizeWeb({Key? key, this.child, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1024),
        width: kIsWeb ? 1024 : double.infinity,
        height: height,
        child: child,
      ),
    );
  }
}
