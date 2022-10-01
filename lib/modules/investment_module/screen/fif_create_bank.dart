import 'package:cicgreenloan/modules/bonus/controllers/bonus_controller.dart';
import 'package:cicgreenloan/modules/investment_module/controller/investment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/form_builder/custom_button.dart';
import '../../../Utils/form_builder/custom_textformfield.dart';
import '../../../Utils/helper/container_partern.dart';
import '../../../utils/form_builder/custom_drop_down.dart';
import '../../../utils/form_builder/dropdow_item.dart';

class FiFCreateBankAcc extends StatelessWidget {
  final GestureTapCallback? onTapSave;
  const FiFCreateBankAcc({Key? key, this.onTapSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fifCon = Get.put(PriceController());
    final bankCon = Get.put(BonusController());
    bankCon.fetchBankInfo();
    return Obx(
      () => Container(
        padding: const EdgeInsets.only(bottom: 20),
        height: MediaQuery.of(context).size.height / 2 +
            MediaQuery.of(context).viewInsets.bottom,
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 5,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRaduis),
                color: Colors.grey[400]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    )),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: Text('Add new account'),
                ),
                const Spacer(),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Divider(
              thickness: 1.2,
            ),
          ),
          // SizedBox(height: 20),
          Expanded(
            child: fifCon.isCreateBank.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: [
                        CICDropdown(
                          isValidate: fifCon.isfifBankName.value,
                          colors: Colors.white,
                          isPadding: const EdgeInsets.only(
                              left: 35, top: 5, bottom: 15),
                          label: 'Bank Name',
                          item: bankCon.bankInfoList.asMap().entries.map((e) {
                            return DropDownItem(
                              itemList: {
                                "Name": e.value.name,
                                "Code": e.value.id,
                              },
                            );
                          }).toList(),
                          onChange: (v) {
                            debugPrint('naaaaaaaaa:${v['Code']}');
                            if (v["Code"] == "") {
                              fifCon.fifBankName.value = "";
                              fifCon.isfifBankName.value = false;
                            } else {
                              fifCon.fifBankName.value = v["Name"];
                              fifCon.fifBankTypeId.value = v["Code"];
                              fifCon.isfifBankName.value = true;
                            }
                          },
                          defaultValue: fifCon.fifBankName.value != ""
                              ? {
                                  "Name": fifCon.fifBankName.value,
                                  "Code": fifCon.fifBankId.value,
                                }
                              : null,
                        ),
                        const SizedBox(height: 10),
                        CustomTextFieldNew(
                          labelText: 'Account Name *',
                          hintText: 'Account Name',
                          onChange: (value) {
                            if (value.isEmpty) {
                              fifCon.fifAccName.value = '';
                              fifCon.isfifAccName.value = false;
                            } else {
                              fifCon.fifAccName.value = value;
                              fifCon.isfifAccName.value = true;
                            }
                          },
                          initialValue: fifCon.fifAccName.value,
                        ),
                        const SizedBox(height: 10),
                        CustomTextFieldNew(
                          keyboardType: TextInputType.number,
                          // validateText: newCashOutCon.accountNumber.value == ""
                          //     ? null
                          //     : newCashOutCon.validateAccountNumberText.value,
                          isValidate: fifCon.isfifAccNumber.value,
                          labelText: 'Account Number *',
                          hintText: 'Account Number',
                          onChange: (accNo) {
                            if (accNo.isEmpty) {
                              fifCon.fifAccNumber.value = '';
                              fifCon.isfifAccNumber.value = false;
                            } else {
                              fifCon.fifAccNumber.value = accNo;
                              fifCon.isfifAccNumber.value = true;
                            }
                          },
                          initialValue: fifCon.fifAccNumber.value,
                        ),
                        Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: CustomButton(
                                isDisable: false,
                                isOutline: true,
                                title: 'Cancel',
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: CustomButton(
                                isDisable: false,
                                isOutline: false,
                                title: 'Save',
                                onPressed: onTapSave,
                                // () {
                                //   debugPrint(
                                //       'id:::::${fifCon.fifAppModel.value.id}');
                                //   fifCon.onfifCreateBank(
                                //       fifId: fifCon.fifAppModel.value.id);
                                // },
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ]),
      ),
    );
  }
}
