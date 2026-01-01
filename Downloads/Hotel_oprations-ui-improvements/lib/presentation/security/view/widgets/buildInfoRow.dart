import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/widget/text_view.dart';
import '../../../../theme/my_text_styles.dart';

Widget buildInfoRow (String title, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 13.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(
          title,
          style: myTextStyle.font_16ww500.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        TextView(
          value,
          style: myTextStyle.font_16ww500.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}