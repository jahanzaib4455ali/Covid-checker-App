import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';

enum ButtonType {
  primary,
  secondary,
  outline,
  text,
  danger,
}

enum ButtonSize {
  small,
  medium,
  large,
}

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? customColor;
  final Color? customTextColor;
  final double? customWidth;
  final double? customHeight;
  final EdgeInsetsGeometry? customPadding;

  const CommonButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = false,
    this.prefixIcon,
    this.suffixIcon,
    this.customColor,
    this.customTextColor,
    this.customWidth,
    this.customHeight,
    this.customPadding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : customWidth,
      height: customHeight ?? _getHeight(),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getBackgroundColor(),
          foregroundColor: _getTextColor(),
          elevation: _getElevation(),
          padding: customPadding ?? _getPadding(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_getBorderRadius()),
            side: _getBorderSide(),
          ),
          disabledBackgroundColor: _getDisabledBackgroundColor(),
          disabledForegroundColor: _getDisabledTextColor(),
        ),
        child: isLoading
            ? SizedBox(
                width: _getLoadingSize(),
                height: _getLoadingSize(),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: _getLoadingColor(),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null) ...[
                    prefixIcon!,
                    SizedBox(width: 8.w),
                  ],
                  Flexible(
                    child: Text(
                      text,
                      style: _getTextStyle(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (suffixIcon != null) ...[
                    SizedBox(width: 8.w),
                    suffixIcon!,
                  ],
                ],
              ),
      ),
    );
  }

  double _getHeight() {
    switch (size) {
      case ButtonSize.small:
        return 40.h;
      case ButtonSize.medium:
        return 48.h;
      case ButtonSize.large:
        return 56.h;
    }
  }

  EdgeInsetsGeometry _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h);
      case ButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h);
      case ButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h);
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case ButtonSize.small:
        return 8.r;
      case ButtonSize.medium:
        return 12.r;
      case ButtonSize.large:
        return 16.r;
    }
  }

  Color _getBackgroundColor() {
    if (customColor != null) return customColor!;
    
    switch (type) {
      case ButtonType.primary:
        return MyColors.dark000000;
      case ButtonType.secondary:
        return MyColors.grayF5F5F5;
      case ButtonType.outline:
        return Colors.transparent;
      case ButtonType.text:
        return Colors.transparent;
      case ButtonType.danger:
        return Colors.red;
    }
  }

  Color _getTextColor() {
    if (customTextColor != null) return customTextColor!;
    
    switch (type) {
      case ButtonType.primary:
        return Colors.white;
      case ButtonType.secondary:
        return MyColors.dark000000;
      case ButtonType.outline:
        return MyColors.dark000000;
      case ButtonType.text:
        return MyColors.dark000000;
      case ButtonType.danger:
        return Colors.white;
    }
  }

  Color _getDisabledBackgroundColor() {
    switch (type) {
      case ButtonType.primary:
        return MyColors.gray667085.withOpacity(0.3);
      case ButtonType.secondary:
        return MyColors.grayF5F5F5.withOpacity(0.5);
      case ButtonType.outline:
        return Colors.transparent;
      case ButtonType.text:
        return Colors.transparent;
      case ButtonType.danger:
        return Colors.red.withOpacity(0.5);
    }
  }

  Color _getDisabledTextColor() {
    return MyColors.gray667085;
  }

  BorderSide _getBorderSide() {
    switch (type) {
      case ButtonType.outline:
        return BorderSide(
          color: MyColors.grayD0D5DD,
          width: 1,
        );
      default:
        return BorderSide.none;
    }
  }

  double _getElevation() {
    switch (type) {
      case ButtonType.primary:
        return 0;
      case ButtonType.secondary:
        return 0;
      case ButtonType.outline:
        return 0;
      case ButtonType.text:
        return 0;
      case ButtonType.danger:
        return 0;
    }
  }

  TextStyle _getTextStyle() {
    double fontSize;
    switch (size) {
      case ButtonSize.small:
        fontSize = 14.sp;
        break;
      case ButtonSize.medium:
        fontSize = 16.sp;
        break;
      case ButtonSize.large:
        fontSize = 16.sp;
        break;
    }

    return TextStyle(
      fontFamily: 'Plus Jakarta Sans',
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: _getTextColor(),
    );
  }

  double _getLoadingSize() {
    switch (size) {
      case ButtonSize.small:
        return 16.w;
      case ButtonSize.medium:
        return 20.w;
      case ButtonSize.large:
        return 24.w;
    }
  }

  Color _getLoadingColor() {
    return _getTextColor();
  }
}

// Specialized action buttons for common scenarios
class ActionButtonPair extends StatelessWidget {
  final String primaryText;
  final String secondaryText;
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;
  final bool primaryLoading;
  final bool secondaryLoading;
  final ButtonSize size;

  const ActionButtonPair({
    super.key,
    required this.primaryText,
    required this.secondaryText,
    this.onPrimaryPressed,
    this.onSecondaryPressed,
    this.primaryLoading = false,
    this.secondaryLoading = false,
    this.size = ButtonSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CommonButton(
            text: secondaryText,
            onPressed: onSecondaryPressed,
            type: ButtonType.outline,
            size: size,
            isLoading: secondaryLoading,
            isFullWidth: true,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: CommonButton(
            text: primaryText,
            onPressed: onPrimaryPressed,
            type: ButtonType.primary,
            size: size,
            isLoading: primaryLoading,
            isFullWidth: true,
          ),
        ),
      ],
    );
  }
}

// Voice button widget matching Figma design
class VoiceButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isActive;

  const VoiceButton({
    super.key,
    this.onPressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isActive ? MyColors.dark000000 : MyColors.grayF5F5F5,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.mic,
              color: isActive ? Colors.white : MyColors.dark000000,
              size: 16.w,
            ),
            SizedBox(width: 8.w),
            Text(
              'Voice',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: isActive ? Colors.white : MyColors.dark000000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Back button widget matching Figma design
class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomBackButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => Navigator.pop(context),
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: MyColors.grayF5F5F5,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          Icons.arrow_back,
          size: 20.w,
          color: MyColors.dark000000,
        ),
      ),
    );
  }
}