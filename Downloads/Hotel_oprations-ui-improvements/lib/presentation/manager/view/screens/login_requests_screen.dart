import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';

import '../widgets/common_button.dart';


class LoginRequestsScreen extends StatefulWidget {
  const LoginRequestsScreen({super.key});

  @override
  State<LoginRequestsScreen> createState() => _LoginRequestsScreenState();
}

class _LoginRequestsScreenState extends State<LoginRequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteFFFFFF,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.w),
                child: _buildLoginRequestContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
      child: Row(
        children: [
          CustomBackButton(onPressed: () => Navigator.pop(context)),
          SizedBox(width: 16.w),
          TextView(
            'Login Requests',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: MyColors.dark000000,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginRequestContent() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: MyColors.grayD0D5DD.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Login Access Request',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: MyColors.dark000000,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '18 oct 2023 - 08:21:27',
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: MyColors.gray979797,
            ),
          ),
          
          SizedBox(height: 24.h),
          
          // Employee Information Section
          _buildSectionHeader('Employee Information:'),
          SizedBox(height: 16.h),
          
          _buildDetailRow('Name', 'Rahul Kumar'),
          _buildDetailRow('Designation', 'Junior Cook'),
          _buildDetailRow('Date of Joining', '10-06-2025'),
          
          SizedBox(height: 24.h),
          
          // Device Information Section
          _buildSectionHeader('Device Information'),
          SizedBox(height: 16.h),
          
          _buildDetailRow('Device Model', 'Iphone 16 pro'),
          _buildDetailRow('Mac Address', 'Lorem isum'),
          _buildDetailRow('IP address', 'EAI0000001'),
          _buildDetailRow('Device Location', 'Delhi, India'),
          _buildDetailRow('Distance from Hotel', '10 Meters'),
          _buildDetailRow('Language', 'English'),
          
          SizedBox(height: 32.h),
          
          // Action Buttons
          ActionButtonPair(
            secondaryText: 'Deny Access',
            primaryText: 'Grant Access',
            onSecondaryPressed: () => _handleButtonAction('Deny Access'),
            onPrimaryPressed: () => _handleButtonAction('Grant Access'),
            size: ButtonSize.medium,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: MyColors.dark000000,
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          // Fixed width for labels to ensure alignment
          SizedBox(
            width: 140.w, // Fixed width for consistent alignment
            child: Text(
              label,
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: MyColors.dark000000,
              ),
            ),
          ),
          // Values start from center point
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: MyColors.gray667085,
              ),
              textAlign: TextAlign.left, // Left align from center point
            ),
          ),
        ],
      ),
    );
  }


  void _handleButtonAction(String action) {
    // Handle different actions
    switch (action) {
      case 'Grant Access':
        // Show success message or handle approval
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Access granted successfully')),
        );
        break;
      case 'Deny Access':
        // Show denial message or handle denial
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Access denied')),
        );
        break;
    }
    
    // Navigate back after action
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pop(context);
    });
  }
}