import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

appMaintenance(BuildContext context) {
  OverlayEntry? overlayEntry;
  OverlayState? overlayState = Overlay.of(context, rootOverlay: true);

  var topWidget = Container(
    color: Colors.black.withOpacity(0.7),
    child: Center(
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        width: double.infinity,
        height: 265.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 23.65),
              child: SvgPicture.asset(
                'assets/images/svgfile/underDevelopment.svg',
                width: 99.36,
                height: 74.43,
              ),
            ),
            Text(
              'Under Maintenance',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, right: 30.0, left: 30.0),
                child: Text(
                  'We are currently undergoing maintenance this  won’t take long',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 13.0, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
// Overlay.of(context)!.insertAll(overlayState!);
  overlayEntry = OverlayEntry(builder: (context) => topWidget);

  overlayState!.insert(overlayEntry);
}
