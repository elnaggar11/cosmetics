import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class AppImage extends StatefulWidget {
  const AppImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.color,
    this.paddingBottomSpace,
    this.boxFit = BoxFit.scaleDown,
    this.isCircle = false,
    this.onLottieClicked,
  });

  final String image;
  final double? width, height;
  final Color? color;
  final double? paddingBottomSpace;
  final BoxFit boxFit;
  final bool isCircle;
  final VoidCallback? onLottieClicked;

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    if (widget.onLottieClicked != null) {
      _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 700),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myFit = widget.isCircle ? BoxFit.cover : widget.boxFit;

    return Padding(
      padding: widget.paddingBottomSpace != null
          ? EdgeInsetsGeometry.only(bottom: widget.paddingBottomSpace!)
          : EdgeInsetsGeometry.zero,

      child: Builder(
        builder: (context) {
          Widget child;

          if (widget.image.isEmpty) return SizedBox.shrink();

          if (widget.image.toLowerCase().endsWith('svg')) {
            child = SvgPicture.asset(
              "assets/icons/${widget.image}",
              fit: myFit,
              width: widget.width,
              height: widget.height,
              colorFilter: widget.color == null
                  ? null
                  : ColorFilter.mode(widget.color!, BlendMode.srcIn),
            );
          } else if (widget.image.startsWith("http")) {
            child = Image.network(
              widget.image,
              color: widget.color,
              fit: myFit,
              width: widget.width,
              height: widget.height,
            );
          } else if (widget.image.endsWith("json")) {
            child = Lottie.asset(
              "assets/lotties/${widget.image}",
              fit: myFit,
              width: widget.width,
              height: widget.height,
              controller: _controller,
            );
            if (widget.onLottieClicked != null) {
              child = GestureDetector(
                onTap: () {
                  if (_controller!.isCompleted) {
                    _controller!.reverse();
                  } else {
                    _controller!.forward();
                  }
                  widget.onLottieClicked?.call();
                },
                child: child,
              );
            }
          } else {
            child = Image.asset(
              "assets/images/${widget.image}",
              color: widget.color,
              fit: myFit,
              width: widget.width,
              height: widget.height,
            );
          }
          if (widget.isCircle) return ClipOval(child: child);

          return child;
        },
      ),
    );
  }
}
