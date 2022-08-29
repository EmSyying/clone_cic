import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/helper/numerice_format.dart';

class CustomPaymentPrivilege extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  const CustomPaymentPrivilege({
    Key? key,
    this.onChanged,
    this.onSaved,
    this.controller,
    this.title,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final privilageController = Get.put(PrivilegeController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title ?? 'Enter Amount',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
        SizedBox(
          width: double.infinity,
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              NumericTextFormatter(),
              FilteringTextInputFormatter.deny(RegExp(r'^0+')),
            ],
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                  fontSize: 46,
                ),
            cursorHeight: 40,
            cursorColor: Colors.transparent,
            showCursor: false,
            textAlign: TextAlign.center,
            onChanged: onChanged,
            onSaved: onSaved,
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: hintText ?? '0.00',
              hintStyle: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.6,
                    fontSize: 46,
                    color: Colors.grey,
                  ),
              border: InputBorder.none,
            ),
          ),
        ),
        Obx(() => privilageController.validationPayment.value
            ? const Text('Please Enter amounts')
            : const SizedBox.shrink()),
      ],
    );
  }
}
