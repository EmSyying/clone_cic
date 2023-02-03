import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardMenu extends StatefulWidget {
  final String? title;
  final Color? backgroundColor;
  final GestureTapCallback? onTap;
  final String? icon;
  const DashBoardMenu(
      {Key? key, this.title, this.backgroundColor, this.onTap, this.icon})
      : super(key: key);
  @override
  State<DashBoardMenu> createState() => _DashBoardMenuState();
}

class _DashBoardMenuState extends State<DashBoardMenu> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) {
        return constrain.maxWidth > 300 ? mobile() : mobile();
      },
    );
  }

  mobile() {
    return InkWell(
      onTap: widget.onTap,
      child: AspectRatio(
        aspectRatio: 2 / 1.55,
        child: Container(
          // width: double.infinity,
          color: widget.backgroundColor ?? Theme.of(context).cardColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.icon!.contains("svg")
                  ? SvgPicture.network(
                      widget.icon!,
                      height: 35,
                    )
                  : CachedNetworkImage(
                      imageUrl: widget.icon!,
                      fadeInCurve: Curves.easeIn,
                      height: 40,
                    ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.title!,
                style: const TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ipad() {
    return GestureDetector(
      onTap: () => widget.onTap,
      child: AspectRatio(
        aspectRatio: 2 / 1.6,
        child: Container(
          // width: double.infinity,
          color: Theme.of(context).cardColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 4 / 1,
                child: widget.icon!.contains("svg")
                    ? SvgPicture.network(
                        widget.icon!,
                        height: 35,
                      )
                    : CachedNetworkImage(
                        imageUrl: widget.icon!,
                        fadeInCurve: Curves.easeIn,
                        height: 40,
                      ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.title!,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
