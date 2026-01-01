import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class StepTimeline extends StatelessWidget {
  final List<String> steps;
  final int currentStep; // 0-based
  final String title;
  const StepTimeline({super.key, required this.steps, required this.currentStep, this.title = 'Task Status'});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 8),
        Center(child: Text(title, style: myTextStyle.font_18w600)),
        const SizedBox(height: 9),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(steps.length * 2 - 1, (i) {
            if (i.isEven) {
              final index = i ~/ 2;
              final isActive = index <= currentStep;
              return Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isActive ? Colors.black : Colors.white,
                        border: Border.all(color: Colors.black, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: isActive ? const Icon(Icons.check, color: Colors.white, size: 16) : null,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      steps[index],
                      style: myTextStyle.font_12w400.copyWith(
                        color: isActive ? Colors.black : MyColors.gray979797,
                        fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            } else {
              return const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: DottedLine(dashLength: 4, dashGapLength: 3, lineThickness: 2, dashColor: Colors.black),
                ),
              );
            }
          }),
        )
      ],
    );
  }
}
