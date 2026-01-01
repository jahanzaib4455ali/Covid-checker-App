import 'package:flutter/material.dart';
import 'package:kunggy_operational_app/common/widget/src_general_scaffold.dart';
import 'package:kunggy_operational_app/presentation/manager/home/widgets/manager_dashboard_body.dart';

class ManagerDashboardScreen extends StatelessWidget {
  const ManagerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SrcGeneralScaffold(
      isBackButton: false,
      isScrollable: true,
      child: ManagerDashboardBody(),
    );
  }
}
