import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';

class NotificationDetailScreen extends StatefulWidget {
  final String notificationType;
  
  const NotificationDetailScreen({
    super.key,
    required this.notificationType,
  });

  @override
  State<NotificationDetailScreen> createState() => _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteFFFFFF,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Content based on notification type
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.w),
                child: _buildNotificationContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    String title = _getScreenTitle();
    
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 16.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: MyColors.grayF5F5F5,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.arrow_back,
                size: 20.w,
                color: MyColors.dark000000,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          TextView(
            title,
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

  String _getScreenTitle() {
    switch (widget.notificationType) {
      case 'maintenance_approval':
        return 'Maintenance Approval';
      case 'leave_request':
        return 'Notification';
      case 'maintenance_repair':
        return 'Notification';
      case 'login_request':
        return 'Login Requests';
      default:
        return 'Notification';
    }
  }

  Widget _buildNotificationContent() {
    switch (widget.notificationType) {
      case 'maintenance_approval':
        return _buildMaintenanceApprovalContent();
      case 'maintenance_approval_multi':
        return _buildMaintenanceApprovalMultiContent();
      case 'leave_request':
        return _buildLeaveRequestContent();
      case 'maintenance_repair':
        return _buildMaintenanceRepairContent();
      case 'login_request':
        return _buildLoginRequestContent();
      default:
        return _buildMaintenanceApprovalContent();
    }
  }

  // 1. Maintenance Approval (Single Item)
  Widget _buildMaintenanceApprovalContent() {
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
            'Purchase Request',
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
          
          // Item Details
          _buildDetailRow('Item Name', 'Soap'),
          _buildDetailRow('Department', 'Room Service'),
          _buildDetailRow('Quantity', '100'),
          
          SizedBox(height: 20.h),
          Container(height: 1.h, color: MyColors.grayEFEFEF),
          SizedBox(height: 20.h),
          
          // Total Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: MyColors.dark000000,
                ),
              ),
              Text(
                '\$125.00',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.gray667085,
                ),
              ),
            ],
          ),
          
          SizedBox(height: 32.h),
          
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: _buildActionButton('Reject', false),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildActionButton('Approve', true),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 2. Maintenance Approval (Multiple Items)
  Widget _buildMaintenanceApprovalMultiContent() {
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
            'Purchase Request',
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
          
          // First Item
          _buildDetailRow('Item Name', 'Soap'),
          _buildDetailRow('Department', 'Room Service'),
          _buildDetailRow('Quantity', '100'),
          
          SizedBox(height: 20.h),
          Container(height: 1.h, color: MyColors.grayEFEFEF),
          SizedBox(height: 20.h),
          
          // Second Item
          _buildDetailRow('Item Name', 'Toothpaste'),
          _buildDetailRow('Department', 'Toiletries'),
          _buildDetailRow('Quantity', '100'),
          
          SizedBox(height: 20.h),
          Container(height: 1.h, color: MyColors.grayEFEFEF),
          SizedBox(height: 20.h),
          
          // Total Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: MyColors.dark000000,
                ),
              ),
              Text(
                '\$125.00',
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: MyColors.gray667085,
                ),
              ),
            ],
          ),
          
          SizedBox(height: 32.h),
          
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: _buildActionButton('Reject', false),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildActionButton('Approve', true),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 3. Leave Request
  Widget _buildLeaveRequestContent() {
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
            'Leave Request',
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
          
          // Employee Details
          _buildDetailRow('Employee Name', 'Salman K.'),
          _buildDetailRow('Designation', 'Sweaper'),
          _buildLeaveDetailRow('Leave Duration', '02 Days', 'Monday - Friday'),
          _buildDetailRow('Reason For Leave', 'For Doctor\'s Appointment'),
          
          SizedBox(height: 32.h),
          
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: _buildActionButton('Reject', false),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildActionButton('Grant Leave', true),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 4. Maintenance Repair Request
  Widget _buildMaintenanceRepairContent() {
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
            'Maintenance Repair Request',
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
          
          // Maintenance Details
          _buildDetailRow('Room Number', 'A-101'),
          _buildDetailRow('Category', 'Electronics'),
          _buildDetailRow('Issue', 'Air Condition is not working'),
          _buildDetailRow('Time Takes', '3 Hours'),
          
          SizedBox(height: 32.h),
          
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: _buildActionButton('Shutdown Room', false),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildActionButton('Approve', true),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 5. Login Access Request
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
          Row(
            children: [
              Expanded(
                child: _buildActionButton('Deny Access', false),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildActionButton('Grant Access', true),
              ),
            ],
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
              textAlign: TextAlign.left, // Changed to left align from center point
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaveDetailRow(String label, String duration, String days) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: MyColors.dark000000,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16.w,
                    color: MyColors.gray667085,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    duration,
                    style: TextStyle(
                      fontFamily: 'Plus Jakarta Sans',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.gray667085,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                days,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: MyColors.gray667085,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, bool isPrimary) {
    return GestureDetector(
      onTap: () {
        // Handle button action
        _handleButtonAction(text);
      },
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: isPrimary ? MyColors.dark000000 : MyColors.whiteFFFFFF,
          borderRadius: BorderRadius.circular(8.r),
          border: isPrimary ? null : Border.all(
            color: MyColors.grayD0D5DD,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isPrimary ? Colors.white : MyColors.dark000000,
            ),
          ),
        ),
      ),
    );
  }

  void _handleButtonAction(String action) {
    // Handle different actions
    switch (action) {
      case 'Approve':
      case 'Grant Leave':
        // Show success message or handle approval
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$action action completed')),
        );
        break;
      case 'Reject':
        // Show rejection dialog or handle rejection
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Request rejected')),
        );
        break;
      case 'Shutdown Room':
        // Handle room shutdown
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Room shutdown initiated')),
        );
        break;
      case 'Grant Access':
        // Handle login access approval
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Access granted successfully')),
        );
        break;
      case 'Deny Access':
        // Handle login access denial
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