// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final double? width, height;
  final int duration;
  final TextCapitalization textCapitalization;
  bool isObscure;
  final TextInputType? keyBoardType;
  final bool isPassField;
  final bool shouldCenter;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? trailingWidget;
  bool showPrefix;
  bool autofocus;
  final dynamic maxLines;
  final dynamic minLines;
  final EdgeInsets? padding, margin, contentPadding;
  final Color? textFieldColor;
  final Color? textColor;
  bool readOnly;
  VoidCallback? onTap;
  final Color? borderColor, containerColor;
  final Widget? child;
  final FocusNode? focusNode;
  final Function(String)? onChnaged;
  final double? prefixWidth;
  final int? maxLength;
  final TextStyle? textStyle;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function(PointerDownEvent)? onTapOutside;
  final List<TextInputFormatter>? textInputFormater;
  final bool? isFilled;
  final BorderRadius? radius;
  final bool? isExapnd;
  final Size? suffixIconCons;

  var obscureText;

  CustomTextFormField({
    super.key,
    required this.hintText,
    this.radius,
    this.suffixIconCons,
    this.isExapnd,
    this.isFilled,
    this.isObscure = false,
    this.autofocus = false,
    this.keyBoardType,
    this.controller,
    this.duration = 0,
    this.isPassField = false,
    this.validator,
    this.onTap,
    this.margin,
    this.prefixIcon,
    this.maxLength,
    this.containerColor = Colors.transparent,
    this.showPrefix = true,
    this.trailingWidget,
    this.maxLines = 1,
    this.minLines,
    this.textFieldColor = const Color(0xffF7F7F7), //AppColors.grey215x4,
    this.textColor,
    this.readOnly = false,
    this.padding,
    this.borderColor = const Color(0xffE5E9EB), //AppColors.grey255254x3,
    this.height,
    this.width,
    this.child,
    this.shouldCenter = false,
    this.focusNode,
    this.onChnaged,
    this.prefixWidth,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.textStyle,
    this.contentPadding,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.textInputFormater,
    this.obscureText = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscure = false;
  bool hasStartedChanging = false;

  double height = 55;

  @override
  void initState() {
    if (widget.isPassField) {
      _resetObscure();
    }
    super.initState();
  }

  _resetObscure() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? const EdgeInsets.all(0),
      width: widget.width,
      height: (widget.height ?? height).h,
      margin: widget.margin,
      // height: widget.height ?? 56.pxV(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.containerColor,
        // color: black.withOpacity(0.4),
      ),
      alignment: Alignment.topLeft,

      child: TextFormField(
        focusNode: widget.focusNode,
        onTap: widget.onTap,
        obscureText: widget.isObscure,
        inputFormatters: widget.textInputFormater,
        autofocus: widget.autofocus,
        onTapOutside: widget.onTapOutside,
        readOnly: widget.readOnly,
        maxLength: widget.maxLength,
        textCapitalization: widget.textCapitalization,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        style: widget.textStyle,
        onChanged: (val) {
          if (widget.onChnaged != null) widget.onChnaged!(val);
          hasStartedChanging = true;

          if (mounted) setState(() {});
        },

        validator: widget.validator,
        controller: widget.controller,

        keyboardType: widget.keyBoardType,
        maxLines: widget.maxLines,

        cursorColor: MyColors.primaryDark1D1929,
        obscuringCharacter: "*",
        onFieldSubmitted: widget.onFieldSubmitted,
        textInputAction: widget.textInputAction,
        //Decoration
        decoration: InputDecoration(
          fillColor: widget.textFieldColor ??
              Theme.of(context).inputDecorationTheme.fillColor,
          filled: widget.isFilled ?? false,
          prefixIconConstraints: BoxConstraints.tight(
            Size(
              widget.prefixWidth ?? 0.20.sw,
              (56).h,
            ),
          ),
          suffixIconConstraints: BoxConstraints.tight(
            widget.suffixIconCons ??
                Size(
                  0.10.sw,
                  (56).h,
                ),
          ),
          border: _border(),
          focusedBorder: _border(),
          enabledBorder: _border(),
          disabledBorder: _border(),
          errorBorder: _border(),
          focusedErrorBorder: _border(),
          contentPadding:
              widget.contentPadding ?? EdgeInsets.symmetric(horizontal: 16.w),
          prefixIcon: widget.showPrefix == true ? widget.prefixIcon : null,
          hintText: widget.hintText,
          errorStyle:
              myTextStyle.font_12w400.copyWith(color: const Color(0xffF6574C)),
          hintStyle: myTextStyle.font_12w400.copyWith(
            color: MyColors.gray838383,
            fontSize: 14.h,
          ),
          suffixIcon: widget.trailingWidget,
        ),
      ),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: widget.radius ?? BorderRadius.circular(10.h),
      borderSide: BorderSide(
        width: 1,
        style: BorderStyle.solid,
        color: widget.borderColor!,
      ),
      gapPadding: 0,
    );
  }
}
