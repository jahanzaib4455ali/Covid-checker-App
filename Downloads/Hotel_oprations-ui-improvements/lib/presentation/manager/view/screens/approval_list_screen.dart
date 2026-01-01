import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class ApprovalListScreen extends StatefulWidget {
  const ApprovalListScreen({super.key});

  @override
  State<ApprovalListScreen> createState() => _ApprovalListScreenState();
}

class _ApprovalListScreenState extends State<ApprovalListScreen> {
  List<Map<String, dynamic>> requests = [
    {
      "id": "REQ-001",
      "employee": "Ahmad Ali",
      "department": "Housekeeping",
      "requestType": "Leave Request",
      "reason": "Medical Emergency",
      "fromDate": "20-01-2025",
      "toDate": "22-01-2025",
      "status": "Pending",
      "submittedDate": "15-01-2025"
    },
    {
      "id": "REQ-002",
      "employee": "Sara Khan",
      "department": "Kitchen",
      "requestType": "Overtime Request",
      "reason": "Extra Event Coverage",
      "fromDate": "18-01-2025",
      "toDate": "18-01-2025",
      "status": "Pending",
      "submittedDate": "14-01-2025"
    },
    {
      "id": "REQ-003",
      "employee": "John Doe",
      "department": "Security",
      "requestType": "Shift Change",
      "reason": "Personal Commitment",
      "fromDate": "25-01-2025",
      "toDate": "25-01-2025",
      "status": "Approved",
      "submittedDate": "12-01-2025"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyColors.whiteFFFFFF,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyColors.dark000000),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextView(
          "Approval Request",
          style: myTextStyle.font_18w600.copyWith(color: MyColors.dark000000),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: MyColors.dark000000),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.tune, color: MyColors.dark000000),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];
          return _buildRequestCard(request);
        },
      ),
    );
  }

  Widget _buildRequestCard(Map<String, dynamic> request) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: MyColors.gray9F9F9F.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                request["id"],
                style: myTextStyle.font_12w500.copyWith(color: MyColors.gray9F9F9F),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: _getStatusColor(request["status"]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextView(
                  request["status"],
                  style: myTextStyle.font_10w500.copyWith(color: MyColors.whiteFFFFFF),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 12.h),
          
          Row(
            children: [
              Expanded(child: _buildInfoColumn("Employee", request["employee"])),
              Expanded(child: _buildInfoColumn("Department", request["department"])),
            ],
          ),
          
          SizedBox(height: 12.h),
          
          Row(
            children: [
              Expanded(child: _buildInfoColumn("Request Type", request["requestType"])),
              Expanded(child: _buildInfoColumn("Submitted", request["submittedDate"])),
            ],
          ),
          
          SizedBox(height: 12.h),
          
          _buildInfoColumn("Reason", request["reason"]),
          
          SizedBox(height: 12.h),
          
          Row(
            children: [
              Expanded(child: _buildInfoColumn("From Date", request["fromDate"])),
              Expanded(child: _buildInfoColumn("To Date", request["toDate"])),
            ],
          ),
          
          if (request["status"] == "Pending") ...[
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _updateRequestStatus(request["id"], "Rejected"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.redEA445C,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: TextView("Reject", style: myTextStyle.font_14w600.copyWith(color: MyColors.whiteFFFFFF)),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _updateRequestStatus(request["id"], "Approved"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.green34A853,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: TextView("Approve", style: myTextStyle.font_14w600.copyWith(color: MyColors.whiteFFFFFF)),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          label,
          style: myTextStyle.font_12w400.copyWith(color: MyColors.gray9F9F9F),
        ),
        SizedBox(height: 4.h),
        TextView(
          value,
          style: myTextStyle.font_12w500.copyWith(color: MyColors.dark000000),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return MyColors.yellowFFDB57;
      case "approved":
        return MyColors.green34A853;
      case "rejected":
        return MyColors.redEA445C;
      default:
        return MyColors.gray9F9F9F;
    }
  }

  void _updateRequestStatus(String requestId, String newStatus) {
    setState(() {
      final index = requests.indexWhere((req) => req["id"] == requestId);
      if (index != -1) {
        requests[index]["status"] = newStatus;
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: TextView("Request $newStatus successfully", style: const TextStyle(color: Colors.white)),
        backgroundColor: newStatus == "Approved" ? MyColors.green34A853 : MyColors.redEA445C,
      ),
    );
  }
}