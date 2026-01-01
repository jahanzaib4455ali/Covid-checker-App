import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/l10n/app_localizations.dart';
import '../../models/hk_task_model.dart';
import '../../../../utils/app_routes/routes.dart';

class HKTaskCard extends StatelessWidget {
  final HKTaskModel task;
  final bool isMyTask;
  final bool isDone;
  final VoidCallback onPrimaryTap;

  const HKTaskCard({
    super.key,
    required this.task,
    required this.onPrimaryTap,
    this.isMyTask = false,
    this.isDone = false,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: MyColors.grayD0D5DD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TIME + TITLE + BUTTON
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(task.time, style: myTextStyle.font_12w500),
                    TextView(
                      task.title,
                      maxLines: 2,
                      style: myTextStyle.font_16ww500.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: isDone ? null : onPrimaryTap,
                child: Container(
                  height: 48.h,
                  width: 150.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: MyColors.primaryDark1D1929),
                  ),
                  child: TextView(
                    isDone
                        ? l10n.statusCompleted
                        : isMyTask
                            ? l10n.buttonWorkDone
                            : l10n.buttonAcceptAndStart,
                    style: myTextStyle.font_14w500.copyWith(
                      fontWeight: FontWeight.w600,
                      color: MyColors.primaryDark1D1929,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          /// SUBTITLE + URGENT
          Row(
            children: [
              Expanded(
                child: TextView(
                  task.subtitle,
                  style: myTextStyle.font_12w400.copyWith(
                    color: MyColors.gray979797,
                  ),
                ),
              ),
              if (task.urgent)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: MyColors.buttonBgDark1D19299.withOpacity(.4),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextView(
                    l10n.urgent,
                    style: myTextStyle.font_14w500.copyWith(
                      color: MyColors.primaryDark1D1929,
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: 12.h),

          _info(l10n.guestName, task.guestName),
          _info(l10n.roomNoLabel, task.roomNo),
          _info(l10n.requestIdLabel, task.requestId),
          _info(l10n.roomStatus, task.roomStatus),

          /// ─── Bottom action row (only for MyTask or Done) ───
          if (isMyTask || isDone)
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        _smallActionButton(
                          label: l10n.reportIssue,
                          onTap: () => Navigator.pushNamed(context, Routes.reportIssueScreen),
                          borderColor: MyColors.redDD1111,
                          textColor: MyColors.redEA445C,
                        ),
                        SizedBox(width: 8.w),
                        _smallActionButton(
                          label: l10n.addAmenities,
                          onTap: () => Navigator.pushNamed(context, Routes.changeAmenitiesScreen),
                          borderColor: MyColors.primaryDark1D1929,
                          textColor: MyColors.primaryDark1D1929,
                        ),
                        SizedBox(width: 8.w),
                        _smallActionButton(
                          label: l10n.miniBarRefill,
                          onTap: () => Navigator.pushNamed(context, Routes.minibarRefillScreen),
                          borderColor: MyColors.primaryDark1D1929,
                          textColor: MyColors.primaryDark1D1929,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _info(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: RichText(
        text: TextSpan(
          text: "$title ",
          style: myTextStyle.font_14w500.copyWith(color: MyColors.gray979797),
          children: [
            TextSpan(
              text: value,
              style: myTextStyle.font_14w400.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _smallActionButton({
    required String label,
    required VoidCallback onTap,
    required Color borderColor,
    required Color textColor,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 32.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: borderColor),
          ),
          child: TextView(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: myTextStyle.font_10w500.copyWith(
              fontSize: 12.h,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
