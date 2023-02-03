import 'package:cicgreenloan/Utils/web_view/web_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberDisplayInfo extends StatefulWidget {
  final String? label;
  final String? value;
  final bool? isLongLabel;
  final bool? isMultipleLine;
  final bool? isLabelNotSimple;
  final String? type;
  final bool? isTextAlignRight;
  final bool? changeColorText;
  const MemberDisplayInfo(
      {Key? key,
      this.label,
      this.changeColorText = false,
      this.value,
      this.isLongLabel,
      this.isMultipleLine,
      this.isLabelNotSimple,
      this.type,
      this.isTextAlignRight = false})
      : super(key: key);
  @override
  State<MemberDisplayInfo> createState() => _MemberDisplayInfoState();
}

class _MemberDisplayInfoState extends State<MemberDisplayInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.isMultipleLine != null && widget.isMultipleLine!
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 20.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.label!,
                    style: widget.isLabelNotSimple != null &&
                            widget.isLabelNotSimple!
                        ? const TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)
                        : widget.changeColorText!
                            ? const TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 14,
                                // color: Colors.black,
                                color: Color(0xff6D7174),
                                fontWeight: FontWeight.w400)
                            : const TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 14,
                                color: Color(0xff464646),
                                fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  child: Text(
                    widget.value!,
                    // overflow: TextOverflow.ellipsis,
                    style: widget.isLabelNotSimple != null &&
                            widget.isLabelNotSimple!
                        ? Theme.of(context).textTheme.bodyMedium
                        : widget.changeColorText!
                            ? const TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)
                            : Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0, left: 20.0),
                    child: Text(
                      widget.label!,
                      style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 14,
                          color: widget.changeColorText!
                              ? const Color(0xff464646)
                              : const Color(0xff6D7174),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: GestureDetector(
                    onTap: widget.type != null && widget.type == 'link'
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewWebsite(
                                  url: widget.value!,
                                  title: widget.label!.replaceAll(":", ""),
                                ),
                              ),
                            );
                          }
                        : widget.type != null && widget.type == 'phone'
                            ? () {
                                launchUrl(Uri.parse('tel:${widget.value}'));
                              }
                            : widget.type != null && widget.type == 'email'
                                ? () {
                                    launchUrl(
                                        Uri.parse('mailto:${widget.value}'));
                                  }
                                : () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 10.0, left: 0.0, right: 20.0),
                      child: Text(
                        widget.value ?? "",
                        style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 14,
                            color: widget.changeColorText!
                                ? const Color(0xff0A0B09)
                                : widget.type == "phone" ||
                                        widget.type == "email" ||
                                        widget.type == "link"
                                    ? Colors.blue
                                    : Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
