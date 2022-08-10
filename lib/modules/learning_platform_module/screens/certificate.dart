import 'package:cicgreenloan/modules/report_module/screens/view_report.dart';
import 'package:cicgreenloan/widgets/learning/certificate_card.dart';
import 'package:flutter/material.dart';

import '../../../Utils/helper/learning_platform/certificate_list.dart';

class CertificatePage extends StatefulWidget {
  const CertificatePage({Key? key}) : super(key: key);

  @override
  State<CertificatePage> createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Column(
              children: certificateList.map((certificate) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewReport(
                                certificateModel: certificate,
                              )));
                },
                child: CertificateCard(certificate: certificate));
          }).toList()),
        ],
      ),
    );
  }
}
