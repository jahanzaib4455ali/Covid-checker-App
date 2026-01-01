import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_icons.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/utils/app_routes/routes.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? selectedRole;

  final List<RoleData> roles = [
    RoleData(
      role: 'Manager',
      description: 'Manage hotel operations, staff, and reports',
      icon: MyIcons.manager,
      route: Routes.managerBaseScreen,
      color: const Color(0xFF01968C),
    ),
    RoleData(
      role: 'Housekeeper',
      description: 'Room management and housekeeping tasks',
      icon: MyIcons.manager, // Replace with housekeeping icon
      route: Routes.housekeepingBaseScreen,
      color: const Color(0xFF7B68EE),
    ),
    RoleData(
      role: 'Cook',
      description: 'Kitchen operations and food orders',
      icon: MyIcons.manager, // Replace with cook icon
      route: Routes.cookBaseScreen,
      color: const Color(0xFFFF6B6B),
    ),
    RoleData(
      role: 'Security',
      description: 'Security monitoring and access control',
      icon: MyIcons.manager, // Replace with security icon
      route: Routes.securityBaseScreen,
      color: const Color(0xFF4ECDC4),
    ),
    RoleData(
      role: 'Vendor',
      description: 'Supplier management and orders',
      icon: MyIcons.manager, // Replace with vendor icon
      route: Routes.vendorScreen,
      color: const Color(0xFFFFD93D),
    ),
    RoleData(
      role: 'Room Service',
      description: 'Guest service and room requests',
      icon: MyIcons.manager, // Replace with room service icon
      route: Routes.roomServiceRequestScreen,
      color: const Color(0xFF6BCF7F),
    ),
    RoleData(
      role: 'Order Food',
      description: 'Food ordering and menu management',
      icon: MyIcons.manager, // Replace with food icon
      route: Routes.orderFoodBaseScreen,
      color: const Color(0xFFFF9500),
    ),
    RoleData(
      role: 'Counter Sale',
      description: 'Point-of-sale orders at counter',
      icon: MyIcons.manager, // Replace with counter icon
      route: Routes.counterSaleBaseScreen,
      color: const Color(0xFF1E90FF),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h),
              // Back button
              IconButton(
                icon: const Icon(Icons.arrow_back, size: 28),
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 24.h),
              // Header
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: BoxDecoration(
                        color: MyColors.primaryDark1D1929,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          MyIcons.manager,
                          width: 40.w,
                          height: 40.w,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    TextView(
                      'Select Your Role',
                      style: myTextStyle.font_16ww500.copyWith(
                        fontSize: 28.h,
                        color: MyColors.primaryDark1D1929,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextView(
                      'Choose your role to access the appropriate dashboard and features',
                      style: myTextStyle.font_14w400.copyWith(
                        color: MyColors.gray6E7C87,
                        fontSize: 16.h,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              // Roles grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                  ),
                  itemCount: roles.length,
                  itemBuilder: (context, index) {
                    final role = roles[index];
                    final isSelected = selectedRole == role.role;
                    
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedRole = role.role;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: isSelected ? role.color.withOpacity(0.1) : Colors.grey[50],
                          border: Border.all(
                            color: isSelected ? role.color : Colors.grey[300]!,
                            width: isSelected ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: role.color.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  )
                                ]
                              : null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                color: isSelected ? role.color : Colors.grey[400],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  role.icon,
                                  width: 24.w,
                                  height: 24.w,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            TextView(
                              role.role,
                              style: myTextStyle.font_16ww500.copyWith(
                                color: isSelected ? role.color : MyColors.primaryDark1D1929,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.h,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8.h),
                            TextView(
                              role.description,
                              style: myTextStyle.font_12w500.copyWith(
                                color: MyColors.gray6E7C87,
                                fontSize: 12.h,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                            if (isSelected) ...[
                              SizedBox(height: 8.h),
                              Icon(
                                Icons.check_circle,
                                color: role.color,
                                size: 20.w,
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
              // Continue button
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedRole != null 
                        ? MyColors.primaryDark1D1929 
                        : Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: selectedRole != null ? 2 : 0,
                  ),
                  onPressed: selectedRole != null
                      ? () {
                          final selectedRoleData = roles.firstWhere(
                            (role) => role.role == selectedRole,
                          );
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            selectedRoleData.route,
                            (route) => false,
                          );
                        }
                      : null,
                  child: TextView(
                    'Continue',
                    style: myTextStyle.font_16ww500.copyWith(
                      color: selectedRole != null ? Colors.white : Colors.grey[600],
                      fontSize: 18.h,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

class RoleData {
  final String role;
  final String description;
  final String icon;
  final String route;
  final Color color;

  RoleData({
    required this.role,
    required this.description,
    required this.icon,
    required this.route,
    required this.color,
  });
}