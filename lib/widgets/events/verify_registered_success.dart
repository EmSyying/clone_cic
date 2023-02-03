import 'package:flutter/material.dart';

verifyRegistrationAlert(
    {BuildContext? context, String? description, Function? onTap}) {
  return showDialog(
    barrierDismissible: false,
    context: context!,
    builder: (BuildContext context) => StatefulBuilder(
      builder: (BuildContext context, setState) {
        return AlertDialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          titlePadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 100.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 20.0, right: 20.0),
                    child: Center(
                      child: Text(
                        '$description',
                        style: Theme.of(context).textTheme.displayMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 1,
                    indent: 1,
                  ),
                  const SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                      child: Text(
                        'OK',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
