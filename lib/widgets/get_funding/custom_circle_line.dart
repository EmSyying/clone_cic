import 'package:flutter/material.dart';

class CircleLine extends StatefulWidget {
  final Axis? direction;
  final List? steps;
  final double? size;
  final Map? path;
  final double? heightContainer;
  final bool contractStyle;
  const CircleLine({
    this.heightContainer,
    Key? key,
    this.direction = Axis.vertical,
    @required this.steps,
    this.size = 21,
    @required this.path,
    this.contractStyle = false,
  }) : super(key: key);

  @override
  State<CircleLine> createState() => _CircleLineState();
}

class _CircleLineState extends State<CircleLine> {
  final GlobalKey _textKey = GlobalKey();

  Size? textSize;
  getSizeAndPosition() {
    // RenderBox _cardBox = _textKey.currentContext.findRenderObject();
    // textSize = _textKey.currentContext.size;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
  }

  @override
  Widget build(BuildContext context) {
    if (textSize != null) {}
    return ListView.builder(
      //  itemExtent: 100,
      key: _textKey,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: widget.direction!,
      itemCount: widget.steps!.length,
      itemBuilder: (
        context,
        position,
      ) =>
          Stack(
        children: <Widget>[
          Positioned(
            top: widget.direction == Axis.horizontal
                ? 7 + widget.size! * 2.14 / 2 - 5 / 2
                : position == 0
                    ? textSize != null
                        ? textSize!.height / 7
                        : 35
                    : 0,
            bottom: widget.direction == Axis.horizontal
                ? null
                : position == widget.steps!.length - 1
                    ? textSize != null
                        ? textSize!.height / 5
                        : 50
                    : 0,
            left: widget.direction == Axis.horizontal ? 0 : 8.5,
            right: widget.direction == Axis.horizontal ? 0 : null,
            height: widget.direction == Axis.horizontal
                ? widget.path!['width']
                : null,
            width: widget.direction == Axis.horizontal
                ? null
                : widget.path!['width'],
            child: Container(
              color: widget.path!['color'],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    right: 14.5,
                    left: 2,
                    top: textSize != null ? textSize!.height / 11 : 28),
                padding: const EdgeInsets.all(2),
                width: widget.size! * 2,
                height: widget.size! * 2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.1, color: Colors.grey),
                  color: const Color(0xffDADADA),
                  borderRadius: BorderRadius.circular(widget.size! * 2.14),
                ),
                child: Container(
                  width: widget.size! * 1.0,
                  height: widget.size! * 1.0,
                  decoration: BoxDecoration(
                    border: widget.contractStyle
                        ? Border.all(width: 0, color: Colors.transparent)
                        : Border.all(width: 1, color: Colors.grey),
                    color: widget.steps![position]['background'],
                    borderRadius: BorderRadius.circular(widget.size! * 2.14),
                  ),
                ),
              ),
              widget.steps![position]['content'] != null
                  ? widget.direction == Axis.horizontal
                      ? Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: widget.steps![position]['content'],
                        )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: widget.steps![position]['content'],
                          ),
                        )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}
