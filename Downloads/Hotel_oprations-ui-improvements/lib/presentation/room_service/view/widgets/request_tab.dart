import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/presentation/room_service/view/widgets/request_service_dialog.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';


import '../../../../l10n/app_localizations.dart';

class RequestTab extends StatelessWidget {
  const RequestTab({
    super.key,
    required this.isOrderDelivery,
  });

  final bool isOrderDelivery;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(bottom: 15.h),
            padding: EdgeInsets.only(
                left: 13.w, right: 12.w, top: 12.h, bottom: 14.h),
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
                    Expanded(
                      child: Row(
                        children: [
                          Flexible(
                            child: TextView(
                              AppLocalizations.of(context)?.chickenTikkaPizzas ?? "2 Chicken Tikka Pizza's",
                              style: myTextStyle.font_16ww400.copyWith(
                                fontWeight: FontWeight.w600,
                                color: MyColors.dark242424,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          if (!isOrderDelivery)
                            TextView(
                              AppLocalizations.of(context)?.time ?? "10:31 AM",
                              style: myTextStyle.font_14w400.copyWith(
                                fontSize: 16.h,
                                color: MyColors.gray979797,
                              ),
                            ),
                          if (isOrderDelivery)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: MyColors.dark000000),
                              ),
                              child: TextView(
                                "30:00",
                                style: myTextStyle.font_14w400.copyWith(
                                  fontSize: 13.h,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const ReqestServiceDialog();
                          },
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.h,
                        width: isOrderDelivery ? 110.w : 90.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: MyColors.primaryDark1D1929.withOpacity(0.07),
                          border: Border.all(
                            color: MyColors.primaryDark1D1929,
                          ),
                        ),
                        child: TextView(
                          isOrderDelivery ? AppLocalizations.of(context)?.markDelivered ?? "Delivered" : AppLocalizations.of(context)?.accept ?? "Accept",
                          style: myTextStyle.font_16ww500.copyWith(
                            color: MyColors.primaryDark1D1929,
                            fontSize: 16.h,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      "\$25.00",
                      style: myTextStyle.font_14w500.copyWith(
                        fontSize: 17.h,
                        fontWeight: FontWeight.w600,
                        color: MyColors.dark242424,
                      ),
                    ),
                    TextView(
                      "Cash on Delivery",
                      style: myTextStyle.font_14w400.copyWith(
                        fontSize: 17.h,
                        color: MyColors.gray979797,
                      ),
                    ),
                  ],
                ),

                    TextView(
                      "Assigned to: Rahul",
                      style: myTextStyle.font_14w500.copyWith(
                        color: MyColors.primaryDark1D1929,
                        fontSize: 17.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),


                SizedBox(
                  height: 8.h,
                ),
                TextView(
                  "Order Pick From:",
                  style: myTextStyle.font_14w400.copyWith(
                    fontSize: 16.h,
                    color: MyColors.gray979797,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      "(Pick-up Kitchen  Name)",
                      style: myTextStyle.font_14w400.copyWith(
                        fontSize: 16.h,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    TextView(
                      "Chef Name",
                      style: myTextStyle.font_14w400.copyWith(
                        fontSize: 16.h,

                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  height: 1,
                  color: MyColors.grayD0D5DD,
                  width: 209.w,
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextView(
                  AppLocalizations.of(context)?.deliverTo ?? "Deliver To:",
                  style: myTextStyle.font_14w400.copyWith(
                    fontSize: 18.h,
                    color: MyColors.gray979797,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Wrap(
                  spacing: 15.w,
                  runSpacing: 10.h,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: AppLocalizations.of(context)?.guestName ?? "Guest Name: ",
                          style: myTextStyle.font_12w400.copyWith(
                            fontSize: 18.h,
                            color: MyColors.gray979797,
                          ),
                          children: [
                            TextSpan(
                              text: "Rahul Kumar",
                              style: myTextStyle.font_12w400.copyWith(
                                fontSize: 18.h,
                              ),
                            )
                          ]),
                    ),
                    RichText(
                      text: TextSpan(
                          text: AppLocalizations.of(context)?.roomNo ?? "Room No:  ",
                          style: myTextStyle.font_12w400.copyWith(
                            fontSize: 18.h,
                            color: MyColors.gray979797,
                          ),
                          children: [
                            TextSpan(
                              text: "101",
                              style: myTextStyle.font_12w400.copyWith(
                                fontSize: 18.h,
                              ),
                            )
                          ]),
                    ),
                    RichText(
                      text: TextSpan(
                          text: AppLocalizations.of(context)?.orderId ?? "Order ID: ",
                          style: myTextStyle.font_12w400.copyWith(
                            fontSize: 18.h,
                            color: MyColors.gray979797,
                          ),
                          children: [
                            TextSpan(
                              text: "10098",
                              style: myTextStyle.font_12w400.copyWith(
                                fontSize: 18.h,
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
