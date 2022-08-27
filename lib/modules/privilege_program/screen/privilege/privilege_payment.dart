import 'package:cicgreenloan/Utils/function/convert_to_double.dart';
import 'package:cicgreenloan/modules/privilege_program/controller/privilege_controller.dart';
import 'package:cicgreenloan/modules/privilege_program/screen/privilege/payment_done_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/form_builder/custom_button.dart';
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

    priCon.onPaymentPrivilege;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: const Text(
          'Member ID: CiC123456',
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
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomPaymentPrivilege(
              title: 'Enter Amount',
              hintText: '0.00',
              onChanged: (value) {
                priCon.privilegeAmount.value = onConvertToDouble(value);
              },
              onSaved: (z) {},
            ),
          ),
          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 35.0, top: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                        left: 15.0, top: 20.0, bottom: 25.0),
                    child: (CustomButton(
                      title: "Cancel",
                      isOutline: true,
                      isDisable: false,
                      onPressed: () {},
                    )),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 20.0, bottom: 25.0, top: 20.0),
                    child: CustomButton(
                      title: 'Submit',
                      isDisable: false,
                      isOutline: false,
                      onPressed: () {
                        Navigator.pop(context, false);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentDoneScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
