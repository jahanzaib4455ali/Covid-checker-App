import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';


import '../../../../l10n/app_localizations.dart';

class OrderFoodContainer extends StatelessWidget {
  const OrderFoodContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.only(left: 16.w, right: 8.w, top: 10.h, bottom: 14.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColors.grayD0D5DD,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                "Chicken Tikka Pizza",
                style: myTextStyle.font_16ww400.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: MyColors.dark242424,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: TextView(
                  maxLine: 4,
                  "Lorem ipsum dolor sit consect adipiscing elit. Sed id..",
                  style: myTextStyle.font_12w400.copyWith(
                    fontSize: 15.h,
                    color: MyColors.gray979797,
                  ),
                ),
              ),
              SizedBox(
                width: 24.w,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 37.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: MyColors.primaryDark1D1929.withOpacity(0.07),
                        border: Border.all(
                          color: MyColors.primaryDark1D1929,
                        ),
                      ),
                      child: TextView(
                        AppLocalizations.of(context)?.accept ??
                        "Accept",
                        style: myTextStyle.font_14w500.copyWith(
                          color: MyColors.primaryDark1D1929,
                          fontSize: 18.h,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  TextView(
                    AppLocalizations.of(context)?.assignedto ??
                    "Assigned to: Rahul",
                    style: myTextStyle.font_14w500.copyWith(
                      color: MyColors.primaryDark1D1929,
                      fontSize: 11.h,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),

            ],
          ),
          SizedBox(
            height: 18.h,
          ),
          Wrap(
            spacing: 15.w,
            runSpacing: 10.h,
            children: [
              RichText(
                text: TextSpan(
                    text: AppLocalizations.of(context)?.orderTime ?? "Order Time: ",
                    style: myTextStyle.font_16ww400.copyWith(
                      fontSize: 17.h,
                      color: MyColors.gray979797,
                    ),
                    children: [
                      TextSpan(
                        text: "10:31 AM",
                        style: myTextStyle.font_16ww400.copyWith(
                          fontSize: 16.h,
                        ),
                      )
                    ]),
              ),
              RichText(
                text: TextSpan(

                    text: AppLocalizations.of(context)?.qty ?? "Qty: ",
                    style: myTextStyle.font_16ww400.copyWith(
                      fontSize: 17.h,
                      color: MyColors.gray979797,
                    ),
                    children: [
                      TextSpan(
                        text: "1",
                        style: myTextStyle.font_16ww400.copyWith(
                          fontSize: 16.h,
                        ),
                      )
                    ]),
              ),
              RichText(
                text: TextSpan(

                    text:AppLocalizations.of(context)?.timer ?? "Timer: ",
                    style: myTextStyle.font_16ww400.copyWith(
                      fontSize: 17.h,
                      color: MyColors.gray979797,
                    ),
                    children: [
                      TextSpan(
                        text: "30 Min",
                        style: myTextStyle.font_16ww400.copyWith(
                          fontSize: 16.h,
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ],


      ),
    );
  }
}
