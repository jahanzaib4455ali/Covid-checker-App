import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/base_state/base_state.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';

import '../../../theme/my_colors.dart';

class MyLoaderElvButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final dynamic state;
  final String text;
  final Widget? prefixIcon, suffixIcon;
  final Color? buttonBGColor;
  final Color? disabledTextColor, textColor;
  final double height, loaderWidth;
  final double? width;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final Gradient? gradient;
  final double? borderRadius;
  final Alignment? alignment;

  const MyLoaderElvButton({
    super.key,
    this.borderRadius,
    required this.text,
    required this.state,
    this.alignment,
    this.onPressed,
    this.buttonBGColor = MyColors.primaryDark1D1929,
    this.height = 44,
    this.loaderWidth = 65,
    this.disabledTextColor,
    this.textColor,
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle,
    this.width,
    this.padding = EdgeInsets.zero,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: AnimatedContainer(
        margin: padding,
        decoration: BoxDecoration(
          color: onPressed != null ? buttonBGColor : MyColors.transparent,
          borderRadius: BorderRadius.circular(loader ? 30 : borderRadius ?? 5),
          gradient: gradient,
        ),
        duration: const Duration(milliseconds: 500),
        height: height.h,
        width: loader
            ? loaderWidth
            : width == null
                ? 1.sw
                : width!.w,
        child: loader
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      textColor ?? MyColors.whiteFFFFFF,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              )
            : ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    // onPressed != null ? MyColors.gradient0014FFTo00E5FF : null,
                    Colors.transparent,
                  ),
                  shadowColor: WidgetStateProperty.all(Colors.transparent),
                  shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          loader ? 30.0 : borderRadius ?? 5),
                    ),
                  ),
                ),
                child: FittedBox(
                  child: Row(
                    children: [
                      prefixIcon ?? const SizedBox(),
                      const SizedBox(width: 10),
                      TextView(
                        loader ? "" : text,
                        textAlign: TextAlign.center,
                        maxLine: 1,
                        style: textStyle,
                      ),
                      const SizedBox(width: 10),
                      suffixIcon ?? const SizedBox(),
                    ],
                  ),
                ),
                // ),
              ),
      ),
    );
  }

  bool get loader => state is LoaderState;
}
