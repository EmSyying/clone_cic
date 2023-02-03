import 'dart:io';

import 'package:flutter/material.dart';

import '../../utils/form_builder/custom_button.dart';

onShowAddOtherLabel({
  BuildContext? context,
  Widget? textFieldHere,
  GestureTapCallback? onSave,
  GestureTapCallback? onCancel,
  GestureTapCallback? onBack,
  String? title,
  bool? isHidebutton = true,
  bool? isNoAppBar = true,
  bool? isSubmit = false,
}) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(10),
        topLeft: Radius.circular(10),
      ),
    ),
    context: context!,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              isNoAppBar!
                  ? Container(
                      height: 60.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1.0, 0.0),
                              color: Colors.black12,
                              blurRadius: 6)
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                              onPressed: onBack,
                              icon: Platform.isAndroid
                                  ? const Icon(Icons.arrow_back)
                                  : const Icon(Icons.arrow_back_ios),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              '$title',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ))
                  : Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[400]),
                    ),
              const SizedBox(height: 20.0),
              SizedBox(
                child: textFieldHere,
              ),
              if (isHidebutton!)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: onCancel,
                          title: 'Cencel',
                          isDisable: false,
                          isOutline: true,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: CustomButton(
                          onPressed: onSave,
                          title: isSubmit! ? 'Submit' : 'Save',
                          isDisable: false,
                          isOutline: false,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      );
    },
  );
}
