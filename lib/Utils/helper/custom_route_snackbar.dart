// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configs/route_configuration/route.dart';

enum SnackType {
  done,
  error,
}

IconData _getIcon(SnackType type) =>
    type == SnackType.error ? CupertinoIcons.clear_thick : Icons.done;
Color _getColor(SnackType type) =>
    type == SnackType.error ? Colors.red : const Color(0xff60AD00);

customRouterSnackbar({
  String? title,
  String? description,
  SnackType type = SnackType.done,
}) {
  ScaffoldMessenger.of(router.routerDelegate.navigatorKey.currentState!.context)
      .showSnackBar(
    SnackBar(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(description ?? ''),
              ],
            ),
          ),
          Icon(
            _getIcon(type),
            color: Colors.white,
          )
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
