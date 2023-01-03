import 'package:flutter/material.dart';

appMaintenance(BuildContext context) {
  OverlayEntry? overlayEntry;

  var topWidget = Container(
      color: Colors.black.withOpacity(0.7),
      height: 400,
      width: 300,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const CircleAvatar(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: Icon(Icons.check),
        ),
        const SizedBox(
            height: 150,
            child: Text(
              "This is an overlay.\nDo you like it?",
            )),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(onPressed: () {}, child: const Text("No, not really!")),
          ElevatedButton(
              onPressed: () {}, child: const Text("Yes, it's great!"))
        ])
      ]));

  overlayEntry = OverlayEntry(builder: (context) => topWidget);
  Overlay.of(context)!.insert(overlayEntry);
}
