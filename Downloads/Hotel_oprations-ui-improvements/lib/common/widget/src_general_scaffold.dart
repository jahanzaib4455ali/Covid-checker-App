// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kunggy_operational_app/common/widget/app_drawer.dart';
// import 'package:kunggy_operational_app/common/widget/general_appbar.dart';
//
// class GeneralScaffold extends StatelessWidget {
//   const GeneralScaffold({
//     super.key,
//     required this.child,
//     required this.isBackButton,
//     this.isNotification,
//     this.isProfile,
//     this.isScrollable = false,
//   });
//
//   final Widget child;
//   final bool isBackButton;
//   final bool? isNotification;
//   final bool? isProfile;
//   final bool isScrollable;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       endDrawer: const AppDrawer(),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: Platform.isAndroid ? 31.h : 16.h,
//             ),
//             GeneralAppBar(
//               isBackButton: isBackButton,
//               isNotification: isNotification,
//               isProfile: isProfile,
//             ),
//             SizedBox(
//               height: 34.h,
//             ),
//             Expanded(
//               child: isScrollable
//                   ? SingleChildScrollView(child: child)
//                   : child,
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/app_drawer.dart';
import 'package:kunggy_operational_app/common/widget/general_appbar.dart';


class SrcGeneralScaffold extends StatelessWidget {
  const SrcGeneralScaffold({
    super.key,
    required this.child,
    required this.isBackButton,
    this.isNotification,
    this.isProfile,
    this.isScrollable = false,  //
    this.backgroundColor,
    this.physics,
    this.showAppBar = true,
  });

  final Widget child;
  final bool isBackButton;
  final bool? isNotification;
  final bool? isProfile;
  final bool isScrollable;
  final Color? backgroundColor;
  final ScrollPhysics? physics;
  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      endDrawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Platform.isAndroid ? 31.h : 16.h,
            ),
            if (showAppBar)
              GeneralAppBar(
                isBackButton: isBackButton,
                isNotification: isNotification,
                isProfile: isProfile,
              ),
            if (showAppBar)
              SizedBox(
                height: 34.h,
              ),
            Expanded(
              child: isScrollable
                  ? SingleChildScrollView(
                      physics: physics,
                      child: child,
                    )
                  : child,
            ),
          ],
        ),
      ),
    );
  }
}
