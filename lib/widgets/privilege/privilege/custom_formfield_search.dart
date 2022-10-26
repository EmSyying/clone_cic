import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Utils/helper/color.dart';

class CustomFormFieldSearch extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final TextEditingController? controller;
  //final String? initialValue;
  final TextInputType? keyboardType;
  const CustomFormFieldSearch(
      {Key? key,
      this.onChanged,
      this.onSaved,
      this.controller,
      //this.initialValue,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/privilege/search.svg',
        ),
        const SizedBox(
          width: 6,
        ),
        Expanded(
          child: TextFormField(
            onChanged: onChanged,
            onSaved: onSaved,
            controller: controller,
            // initialValue: initialValue,
            keyboardType: keyboardType,
            autofocus: false,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.6,
                    color: Colors.grey,
                  ),
              border: InputBorder.none,
              fillColor: AppColor.backgroundColor,
              contentPadding: const EdgeInsets.only(bottom: 10),
            ),
          ),
        ),
      ],
    );
  }
}
