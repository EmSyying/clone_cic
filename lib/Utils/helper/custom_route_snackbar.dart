// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/route_configuration/route.dart';

enum SnackType {
  done,
  error,
  normal,
}

IconData _getIcon(SnackType type) {
  switch (type) {
    case SnackType.done:
      return Icons.done;
    case SnackType.error:
      return CupertinoIcons.clear_thick;
    default:
      return Icons.done;
  }
}

Color _getColor(SnackType type) {
  switch (type) {
    case SnackType.done:
      return const Color(0xff60AD00);
    case SnackType.error:
      return Colors.red;
    default:
      return const Color(0xff464646);
  }
}

customRouterSnackbar({
  String? title,
  String? description,
  SnackType type = SnackType.normal,
  bool prefix = false,
  bool suffix = true,
}) {
  ScaffoldMessenger.of(router.routerDelegate.navigatorKey.currentState!.context)
      .showSnackBar(
    SnackBar(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          prefix
              ? Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: SvgPicture.asset('assets/images/toast.svg'),
                )
              : const SizedBox.shrink(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null && title.isNotEmpty)
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                if (title != null &&
                    title.isNotEmpty &&
                    description != null &&
                    description.isNotEmpty)
                  const SizedBox(height: 5),
                if (description != null && description.isNotEmpty)
                  Text(description),
              ],
            ),
          ),
          suffix
              ? Icon(
                  _getIcon(type),
                  color: Colors.white,
                )
              : const SizedBox.shrink()
        ],
      ),
      backgroundColor: _getColor(type),
      elevation: 1,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.down,
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
