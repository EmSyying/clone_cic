import 'package:cicgreenloan/modules/wallet/screen/custom_keyboard.dart';
import 'package:cicgreenloan/utils/form_builder/custom_button.dart';
import 'package:cicgreenloan/utils/helper/color.dart';
import 'package:cicgreenloan/utils/helper/format_number.dart';
import 'package:flutter/material.dart';

import '../../../Utils/helper/custom_appbar.dart';
import '../../../Utils/helper/numerice_format.dart';

import '../../../widgets/mmaccount/wallet_total_amount_card.dart';
import '../../investment_module/screen/deposit_screen.dart';

class DepositToScreen extends StatefulWidget {
  const DepositToScreen({Key? key}) : super(key: key);

  @override
  State<DepositToScreen> createState() => _DepositToScreenState();
}

class _DepositToScreenState extends State<DepositToScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline2!;
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      appBar: CustomAppBar(
        context: context,
        title: 'To Deposit via banks',
        elevation: 0,
        backgroundColor: AppColor.mainColor,
        isLogo: true,
        leading: TextButton(
          style: TextButton.styleFrom(primary: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Row(
            children: const [
              Icon(Icons.arrow_back_ios),
              Text('Back'),
            ],
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            WalletTotalCard(
              amount: FormatNumber.formatNumber(230000),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Enter Deposit Amount',
                      style: textStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    TextFormField(
                      controller: _controller,
                      showCursor: false,
                      style: textStyle.copyWith(fontSize: 46),
                      inputFormatters: [
                        //FilteringTextInputFormatter.digitsOnly,
                        NumericTextFormatter(),
                      ],
                      textAlign: TextAlign.center,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: '0.00',
                        hintStyle: textStyle.copyWith(
                            fontSize: 46, color: AppColor.chartLabelColor),
                        border: InputBorder.none,
                      ),
                    ),
                    const Spacer(),
                    CustomKeyboard(
                      onChanged: (value) {
                        debugPrint(
                            'Offset ${_controller.selection.base.offset}');
                        setState(() {
                          _controller = TextEditingController(
                              text: FormatNumber.numberFormatdefual
                                  .parse(value)
                                  .toString());
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    SafeArea(
                      top: false,
                      minimum: const EdgeInsets.all(20),
                      child: CustomButton(
                        title: 'Next',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DepositeScreen(
                                id: 12,
                              ),
                            ),
                          );
                        },
                        isDisable: false,
                        isOutline: false,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
