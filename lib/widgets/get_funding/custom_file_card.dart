import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomFileCard extends StatelessWidget {
  final String? title;
  final String? extensionFile;
  const CustomFileCard({Key? key, this.title, this.extensionFile})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              offset: Offset(1.0, 0.0), color: Colors.black12, blurRadius: 0)
        ],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
        color: Colors.grey[200],
      ),
      child: Row(children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: SvgPicture.asset(extensionFile! == 'pdf'
              ? "assets/images/svgfile/pdfIcon.svg"
              : extensionFile! == 'doc'
                  ? "assets/images/svgfile/wordicon.svg"
                  : extensionFile! == 'docx'
                      ? "assets/images/svgfile/wordicon.svg"
                      : extensionFile! == 'xls'
                          ? "assets/images/svgfile/excelicon.svg"
                          : "assets/images/svgfile/excelicon.svg"),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Text(
              "$title",
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ]),
    );
  }
}
