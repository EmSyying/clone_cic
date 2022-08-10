// ignore_for_file: must_be_immutable

import 'package:cicgreenloan/Utils/helper/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData? icon;
  final String? initialValue;
  final bool? isReadOnly;
  final IconData? actionIcon;
  String? nameText;
  final String? hinText;
  final TextInputType? textInputType;
  final Function? validator;
  final Function? onSaved;
  final TextEditingController? controller;
  final bool? obsecure;
  final Function? onTap;
  CustomTextFormField({
    Key? key,
    this.icon,
    this.actionIcon,
    this.initialValue,
    this.isReadOnly,
    this.nameText,
    this.hinText,
    this.textInputType,
    this.validator,
    this.onSaved,
    this.controller,
    this.obsecure,
    this.onTap,
  }) : super(key: key);
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0),
      child: Row(
        children: [
          Icon(widget.icon),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 20.0),
              child: TextFormField(
                obscureText: widget.obsecure!,
                controller: widget.controller,
                validator: (value) => widget.validator!(value),
                keyboardType: widget.textInputType,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14.0,
                    color: Theme.of(context).primaryColor),
                initialValue: widget.initialValue,
                autofocus: widget.isReadOnly!,
                readOnly: widget.isReadOnly!,
                textAlign: TextAlign.left,
                onChanged: (String value) {
                  setState(() {
                    widget.nameText = value;
                  });
                },
                onSaved: (value) => widget.onSaved!(value),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hinText,
                ),
              ),
            ),
          ),
          widget.nameText!.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: const Icon(Icons.check_circle, color: Colors.green),
                )
              : Container(),
          TextButton(
            onPressed: () => widget.onTap!(),
            child: Icon(
              widget.actionIcon,
              color: AppColor.textColor,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
