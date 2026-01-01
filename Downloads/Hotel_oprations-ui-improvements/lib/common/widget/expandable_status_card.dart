import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/common/widget/vertical_divider_light.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class ExpandableStatusCard extends StatelessWidget {
  final List<Map<String, String>> headerColumns; // [{'label':'Department','value':'Housekeeping'}, ...]
  final Widget? details;
  final bool expanded;
  final VoidCallback onToggle;
  final String timeLabel;
  final String? extraTimeInfo;
  final String? extraTimeValue;

  const ExpandableStatusCard({
    super.key,
    required this.headerColumns,
    required this.expanded,
    required this.onToggle,
    this.details,
    required this.timeLabel,
    this.extraTimeInfo,
    this.extraTimeValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 2, top: 8, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(timeLabel,
                  style: myTextStyle.font_14w500.copyWith(color: MyColors.gray979797)),
              if (extraTimeInfo != null && extraTimeValue != null)
                Row(
                  children: [
                    Text(extraTimeInfo!,
                        style: myTextStyle.font_14w500.copyWith(color: MyColors.gray979797)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColors.grayD0D5DD),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(extraTimeValue!,
                          style: myTextStyle.font_12w500),
                    ),
                  ],
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: LayoutBuilder(builder: (context, constraints) {
            final screenWidth = MediaQuery.of(context).size.width;
            final cardPadding = screenWidth * 0.03;
            return Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColors.grayD0D5DD),
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: cardPadding, vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ..._buildHeaderChildren(),
                          ],
                        ),
                      ),
                      if (expanded && details != null) details!,
                    ],
                  ),
                ),
                // three-dot menu top-right
                Positioned(
                  right: 12,
                  top: 10,
                  child: Icon(Icons.more_vert, color: MyColors.gray979797, size: 20),
                ),
                Positioned(
                  right: 12,
                  bottom: -14,
                  child: GestureDetector(
                    onTap: onToggle,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: MyColors.grayD0D5DD),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 2),
                        ],
                      ),
                      width: 28,
                      height: 28,
                      child: Icon(
                        expanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                        size: 24,
                        color: MyColors.gray979797,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
  List<Widget> _buildHeaderChildren() {
    final List<Widget> children = [];
    for (int i = 0; i < headerColumns.length; i++) {
      final item = headerColumns[i];
      children.add(
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item['label']!, style: myTextStyle.font_14w500.copyWith(color: MyColors.gray979797)),
              const SizedBox(height: 2),
              TextView(item['value']!, style: myTextStyle.font_16ww700),
            ],
          ),
        ),
      );
      if (i != headerColumns.length - 1) {
        children.add(const VerticalDividerLight());
      }
    }
    return children;
  }
}
