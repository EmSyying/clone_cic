import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

openDateTimePicker(
    {BuildContext? context,
    var currentDate,
    ValueChanged? onChange,
    DateTime? selectedDate,
    bool? getDateTimeFormat,
    Function? onSelectDone}) {
  return showModalBottomSheet(
      builder: (BuildContext context) {
        DateTime? date = DateTime.now();
        DateTime? dateTime;
        return StatefulBuilder(
          builder: (context, setState) => SizedBox(
            height: 250,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: Text(
                          'Cancel',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text(
                          'Done',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        onPressed: () {
                          dateTime = date != null ? date! : selectedDate!;
                          String myDate =
                              DateFormat("dd-MM-yyyy", 'en').format(dateTime!);
                          if (getDateTimeFormat != null && getDateTimeFormat) {
                            onSelectDone!(dateTime);
                          } else {
                            onSelectDone!(myDate);
                          }

                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    minimumDate: currentDate,
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: selectedDate ?? dateTime,
                    onDateTimeChanged: (DateTime value) {
                      String myDate =
                          DateFormat("dd-MM-yyyy", 'en').format(value);
                      if (getDateTimeFormat != null && getDateTimeFormat) {
                        // debugPrint(" Date --- $value");
                        onChange!(value);
                      } else {
                        // debugPrint("  --- $myDate");
                        onChange!(myDate);
                      }
                      setState(() {
                        date = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      context: context!);
}
