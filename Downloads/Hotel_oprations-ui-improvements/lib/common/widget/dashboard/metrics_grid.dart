import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/models/dashboard_models.dart';
import 'package:kunggy_operational_app/common/widget/dashboard/stat_card.dart';

class MetricsGrid extends StatelessWidget {
  final List<StatMetric> metrics;
  const MetricsGrid({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double available = constraints.maxWidth;
          final double itemWidth = (available - 12.w) / 2; // 12 spacing between
          return Wrap(
            runSpacing: 12.h,
            spacing: 12.w,
            children: metrics
                .map((m) => SizedBox(
                      width: itemWidth,
                      child: StatCard(metric: m),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
