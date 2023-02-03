import 'package:cicgreenloan/Utils/form_builder/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPopupbuttonSheet extends StatefulWidget {
  final double? imagePaddingFromTop;
  final String? title;
  final String? description;
  final String? assetImage;
  final bool isImageAnimated;
  final String? buttonTitle;
  final String? imageUrl;
  final double? imageWidth;
  final double? imageHeight;
  const CustomPopupbuttonSheet(
      {Key? key,
      this.imagePaddingFromTop = 0,
      @required this.title,
      @required this.description,
      this.assetImage = 'assets/images/svgfile/home_icons/SHGLogo.svg',
      this.isImageAnimated = true,
      this.buttonTitle = 'OK',
      this.imageUrl,
      this.imageHeight = 200,
      this.imageWidth = 200})
      : super(key: key);

  @override
  State<CustomPopupbuttonSheet> createState() => _CustomPopupbuttonSheetState();
}

class _CustomPopupbuttonSheetState extends State<CustomPopupbuttonSheet>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _animation;
  AnimationController? _animationController;

  Animation<Offset>? _animationBottomsheet;
  double? topPosition;
  double? bottomPosition;
  bool moveUp = false;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _animationController!.forward();

    _animationBottomsheet =
        Tween(begin: Offset.zero, end: const Offset(0, 0.09))
            .animate(_animationController!);

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500))
      ..repeat(reverse: true);
    _animation = Tween(
      begin: const Offset(0, -0.05),
      end: const Offset(0, 0.05),
    ).animate(_controller!);

    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    _controller!.dispose();
    super.dispose();

    // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          height: 380,
          width: double.infinity,
        ),
        Positioned(
          top: 15,
          left: 0,
          right: 0,
          child: SlideTransition(
            position: _animationBottomsheet!,
            child: Container(
              padding: const EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              width: double.infinity,
              height: 360,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.title}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 55),
                    child: Text(
                      '${widget.description}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CustomButton(
                      title: widget.buttonTitle,
                      onPressed: () {
                        // setState(() {
                        //   moveUp = !moveUp;
                        // });
                        Navigator.pop(context);
                      },
                      isOutline: false,
                      isDisable: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: widget.imagePaddingFromTop,
          right: 0,
          left: 0,
          child: widget.isImageAnimated
              ? SlideTransition(
                  position: _animation!,
                  child: widget.imageUrl == null
                      ? SvgPicture.asset(
                          '${widget.assetImage}',
                          width: 150,
                          height: 150,
                        )
                      : Image.network(
                          '${widget.imageUrl}',
                          width: widget.imageWidth,
                          height: widget.imageHeight,
                        ),
                )
              : widget.imageUrl == null
                  ? SvgPicture.asset(
                      '${widget.assetImage}',
                      width: 150,
                      height: 150,
                    )
                  : Image.network(
                      '${widget.imageUrl}',
                      width: widget.imageWidth,
                      height: widget.imageHeight,
                    ),
        ),
      ],
    );
  }
}
