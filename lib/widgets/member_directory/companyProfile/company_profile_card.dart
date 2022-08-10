import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompanyProfileCard extends StatefulWidget {
  final GestureDoubleTapCallback? onTap;
  final String? companyName;
  final String? imgUrl;
  final bool? isEditable;

  const CompanyProfileCard({
    Key? key,
    this.companyName,
    this.imgUrl,
    this.onTap,
    this.isEditable = false,
  }) : super(key: key);

  @override
  State<CompanyProfileCard> createState() => _CompanyProfileCardState();
}

class _CompanyProfileCardState extends State<CompanyProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        widget.isEditable!
            ? GestureDetector(
                onTap: widget.onTap,
                child: Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child:
                        SvgPicture.asset('assets/images/svgfile/edit-3.svg')),
              )
            : const SizedBox(),
        Row(
          children: [
            widget.imgUrl != null && widget.imgUrl != ''
                ? Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.greenAccent,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("${widget.imgUrl}"),
                      ),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.companyName != null && widget.companyName != ""
                          ? widget.companyName![0]
                          : '',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.companyName ?? "",
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
