import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';

class VerticalDividerLight extends StatelessWidget {
  const VerticalDividerLight({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 25,
      color: MyColors.grayD0D5DD,
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
