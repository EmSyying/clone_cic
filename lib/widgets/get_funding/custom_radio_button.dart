// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomRadiobutton extends StatefulWidget {
  final ValueChanged<bool>? onSelect;
  final String? label;
  bool? selected;
  double? labelPadding = 10;
  double? contentPadding = 10;
  CustomRadiobutton(
      {Key? key,
      @required this.onSelect,
      @required this.label,
      @required this.selected,
      this.labelPadding,
      this.contentPadding})
      : super(key: key);
  @override
  State<CustomRadiobutton> createState() => _CustomRadiobuttonState();
}

class _CustomRadiobuttonState extends State<CustomRadiobutton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.selected = true;
        });
        widget.onSelect!(widget.selected!);
      },
      child: Container(
        margin: EdgeInsets.only(
            right: widget.contentPadding != null ? widget.contentPadding! : 10),
        child: Row(
          children: [
            widget.selected!
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor)),
                      ),
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor),
                      )
                    ],
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor)),
                      ),
                    ],
                  ),
            Padding(
              padding: EdgeInsets.only(
                  left:
                      widget.labelPadding != null ? widget.labelPadding! : 10),
              child: Text(widget.label!,
                  style: widget.selected!
                      ? TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                        )
                      : Theme.of(context).textTheme.bodyMedium),
            )
          ],
        ),
      ),
    );
  }
}
