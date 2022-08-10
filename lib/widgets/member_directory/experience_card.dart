import 'package:cicgreenloan/modules/member_directory/models/experience_data.dart';
import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExperienceInformationCard extends StatelessWidget {
  final List<ExperienceData>? experienceList;
  final bool? isHide;
  final Function? onEdit;
  final Function? onSave;
  final bool? isEditable;

  const ExperienceInformationCard(
      {Key? key,
      this.experienceList,
      this.isHide,
      this.isEditable,
      this.onEdit,
      this.onSave})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isHide != null && isHide!
        ? Container()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                child: Row(
                  children: [
                    const Text(
                      'Experience Information',
                      style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    if (isEditable != null && isEditable!)
                      GestureDetector(
                          onTap: () => onEdit,
                          child: SvgPicture.asset(
                              'assets/images/svgfile/edit-3.svg'))
                  ],
                ),
              ),
              Column(
                  children: experienceList!
                      .map((e) => ExperienceItemCard(
                            title: e.title!,
                            employmentType: e.employmentType!.display!,
                            companyName: e.companyName!,
                            startDate: e.startDate!,
                            endDate: e.endDate!,
                            location: e.location!,
                          ))
                      .toList()),
              Container(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () => onSave,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.add,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Add Experience',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
  }
}

class ExperienceItemCard extends StatelessWidget {
  final String? title;
  final String? employmentType;
  final String? companyName;
  final String? startDate;
  final String? endDate;
  final String? location;

  const ExperienceItemCard(
      {Key? key,
      this.title,
      this.employmentType,
      this.companyName,
      this.startDate,
      this.endDate,
      this.location})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != '')
            MemberDisplayInfo(
              label: 'Title:',
              value: title!,
              isLongLabel: true,
            ),
          if (employmentType != '')
            MemberDisplayInfo(
              label: 'Imployment type:',
              value: employmentType!,
              isLongLabel: true,
            ),
          if (companyName != '')
            MemberDisplayInfo(
              label: 'Company name:',
              value: companyName!,
              isLongLabel: true,
            ),
          if (startDate != '')
            MemberDisplayInfo(
              label: 'Start date:',
              value: startDate!,
              isLongLabel: true,
            ),
          if (endDate != '')
            MemberDisplayInfo(
              label: 'End date:',
              value: endDate!,
              isLongLabel: true,
            ),
          if (location != '')
            MemberDisplayInfo(
              label: 'Location:',
              value: location!,
              isMultipleLine: true,
            ),
        ],
      ),
    );
  }
}
