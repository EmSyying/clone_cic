import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/form_builder/custom_button.dart';
import '../../../../Utils/function/convert_to_double.dart';
import '../../../../Utils/helper/custom_loading_button.dart';
import '../../../../widgets/privilege/custom_payment_priv.dart';

class PrivilegePayment extends StatelessWidget {
  final int? id;
  const PrivilegePayment({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priCon = Get.put(PrivilegeController());
    if (id != null) {
      priCon.shopId.value = id!;
    }
    // priCon.onPaymentPrivilege;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: const Text(
          'Claim Discount',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 22,
          ),
          onPressed: () {
            Navigator.pop(context);
            priCon.clearPaymentSetting();
          },
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: CustomPaymentPrivilege(
                title: 'Enter Amount',
                hintText: '0.00',
                controller: priCon.amountcontroller.value,
                onChanged: (value) {
                  priCon.validatePayment(value);

                  priCon.privilegeAmount.value =
                      onConvertToDouble(value).toString();
                },
                onSaved: (z) {},
              ),
            ),
            Container(
              color: Colors.white,
              child: SafeArea(
                top: false,
                minimum: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50.0,
                        width: double.infinity,
                        child: (CustomButton(
                          title: "Cancel",
                          isOutline: true,
                          isDisable: false,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: priCon.isPaymentLoading.value
                          ? const CustomLoadingButton()
                          : CustomButton(
                              title: 'Submit',
                              isDisable: priCon.privilegeAmount.value != '' &&
                                      priCon.validationPayment.value == false
                                  ? false
                                  : true,
                              isOutline: false,
                              onPressed: () {
                                if (priCon.privilegeAmount.value.isEmpty) {
                                  priCon.validationPayment(true);
                                } else {
                                  priCon.shopId.value = id!;
                                  priCon.validationPayment(false);
                                  priCon.onPaymentPrivilege(context: context);
                                }

                                debugPrint(
                                    'submit===${priCon.privilegeAmount.value}');
                                //  Navigator.pop(context, false);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => const PaymentDoneScreen(),
                                //   ),
                                //);
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
