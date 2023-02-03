import 'package:cicgreenloan/modules/member_directory/models/user.dart';
import 'package:flutter/material.dart';

class CustomReasonSelect extends StatefulWidget {
  final Gender? value;
  final bool? isSelected;
  const CustomReasonSelect({Key? key, this.value, this.isSelected = false})
      : super(key: key);

  @override
  State<CustomReasonSelect> createState() => _CustomReasonSelectState();
}

class _CustomReasonSelectState extends State<CustomReasonSelect> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            height: 23,
            width: 23,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: !widget.isSelected!
                    ? Border.all(color: Colors.grey, width: 2)
                    : null,
                color:
                    widget.isSelected! ? Theme.of(context).primaryColor : null),
            child: widget.isSelected!
                ? const Center(
                    child: Icon(
                      Icons.check,
                      size: 20,
                      color: Colors.white,
                    ),
                  )
                : Container(),
          ),
          Expanded(
            child: Text(
              widget.value!.display.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}
