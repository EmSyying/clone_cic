import 'package:cicgreenloan/modules/get_funding/controller/debt_investment_controller.dart';
import 'package:cicgreenloan/modules/get_funding/screens/equity_investment/PopupEdit/popup_image_edit.dart';
import 'package:cicgreenloan/Utils/form_builder/custom_material_modal_sheet.dart';
import 'package:cicgreenloan/widgets/get_funding/custom_text_getfunding.dart';
import 'package:flutter/material.dart';

class CustomReviwRequired extends StatefulWidget {
  final List? businessplan;
  const CustomReviwRequired({Key? key, this.businessplan}) : super(key: key);

  @override
  State<CustomReviwRequired> createState() => _CustomReviwRequiredState();
}

class _CustomReviwRequiredState extends State<CustomReviwRequired> {
  final DebtInvestmentController debtCon = DebtInvestmentController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.businessplan!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: CustomTextGetfunding(
              label1: 'Business Plan / Presentation ',
              label2: '(File Attachment)',
              isEdit: true,
              onTap: () async {
                var result = await onShowCustomCupertinoModalSheet(
                    icon: const Icon(Icons.clear),
                    isNoIcon: false,
                    title: 'Required Documents',
                    context: context,
                    child: PersonalInfoPopup(
                      label: 'Business Plan / Presentation (File Attachment)',
                    ));
                if (result != null) {
                  setState(() {
                    debtCon.businessPlan.value = result;
                  });
                }
              },
            ),
          ),
      ],
    );
  }
}
