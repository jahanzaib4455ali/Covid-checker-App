import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

// --- 1. Location Access Popup ---
class LocationAccessPopup extends StatelessWidget {
  final VoidCallback onAllow;
  final VoidCallback onDeny;

  const LocationAccessPopup({
    super.key,
    required this.onAllow,
    required this.onDeny,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      contentPadding: EdgeInsets.all(24.w),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: MyColors.primaryDark1D1929.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.location_on_rounded,
              size: 40.sp,
              color: MyColors.primaryDark1D1929,
            ),
          ),
          SizedBox(height: 16.h),
          TextView(
            "Enable Location Access",
            style: myTextStyle.font_20w600.copyWith(color: MyColors.dark000000),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          TextView(
            "We need your location to assign tasks to the nearest available workers efficiently.",
            style: myTextStyle.font_14w400.copyWith(color: MyColors.gray667085),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: onDeny,
                  child: TextView(
                    "Not Now",
                    style: myTextStyle.font_16ww600.copyWith(color: MyColors.gray667085),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: onAllow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.primaryDark1D1929,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: TextView(
                    "Allow",
                    style: myTextStyle.font_16ww600.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// --- 2. Category Picker (Bottom Sheet) ---
class CategoryPickerSheet extends StatelessWidget {
  final Function(String) onSelect;

  const CategoryPickerSheet({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'Cleaning', 'icon': Icons.cleaning_services_outlined},
      {'name': 'Repairing', 'icon': Icons.build_outlined},
      {'name': 'Plumbing', 'icon': Icons.plumbing_outlined},
      {'name': 'Delivery', 'icon': Icons.local_shipping_outlined},
      {'name': 'Electrician', 'icon': Icons.electric_bolt_outlined},
      {'name': 'Inspection', 'icon': Icons.fact_check_outlined},
    ];

    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: MyColors.grayD0D5DD,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          TextView(
            "Select Service Category",
            style: myTextStyle.font_20w600.copyWith(color: MyColors.dark000000),
          ),
          SizedBox(height: 16.h),
          GridView.builder(
            shrinkWrap: true,
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              final cat = categories[index];
              return GestureDetector(
                onTap: () {
                  onSelect(cat['name'] as String);
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: MyColors.grayF4F4F6,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.transparent),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(cat['icon'] as IconData, size: 28.sp, color: MyColors.primaryDark1D1929),
                      SizedBox(height: 8.h),
                      TextView(
                        cat['name'] as String,
                        style: myTextStyle.font_12w500.copyWith(color: MyColors.dark000000),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

// --- 3. Discard Draft Alert ---
class DiscardDraftAlert extends StatelessWidget {
  final VoidCallback onDiscard;
  final VoidCallback onSaveDraft;

  const DiscardDraftAlert({
    super.key,
    required this.onDiscard,
    required this.onSaveDraft,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: TextView("Unsaved Changes", style: myTextStyle.font_18w600),
      content: TextView(
        "You have unsaved changes. Do you want to discard them?",
        style: myTextStyle.font_14w400.copyWith(color: MyColors.gray667085),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Cancel
          child: TextView("Cancel", style: myTextStyle.font_14w600.copyWith(color: MyColors.gray667085)),
        ),
        TextButton(
          onPressed: onDiscard,
          child: TextView("Discard", style: myTextStyle.font_14w600.copyWith(color: Colors.red)),
        ),
        ElevatedButton(
          onPressed: onSaveDraft,
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryDark1D1929,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          ),
          child: TextView("Save Draft", style: myTextStyle.font_14w600.copyWith(color: Colors.white)),
        ),
      ],
    );
  }
}

// --- 4. Success Tick Dialog ---
class SuccessTickDialog extends StatefulWidget {
  final VoidCallback onFinished;

  const SuccessTickDialog({super.key, required this.onFinished});

  @override
  State<SuccessTickDialog> createState() => _SuccessTickDialogState();
}

class _SuccessTickDialogState extends State<SuccessTickDialog> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
       vsync: this,
       duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _controller.forward();
    
    // Auto-close after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) widget.onFinished();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
       child: Center(
         child: ScaleTransition(
           scale: _scaleAnimation,
           child: Container(
             padding: EdgeInsets.all(24.w),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(24.r),
               boxShadow: [
                 BoxShadow(
                   color: Colors.black.withOpacity(0.1),
                   blurRadius: 20,
                   offset: const Offset(0, 10),
                 )
               ],
             ),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Container(
                   padding: EdgeInsets.all(16.w),
                   decoration: const BoxDecoration(
                     color: Colors.green, // Success Green
                     shape: BoxShape.circle,
                   ),
                   child: Icon(Icons.check, size: 40.sp, color: Colors.white),
                 ),
                 SizedBox(height: 16.h),
                 TextView("Task Created!", style: myTextStyle.font_20w600),
                 SizedBox(height: 8.h),
                 TextView("Your task has been successfully created.", style: myTextStyle.font_14w400.copyWith(color: MyColors.gray667085), textAlign: TextAlign.center),
               ],
             ),
           ),
         ),
       ),
    );
  }
}
