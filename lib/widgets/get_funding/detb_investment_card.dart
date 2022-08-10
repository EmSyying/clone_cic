import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DebtInvestmentCard extends StatelessWidget {
  final String? amountPaid;
  final String? totalLoan;
  final String? id;
  final String? loanDuration;
  final String? paidDuration;
  final Function? onPayoff;

  const DebtInvestmentCard(
      {Key? key,
      this.amountPaid,
      this.totalLoan,
      this.id,
      this.loanDuration,
      this.paidDuration,
      this.onPayoff})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(1.0, 1.0), blurRadius: 5, color: Colors.black38)
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Theme.of(context).primaryColor.withOpacity(0.9),
          child: Stack(
            children: [
              Positioned(
                left: -70,
                top: 110,
                child: Container(
                  height: 300,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.elliptical(
                      300,
                      250,
                    )),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Positioned(
                right: -70,
                top: -200,
                child: Container(
                  height: 300,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.elliptical(
                      300,
                      250,
                    )),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amount Paid",
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.5)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            amountPaid!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Total Loan",
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.5)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            totalLoan!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'ID: $id',
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 150,
                                child: SfRadialGauge(
                                  enableLoadingAnimation: true,
                                  axes: <RadialAxis>[
                                    RadialAxis(
                                        axisLineStyle: const AxisLineStyle(
                                          cornerStyle: CornerStyle.bothCurve,
                                          thickness: 0.15,
                                          thicknessUnit: GaugeSizeUnit.factor,
                                        ),
                                        pointers: const <GaugePointer>[
                                          RangePointer(
                                            value: 80,
                                            width: 0.15,
                                            cornerStyle: CornerStyle.bothCurve,
                                            sizeUnit: GaugeSizeUnit.factor,
                                            gradient: SweepGradient(
                                                colors: <Color>[
                                                  Color(0xFF2DE236),
                                                  Color(0xFF09830F)
                                                ],
                                                stops: <double>[
                                                  0.25,
                                                  0.75
                                                ]),
                                          )
                                        ],
                                        labelFormat: '',
                                        showTicks: false),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '$paidDuration/$loanDuration',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Loan Duration',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                          GestureDetector(
                            onTap: () => onPayoff,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white),
                              ),
                              child: const Center(
                                child: Text(
                                  'Pay Off',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
