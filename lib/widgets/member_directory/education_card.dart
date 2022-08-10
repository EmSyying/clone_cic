import 'package:cicgreenloan/modules/member_directory/models/eductation.dart';
import 'package:cicgreenloan/widgets/member_directory/member_displayinfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EducationInformationCard extends StatelessWidget {
  final List<EducationData>? educationList;
  final bool? isHide;
  final Function? onEdit;
  final Function? onSave;
  final bool? isEditable;

  const EducationInformationCard(
      {Key? key,
      this.educationList,
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
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 20, bottom: 20.0),
                child: Row(
                  children: const [
                    Text(
                      'Education Information',
                      style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    // Spacer(),
                    // GestureDetector(
                    //   onTap: onEdit,
                    //   child:
                    //       SvgPicture.asset('assets/images/svgfile/edit-3.svg'),
                    // )
                  ],
                ),
              ),
              Column(
                  children: educationList!
                      .asMap()
                      .entries
                      .map((e) => EducationItemCard(
                          school: e.value.school!,
                          degree: e.value.degree!.display!,
                          fieldOfStudy: e.value.fieldOfStudy!.display!,
                          startDate: e.value.startDate!,
                          endDate: e.value.endDate!,
                          description: e.value.description!,
                          grade: e.value.grade!,
                          onEdit: () {
                            onEdit!(e.key);
                          }))
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
                          'Add Education',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

class EducationItemCard extends StatelessWidget {
  final String? school;
  final String? degree;
  final String? fieldOfStudy;
  final String? startDate;
  final String? endDate;
  final String? description;
  final String? grade;
  final Function? onEdit;

  const EducationItemCard(
      {Key? key,
      this.school,
      this.degree,
      this.fieldOfStudy,
      this.startDate,
      this.endDate,
      this.description,
      this.grade,
      this.onEdit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (school != '')
                  MemberDisplayInfo(label: 'School:', value: school!),
                if (degree != '')
                  MemberDisplayInfo(label: 'Degree:', value: degree!),
                if (fieldOfStudy != '')
                  MemberDisplayInfo(
                      label: 'Field of study:', value: fieldOfStudy!),
                if (startDate != '')
                  MemberDisplayInfo(label: 'Start date:', value: startDate!),
                if (endDate != '')
                  MemberDisplayInfo(label: 'End date:', value: endDate!),
                if (grade != '')
                  MemberDisplayInfo(label: 'Grade:', value: grade!),
                if (description != '')
                  MemberDisplayInfo(
                    label: 'Description:',
                    value: description!,
                    isMultipleLine: true,
                  ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => onEdit,
            child: Container(
                margin: const EdgeInsets.only(right: 20.0, top: 7.0),
                child: SvgPicture.asset('assets/images/svgfile/edit-3.svg')),
          )
        ],
      ),
    );
  }
}
