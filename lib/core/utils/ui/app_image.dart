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
    this.isLottieControlled = false,
    this.isCircle = false,
  });

  final String image;
  final double? width, height;
  final Color? color;
  final double? paddingBottomSpace;
  final BoxFit boxFit;
  final bool isLottieControlled;
  final bool isCircle;

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage> {
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
            );
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
