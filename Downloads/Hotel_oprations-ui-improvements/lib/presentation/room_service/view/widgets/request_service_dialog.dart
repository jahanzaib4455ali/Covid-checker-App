import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/my_text_field.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';


import '../../../../l10n/app_localizations.dart';

class ReqestServiceDialog extends StatefulWidget {
  const ReqestServiceDialog({
    super.key,
  });

  @override
  State<ReqestServiceDialog> createState() => _ReqestServiceDialogState();
}

class _ReqestServiceDialogState extends State<ReqestServiceDialog> {
  String paymentMethod = "POS/CASH";
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.only(left: 25.w, right: 22.w, top: 24.h),
        width: 1.sw - 26,
        height: 352,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: MyColors.whiteFFFFFF,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  "Payment Collection",
                  style: myTextStyle.font_20wMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    size: 32,
                    Icons.clear,
                    color: MyColors.gray979797,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            TextView(
              AppLocalizations.of(context)?.selectPaymentMethod ?? "Select Payment Method",
              style: myTextStyle.font_14w400,
            ),
            SizedBox(
              height: 11.h,
            ),
            DropdownButtonFormField(
              value: paymentMethod,
              items: [
                AppLocalizations.of(context)?.posCash ?? "POS/CASH",
              ].map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: myTextStyle.font_16ww500.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (p0) {
                paymentMethod = p0 ?? "1";
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: MyColors.grayF6F6F6,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: MyColors.grayD0D5DD,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: MyColors.grayD0D5DD,
                  ),
                ),
              ),
              dropdownColor: Colors.white,
            ),
            SizedBox(
              height: 15.h,
            ),
            TextView(
              "Enter Amount",
              style: myTextStyle.font_14w400,
            ),
            SizedBox(
              height: 11.h,
            ),
            CustomTextFormField(
              containerColor: MyColors.grayFBFBFB,
              borderColor: MyColors.grayD0D5DD,
              hintText: '\$25.00',
            ),
          ],
        ),
      ),
    );
  }
}
