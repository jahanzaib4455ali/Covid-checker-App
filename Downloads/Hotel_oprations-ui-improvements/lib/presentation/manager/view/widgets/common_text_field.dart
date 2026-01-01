import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool isRequired;
  final int maxLines;
  final bool enabled;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool readOnly;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  const CommonTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.isRequired = false,
    this.maxLines = 1,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.textStyle,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Row(
            children: [
              Text(
                labelText!,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.dark000000,
                ),
              ),
              if (isRequired)
                Text(
                  ' *',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),
        ],
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: maxLines == 1 ? 56.h : 120.h,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
            decoration: BoxDecoration(
              color: enabled ? MyColors.grayF5F5F5 : MyColors.grayF5F5F5.withOpacity(0.5),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: MyColors.grayD0D5DD.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                if (prefixIcon != null) ...[
                  prefixIcon!,
                  SizedBox(width: 12.w),
                ],
                Expanded(
                  child: TextField(
                    controller: controller,
                    enabled: enabled,
                    readOnly: readOnly,
                    maxLines: maxLines,
                    keyboardType: keyboardType,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle: hintStyle ?? TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.gray667085,
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: textStyle ?? TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.dark000000,
                    ),
                  ),
                ),
                if (suffixIcon != null) ...[
                  SizedBox(width: 12.w),
                  suffixIcon!,
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Specialized dropdown field that matches Figma design
class CommonDropdownField extends StatelessWidget {
  final String? value;
  final List<String> items;
  final Function(String?)? onChanged;
  final String? labelText;
  final String? hintText;
  final bool isRequired;
  final bool enabled;

  const CommonDropdownField({
    super.key,
    this.value,
    required this.items,
    this.onChanged,
    this.labelText,
    this.hintText,
    this.isRequired = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Row(
            children: [
              Text(
                labelText!,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.dark000000,
                ),
              ),
              if (isRequired)
                Text(
                  ' *',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),
        ],
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: enabled ? MyColors.grayF5F5F5 : MyColors.grayF5F5F5.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: MyColors.grayD0D5DD.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: hintText != null ? Text(
                hintText!,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.gray667085,
                ),
              ) : null,
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: MyColors.gray667085,
                size: 24.w,
              ),
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: MyColors.dark000000,
              ),
              items: items.map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    child: Text(item),
                  ),
                );
              }).toList(),
              onChanged: enabled ? onChanged : null,
            ),
          ),
        ),
      ],
    );
  }
}

// Search field with search icon
class CommonSearchField extends StatelessWidget {
  final String? value;
  final String? hintText;
  final String? labelText;
  final Function()? onTap;
  final bool isRequired;

  const CommonSearchField({
    super.key,
    this.value,
    this.hintText,
    this.labelText,
    this.onTap,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Row(
            children: [
              Text(
                labelText!,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.dark000000,
                ),
              ),
              if (isRequired)
                Text(
                  ' *',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),
        ],
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
            decoration: BoxDecoration(
              color: MyColors.grayF5F5F5,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: MyColors.grayD0D5DD.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value == 'Select' || value == null || value!.isEmpty 
                        ? (hintText ?? 'Select') 
                        : value!,
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: (value == 'Select' || value == null || value!.isEmpty) 
                          ? MyColors.gray667085 
                          : MyColors.dark000000,
                    ),
                  ),
                ),
                Icon(
                  Icons.search,
                  color: MyColors.gray667085,
                  size: 24.w,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}