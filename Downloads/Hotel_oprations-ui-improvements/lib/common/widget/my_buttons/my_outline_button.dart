import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class MyOutlineButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Widget? prefixIcon, suffixIcon;
  final Color? buttonBGColor, disabledTextColor, textColor;
  final double height, buttonRadius, outlineWidth;
  final double? width;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final double iconSpacing;

  const MyOutlineButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonBGColor,
    this.height = 44,
    this.width,
    this.disabledTextColor,
    this.textColor,
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle,
    this.outlineWidth = 1,
    this.padding = EdgeInsets.zero,
    this.iconSpacing = 10,
    this.buttonRadius = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        height: height.h,
        width: width == null ? 1.sw : width!.w,
        child: OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(
              textColor?.withOpacity(0.05) ?? MyColors.primaryDark1D1929,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius.h),
              ),
            ),
            side: WidgetStateProperty.all(
              BorderSide(
                width: outlineWidth,
                color: onPressed != null
                    ? textColor ?? MyColors.whiteFFFFFF
                    : Colors.transparent,
              ),
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
                  style: textStyle ??
                      myTextStyle.font_12w400.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(width: iconSpacing),
                suffixIcon ?? const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
