import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';

import '../../../theme/my_colors.dart';

class MyElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Widget? prefixIcon, suffixIcon;
  final Color buttonBGColor;
  final Color? disabledTextColor, textColor;
  final double height, iconSpacing, buttonRadius;
  final double? width;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final Gradient? gradient;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;

  const MyElevatedButton({
    super.key,
    required this.text,
    this.border,
    this.onPressed,
    this.buttonBGColor = MyColors.primaryDark1D1929,
    this.height = 55,
    this.disabledTextColor,
    this.textColor,
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle,
    this.width,
    this.borderRadius,
    this.padding,
    this.iconSpacing = 10,
    this.buttonRadius = 5,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(10);
    return Container(
      // padding: padding,
      margin: padding,
      height: height.h,
      width: width == null ? MediaQuery.sizeOf(context).width : width!.w,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
        color: buttonBGColor,
        border: border,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: FittedBox(
          child: Row(
            children: [
              prefixIcon ?? const SizedBox(),
              SizedBox(width: iconSpacing),
              TextView(
                text,
                textAlign: TextAlign.center,
                maxLine: 1,
                style: textStyle,
              ),
              SizedBox(width: iconSpacing),
              suffixIcon ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}


