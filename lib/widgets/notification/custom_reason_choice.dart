import 'package:cicgreenloan/modules/member_directory/models/user.dart';
import 'package:cicgreenloan/widgets/notification/custom_reason_select.dart';
import 'package:flutter/material.dart';

class CustomReasonChoice extends StatefulWidget {
  final Function? onSelect;
  final List<Gender>? reasonList;
  const CustomReasonChoice({Key? key, this.onSelect, this.reasonList})
      : super(key: key);

  @override
  State<CustomReasonChoice> createState() => _CustomReasonChoiceState();
}

class _CustomReasonChoiceState extends State<CustomReasonChoice> {
  int? currentIndex;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.reasonList!
          .asMap()
          .entries
          .map(
            (e) => InkWell(
              onTap: () {
                setState(() {
                  currentIndex = e.key;
                  e.value.isSelected = !e.value.isSelected!;
                });
                widget.onSelect!(e.value);
              },
              child: CustomReasonSelect(
                value: e.value,
                isSelected: e.value.isSelected ?? false,
              ),
            ),
          )
          .toList(),
    );
  }
}
