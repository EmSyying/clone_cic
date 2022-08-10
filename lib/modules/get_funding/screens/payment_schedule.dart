import 'package:flutter/material.dart';

class PaymentSchedule extends StatefulWidget {
  const PaymentSchedule({Key? key}) : super(key: key);

  @override
  State<PaymentSchedule> createState() => _PaymentScheduleState();
}

class _PaymentScheduleState extends State<PaymentSchedule> {
  bool isSelectNextpayment = false,
      isSelectUnpaid = false,
      isSelectPiad = false;
  int index = 0;
  String? eventLabel;
  @override
  void initState() {
    isSelectNextpayment = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Schedule',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 27),
        ),
        // SizedBox(height: 10,),
        Container(
          margin: const EdgeInsets.only(left: 0, right: 0, top: 26.0),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectNextpayment = true;
                      isSelectUnpaid = false;
                      isSelectPiad = false;
                      index = 0;
                      eventLabel = 'Next payment';
                    });
                  },
                  child: Container(
                    decoration: isSelectNextpayment
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).primaryColor.withAlpha(40),
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Theme.of(context).cardColor),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        'Next payment',
                        style: isSelectNextpayment
                            ? TextStyle(color: Theme.of(context).primaryColor)
                            : const TextStyle(),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectNextpayment = false;
                      isSelectUnpaid = true;
                      isSelectPiad = false;
                      index = 1;
                      eventLabel = 'Unpaid';
                    });
                  },
                  child: Container(
                    decoration: isSelectUnpaid
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).primaryColor.withAlpha(40),
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Theme.of(context).cardColor),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        'Unpiad',
                        style: isSelectUnpaid
                            ? TextStyle(color: Theme.of(context).primaryColor)
                            : const TextStyle(),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelectNextpayment = false;
                      isSelectUnpaid = false;
                      isSelectPiad = true;
                      index = 2;
                      eventLabel = 'Paid';
                    });
                  },
                  child: Container(
                    decoration: isSelectPiad
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).primaryColor.withAlpha(40),
                          )
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Theme.of(context).cardColor),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        'Paid',
                        style: isSelectPiad
                            ? TextStyle(color: Theme.of(context).primaryColor)
                            : const TextStyle(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 23,
        ),
      ],
    );
  }
}
