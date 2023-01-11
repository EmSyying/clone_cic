import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slide_action/slide_action.dart';

class SlideButton extends StatelessWidget {
  final FutureOr<void> Function()? callback;
  const SlideButton({Key? key, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      stretchThumb: true,
      trackBuilder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).primaryColor.withOpacity(0.4),
          ),
          child: Center(
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).primaryColor,
              highlightColor: Colors.grey[300]!,
              child: Text(
                'Slide to submit',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontSize: 16),
              ),
            ),
          ),
        );
      },
      thumbBuilder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: state.isPerformingAction
              ? const CupertinoActivityIndicator(
                  color: Colors.white,
                )
              : const Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
        );
      },
      action: callback,
    );
  }
}
