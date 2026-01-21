import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_wash_tub_rider/utils/color_constant.dart';


class BorderContainerWidget extends StatelessWidget {
  const BorderContainerWidget({
    super.key,
    this.padding,
    this.margin,
    this.color,
    this.colorBorder,
    required this.child,
    this.width,
    this.shape,
    this.radius,
  });
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final Color? colorBorder;
  final Widget child;
  final double? width;
  final BoxShape? shape;
  final BorderRadiusGeometry? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding ?? EdgeInsets.all(7.w),
      margin: margin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        shape: shape ?? BoxShape.rectangle,
        borderRadius: shape == BoxShape.circle
            ? null
            : radius ?? BorderRadius.circular(12.r),
        color: color ?? AppColors.textFieldFillColor,
        border: Border.all(
          color: colorBorder ?? AppColors.containerBorderColor,
        ),
      ),
      child: child,
    );
  }
}
