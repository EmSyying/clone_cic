// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../Utils/helper/box_decoration.dart';

class CustomExpansionCards extends StatefulWidget {
  bool? isExpand;
  final String? title;
  final String? description;
  CustomExpansionCards({Key? key, this.title, this.description, this.isExpand})
      : super(key: key);

  @override
  State<CustomExpansionCards> createState() => _CustomExpansionCardsState();
}

class _CustomExpansionCardsState extends State<CustomExpansionCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, left: 20.0, right: 20.0),
      decoration: boxExpansion,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(
              // decoration: boxExpansion,
              decoration: boxExpansion,
              child: Theme(
                data: Theme.of(context)
                    .copyWith(cardColor: Theme.of(context).cardColor
                        // cardColor: Colors.grey.shade50.withOpacity(1),
                        ),
                child: ExpansionPanelList(
                  animationDuration: const Duration(milliseconds: 100),
                  elevation: 0,
                  expansionCallback: (index, isExpand) {
                    setState(() {
                      widget.isExpand = !widget.isExpand!;
                    });
                  },
                  children: [
                    ExpansionPanel(
                      canTapOnHeader: true,
                      isExpanded: widget.isExpand!,
                      headerBuilder: (BuildContext context, bool isExpand) {
                        return Container(
                          padding: const EdgeInsets.only(top: 12, left: 20),
                          child: HtmlWidget(
                            widget.title!,
                            textStyle:
                                Theme.of(context).textTheme.displayMedium!,
                          ),
                        );
                      },
                      body: Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 15),
                        child: HtmlWidget(
                          widget.description!,
                          textStyle: Theme.of(context).textTheme.titleSmall!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
