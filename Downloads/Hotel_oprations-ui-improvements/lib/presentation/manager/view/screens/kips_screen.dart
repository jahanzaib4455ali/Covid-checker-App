import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/common/widget/src_general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';

class KipsScreen extends StatelessWidget {
  const KipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SrcGeneralScaffold(
      backgroundColor: MyColors.whiteFFFFFF,
      isBackButton: false,
      showAppBar: false,
      child: Center(child: TextView('KPIs')),
    );
  }
}
