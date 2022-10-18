import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldNew extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatterList;
  final String? initialValue;
  final String? validateText;
  final ValueChanged<String>? onChange;
  final String? labelText;
  final String? hintText;
  final String? type;
  final String? suffixText;
  final FormFieldValidator<String>? validate;
  final Function? onTap;
  final FormFieldSetter<String>? onSave;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? keyboardType;
  final int? maxLine;
  final int? minLines;
  final Widget? suffixIcon;
  final bool? isRequired;
  final bool? isValidate;
  final bool? isReadOnly;
  final bool? autoFocus;
  final TextEditingController? controller;
  final FocusNode? focusScope;
  final VoidCallback? onEditingComplete;
  final bool? enable;
  final TextInputAction? textInputAction;
  final int? maxlenght;

  const CustomTextFieldNew({
    this.maxlenght,
    this.inputFormatterList,
    this.validateText,
    this.onEditingComplete,
    this.focusScope,
    Key? key,
    this.isReadOnly,
    this.controller,
    this.initialValue,
    this.onChange,
    this.labelText,
    this.hintText,
    this.type,
    this.suffixText,
    this.validate,
    this.onTap,
    this.autoFocus,
    this.onSave,
    this.keyboardType,
    this.maxLine,
    this.suffixIcon,
    this.isRequired,
    this.isValidate,
    this.textInputAction,
    this.enable = true,
    this.minLines,
    this.onFieldSubmitted,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onFieldSubmitted: onFieldSubmitted,
            minLines: minLines,
            autofocus: autoFocus ?? false,
            inputFormatters: inputFormatterList,
            focusNode: focusScope,
            onEditingComplete: onEditingComplete,
            controller: controller,
            // enabled: false,
            // autofocus: true,
            maxLength: maxlenght,

            textInputAction: textInputAction ?? TextInputAction.done,
            maxLines: maxLine,
            validator: validate,
            initialValue: controller == null ? initialValue : null,
            onChanged: onChange,
            autocorrect: true,
            autovalidateMode: AutovalidateMode.always,
            style: Theme.of(context).textTheme.bodyText2,

            onSaved: onSave,
            keyboardType: keyboardType,
            showCursor: true,
            enabled: enable,
            readOnly: isReadOnly ?? false,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              //=======new updade====
              label: RichText(
                text: TextSpan(
                  text: labelText,
                  style: Theme.of(context).textTheme.subtitle1,
                  children: [
                    if (isRequired != null)
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                  ],
                ),
              ),
              counterText: '',
              fillColor:
                  initialValue == '' || enable == false || isReadOnly == true
                      ? Colors.grey[100]
                      : Theme.of(context).cardColor,
              filled: true, suffixText: suffixText,
              suffixIcon: suffixIcon,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              // labelText: isRequired != null && isRequired!
              //     ? '$labelText *'
              //     : labelText,
              hintText: isRequired != null && isRequired! ? hintText : hintText,
              labelStyle: Theme.of(context).textTheme.subtitle1,
              hintStyle: Theme.of(context).textTheme.subtitle1,
              focusedBorder: initialValue != ''
                  ? OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[700]!),
                      borderRadius: BorderRadius.circular(10),
                    )
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
              border: initialValue != ''
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  : OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
              enabledBorder: initialValue != ''
                  ? OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[600]!),
                      borderRadius: BorderRadius.circular(10),
                    )
                  : OutlineInputBorder(
                      borderSide: isValidate != null && !isValidate!
                          ? const BorderSide(color: Colors.red)
                          : BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
          isValidate != null && !isValidate!
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        validateText ?? 'Please Enter ${labelText ?? hintText}',
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 10.5,
                            fontFamily: 'DMSans'),
                      ),
                      //  Text(
                      //   '{Please enter ${labelText ?? hintText}}',
                      //   style: TextStyle(
                      //       color: Colors.red,
                      //       fontSize: 12,
                      //       fontFamily: 'DMSans'),
                      // ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
