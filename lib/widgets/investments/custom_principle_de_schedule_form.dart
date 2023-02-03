// ignore_for_file: must_be_immutable

import 'package:cicgreenloan/utils/function/convert_to_double.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../modules/investment_module/controller/investment_controller.dart';
import '../../utils/form_builder/custom_textformfield.dart';
import '../../utils/helper/numerice_format.dart';

class CustomPrincipleSchedule extends StatelessWidget {
  final int? index;
  final GestureTapCallback? onTap;
  bool? isValidateDate;
  bool? isValidateAmount;

  final princepleCon = Get.put(PriceController());
  CustomPrincipleSchedule({
    Key? key,
    this.index = 0,
    this.onTap,
    this.isValidateDate,
    this.isValidateAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                "${index! + 1}${index! + 1 == 1 ? "st" : ""}${index! + 1 == 2 ? "nd" : ""}${index! + 1 == 3 ? "rd" : ""}${index! + 1 > 3 ? "th" : ""} installment",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.grey),
              ),
              const Spacer(),
              index! > 0
                  ? TextButton(
                      onPressed: onTap,
                      child: Text(
                        "Remove",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
        CustomTextFieldNew(
          keyboardType: TextInputType.number,
          inputFormatterList: [
            FilteringTextInputFormatter.digitsOnly,
            NumericTextFormatter(),
            FilteringTextInputFormatter.deny(RegExp(r'^0+')),
          ],
          isValidate: princepleCon.isValidateDeductionAmount.value,
          initialValue: princepleCon.deductionAmount.value == 0
              ? ""
              : princepleCon.deductionAmount.value.toString(),
          hintText: "Enter Amount",
          labelText: "Amount",
          isRequired: true,
          onChange: (valueChnaged) {
            var value = valueChnaged.replaceAll(',', '');

            if (value == "") {
              princepleCon.deductionAmount.value = onConvertToDouble(value);
              princepleCon.isValidateDeductionAmount.value = false;
            } else {
              princepleCon.deductionAmount.value = onConvertToDouble(value);
              princepleCon.isValidateDeductionAmount.value = true;
            }

            princepleCon.update();
          },
        ),

        //     : null),
      ],
    );
  }
}
