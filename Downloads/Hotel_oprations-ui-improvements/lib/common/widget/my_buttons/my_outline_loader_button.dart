import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';

import '../../../theme/my_colors.dart';

class MyOutlineLoaderButton extends StatelessWidget {
  final bool loader;
  final VoidCallback? onPressed;
  final String text;
  final Widget? prefixIcon, suffixIcon;
  final Color? disabledTextColor, textColor;
  final double height, loaderWidth;
  final double? width;
  final TextStyle? textStyle;
  final EdgeInsets padding;

  const MyOutlineLoaderButton({
    super.key,
    required this.text,
    required this.loader,
    this.onPressed,
    this.height = 44,
    this.loaderWidth = 52,
    this.disabledTextColor,
    this.textColor,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.textStyle,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AnimatedContainer(
        padding: padding,
        decoration: BoxDecoration(
          color: MyColors.transparent,
          borderRadius: BorderRadius.circular(loader ? 30 : 5),
          border: Border.all(
            color: onPressed != null
                ? MyColors.primaryDark1D1929
                : MyColors.transparent,
          ),
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
                      textColor ?? MyColors.primaryDark1D1929,
                    ),
                  ),
                ),
              )
            : OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                  shadowColor: Colors.transparent,
                ),
                // ButtonStyle(
                //   side: ButtonStyleButton.allOrNull<BorderSide>(null
                //       // BorderSide(
                //       //   color: onPressed != null
                //       //       ? textColor ?? MyColors.primaryCyan01968C
                //       //       : disabledTextColor ?? MyColors.primaryCyan01968C,
                //       // ),
                //       ),
                //   shape: ButtonStyleButton.allOrNull<OutlinedBorder>(null
                //       // RoundedRectangleBorder(
                //       //   side: BorderSide(
                //       //     color: onPressed != null
                //       //         ? textColor ?? MyColors.primaryCyan01968C
                //       //         : disabledTextColor ?? MyColors.primaryCyan01968C,
                //       //   ),
                //       //   borderRadius: BorderRadius.circular(loader ? 30.0 : 5),
                //       // ),
                //       ),
                //   shadowColor: WidgetStateProperty.all(Colors.transparent),
                // ),
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
              ),
      ),
    );
  }
}
