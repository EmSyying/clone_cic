import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ServiceAgreement extends StatelessWidget {
  final String? serviceAgreement;
  const ServiceAgreement({Key? key, this.serviceAgreement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          HtmlWidget(
            serviceAgreement!,
            textStyle: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
