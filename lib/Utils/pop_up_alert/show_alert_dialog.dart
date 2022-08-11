import 'package:flutter/material.dart';

import '../helper/container_partern.dart';

showSaveDraftDialog({
  BuildContext? context,
  String? title,
  String? content,
  String? onSaveTitle,
  bool? isCancel,
  bool? isDisableSaveDraft = false,
  VoidCallback? onSave,
  VoidCallback? onDiscard,
  String? selectRemove,
  String? selectCancel,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context!,
    builder: (context) => AlertDialog(
      // insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      titlePadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRaduis),
        ),
      ),
      contentPadding: const EdgeInsets.all(0),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: isDisableSaveDraft!
            ? 270
            : isCancel == true
                ? 330
                : 265,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: padding, vertical: padding),
              child: Text(
                "$title",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppin',
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (content == null) const SizedBox(height: padding),
            if (content != null)
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: padding, right: padding, bottom: padding),
                child: Text(
                  content,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppin',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            if (!isDisableSaveDraft) const Spacer(),
            const Divider(
              height: 0,
              thickness: 0,
              color: Colors.grey,
            ),
            if (!isDisableSaveDraft)
              GestureDetector(
                onTap: onSave,
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: padding, vertical: padding),
                    child: Center(
                      child: Text(
                        selectCancel ??
                            (isCancel == true
                                ? onSaveTitle ?? 'Save Draft'
                                : 'Save'),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff007AFF),
                          fontFamily: 'Poppin',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            const Divider(
              height: 0,
              thickness: 0,
              color: Colors.grey,
            ),
            GestureDetector(
              onTap: onDiscard,
              child: Container(
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: padding, vertical: padding),
                  child: Center(
                    child: Text(
                      selectRemove ??
                          (isCancel == true ? 'Leave This Page' : 'Discard'),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff007AFF),
                        fontFamily: 'Poppin',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (isCancel == true)
              const Divider(
                height: 0,
                thickness: 0,
                color: Colors.grey,
              ),
            if (isCancel == true)
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: padding, vertical: padding),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff007AFF),
                          fontFamily: 'Poppin',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
