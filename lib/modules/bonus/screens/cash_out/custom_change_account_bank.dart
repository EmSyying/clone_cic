import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_textformfield.dart';

import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/utils/form_builder/custom_drop_down.dart';
import 'package:cicgreenloan/utils/form_builder/dropdow_item.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/helper/container_partern.dart';

class CustomChangeAccountBank extends StatelessWidget {
  final bool? isFiF;
  CustomChangeAccountBank({Key? key, this.isFiF = false}) : super(key: key);
  final List dropDownList = ["ABA Bank", "ACELEDA Bank"];

  final newCashOutCon = Get.put(BonusController());
  @override
  Widget build(BuildContext context) {
    if (isFiF != true) {
      newCashOutCon.fetchBankInfo();
    }

    bool isValidate() {
      if (newCashOutCon.bankName.value == "") {
        newCashOutCon.isValidatebankInfo.value = false;
      } else {
        newCashOutCon.isValidatebankInfo.value = true;
      }
      if (newCashOutCon.accountName.value == "") {
        newCashOutCon.isValidateAccountName.value = false;
      } else {
        newCashOutCon.isValidateAccountName.value = true;
      }
      if (newCashOutCon.accountNumber.value == "") {
        newCashOutCon.isValidateAccountNumber.value = false;
      } else {
        newCashOutCon.isValidateAccountNumber.value = true;
      }
      if (newCashOutCon.bankName.value != "" &&
          newCashOutCon.accountNumber.value != "" &&
          newCashOutCon.accountName.value != "") {
        newCashOutCon.onCreateBankAccount(
          context: context,
        );
      }
      return false;
    }

    return Obx(
      () => Container(
        padding: const EdgeInsets.only(bottom: 30),
        height: MediaQuery.of(context).size.height / 2 +
            MediaQuery.of(context).viewInsets.bottom,
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 5,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRaduis),
                color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(right: 40),
                child: Text('Add new account'),
              ),
              const Spacer(),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              thickness: 1.2,
            ),
          ),
          // SizedBox(height: 20),
          Expanded(
            child: newCashOutCon.isCreateBank.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: [
                        CICDropdown(
                          defaultValue: newCashOutCon.bankName.value != ""
                              ? {
                                  "Code": newCashOutCon.bankName.value,
                                  "Name": newCashOutCon.bankName.value,
                                }
                              : null,
                          isValidate: newCashOutCon.isValidatebankInfo.value,
                          colors: Colors.white,
                          isPadding: const EdgeInsets.only(
                              left: 35, top: 5, bottom: 15),
                          label: 'Bank Name',
                          item: newCashOutCon.bankInfoList
                              .asMap()
                              .entries
                              .map((e) {
                            return DropDownItem(
                              itemList: {
                                "Name": e.value.name,
                                "Code": e.value.id,
                                "digits": e.value.digits
                              },
                            );
                          }).toList(),
                          onChange: (v) {
                            debugPrint(v['Name']);
                            if (v["Name"] == "") {
                              newCashOutCon.bankName.value = "";
                              newCashOutCon.isValidatebankInfo.value = false;
                            } else {
                              newCashOutCon.bankName.value = v["Name"];
                              newCashOutCon.bankinfoId.value = v["Code"];
                              newCashOutCon.bankdigits.value = v["digits"];
                              newCashOutCon.isValidatebankInfo.value = true;
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextFieldNew(
                          isValidate: newCashOutCon.isValidateAccountName.value,
                          labelText: 'Account Name *',
                          hintText: 'Account Name',
                          onChange: (value) {
                            if (value == "") {
                              newCashOutCon.accountName.value = "";
                              newCashOutCon.isValidateAccountName.value = false;
                              newCashOutCon.update();
                              newCashOutCon.accountName.refresh();
                              newCashOutCon.isValidateAccountName.refresh();
                            } else {
                              newCashOutCon.accountName.value = value;
                              newCashOutCon.isValidateAccountName.value = true;
                              newCashOutCon.update();
                              newCashOutCon.accountName.refresh();
                              newCashOutCon.isValidateAccountName.refresh();
                            }
                          },
                          initialValue: newCashOutCon.accountName.value,
                        ),
                        // SizedBox(height: 10),
                        CustomTextFieldNew(
                          keyboardType: TextInputType.number,
                          // validateText: newCashOutCon.accountNumber.value == ""
                          //     ? null
                          //     : newCashOutCon.validateAccountNumberText.value,
                          isValidate:
                              newCashOutCon.isValidateAccountNumber.value,
                          labelText: 'Account Number *',
                          hintText: 'Account Number',
                          onChange: (value) {
                            if (value == "") {
                              newCashOutCon.accountNumber.value = "";
                              newCashOutCon.isValidateAccountNumber.value =
                                  false;

                              newCashOutCon.update();
                              newCashOutCon.accountNumber.refresh();
                              newCashOutCon.isValidateAccountNumber.refresh();
                            } else {
                              newCashOutCon.accountNumber.value = value;
                              newCashOutCon.isValidateAccountNumber.value =
                                  true;
                              newCashOutCon.update();
                              newCashOutCon.accountNumber.refresh();
                              newCashOutCon.isValidateAccountNumber.refresh();
                            }
                          },
                          initialValue:
                              newCashOutCon.accountNumber.value.toString(),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                            padding:
                                const EdgeInsets.only(right: 20, left: 20.0),
                            child: CustomButton(
                              onPressed: () {
                                newCashOutCon.accountNumberController.text =
                                    newCashOutCon.accountNumber.value;

                                newCashOutCon.accountNameController.text =
                                    newCashOutCon.accountName.value;
                                isValidate();
                              },
                              title: 'Save',
                              isOutline: false,
                              isDisable: newCashOutCon.isCreateBank.value,
                            ))
                      ],
                    ),
                  ),
          ),
        ]),
      ),
    );
  }
}
