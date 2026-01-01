import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

import 'create_access_screen.dart';


class AccessListScreen extends StatefulWidget {
  const AccessListScreen({super.key});

  @override
  State<AccessListScreen> createState() => _AccessListScreenState();
}

class _AccessListScreenState extends State<AccessListScreen> {
  List<Map<String, dynamic>> accessRequests = [
    {
      "id": "ACC-001",
      "employee": "Ahmad Ali",
      "department": "Housekeeping",
      "accessType": "System Access",
      "requestedAccess": "Task Management Module",
      "reason": "New Role Assignment",
      "status": "Pending",
      "requestDate": "15-01-2025"
    },
    {
      "id": "ACC-002",
      "employee": "Sara Khan",
      "department": "Kitchen",
      "accessType": "Area Access",
      "requestedAccess": "Storage Room",
      "reason": "Inventory Management",
      "status": "Approved",
      "requestDate": "14-01-2025"
    },
    {
      "id": "ACC-003",
      "employee": "John Doe",
      "department": "Security",
      "accessType": "System Access",
      "requestedAccess": "Admin Panel",
      "reason": "Supervisor Promotion",
      "status": "Pending",
      "requestDate": "13-01-2025"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: SafeArea(
        child: Column(
          children: [
             // Custom Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: MyColors.dark000000),
                        padding: EdgeInsets.zero,
                         constraints: const BoxConstraints(),
                        onPressed: () => Navigator.pop(context),
                      ),
                       SizedBox(width: 12.w),
                      TextView(
                        "Access Request",
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          color: MyColors.dark000000,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.w),
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: MyColors.whiteFFFFFF,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(color: MyColors.grayD0D5DD.withOpacity(0.8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.calendar_today, size: 16.w, color: MyColors.dark000000),
                        SizedBox(width: 8.w),
                        TextView(
                          "11-01-2023",
                          style: myTextStyle.font_14w500.copyWith(color: MyColors.dark000000),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
             // Search Bar
             Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                   Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        style: myTextStyle.font_14w600,
                        decoration: InputDecoration(
                          hintText: "Search requests...",
                          hintStyle: myTextStyle.font_14w400.copyWith(color: MyColors.gray9F9F9F),
                          prefixIcon: const Icon(Icons.search, color: MyColors.gray9F9F9F),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                   Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                         BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(Icons.tune, size: 24.w, color: MyColors.gray9F9F9F),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: accessRequests.length,
                itemBuilder: (context, index) {
                  final request = accessRequests[index];
                  return _buildAccessCard(request);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateAccessScreen()),
          );
        },
        backgroundColor: MyColors.primaryDark1D1929,
        child: const Icon(Icons.add, color: MyColors.whiteFFFFFF),
      ),
    );
  }

  Widget _buildAccessCard(Map<String, dynamic> request) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
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
                style: myTextStyle.font_14w600.copyWith(color: MyColors.gray9F9F9F),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: _getStatusColor(request["status"]).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextView(
                  request["status"],
                  style: myTextStyle.font_12w600.copyWith(color: _getStatusColor(request["status"])),
                ),
              ),
            ],
          ),
           Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: const Divider(height: 1, color: MyColors.grayE5E5E5),
          ),
          
          Row(
            children: [
              Expanded(child: _buildInfoColumn("Employee", request["employee"])),
              Expanded(child: _buildInfoColumn("Department", request["department"])),
            ],
          ),
          
          SizedBox(height: 20.h),
          
          Row(
            children: [
              Expanded(child: _buildInfoColumn("Access Type", request["accessType"])),
              Expanded(child: _buildInfoColumn("Request Date", request["requestDate"])),
            ],
          ),
          
          SizedBox(height: 20.h),
          
          _buildInfoColumn("Requested Access", request["requestedAccess"]),
          
          SizedBox(height: 20.h),
          
          _buildInfoColumn("Reason", request["reason"]),
          
          if (request["status"] == "Pending") ...[
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                     height: 44.h,
                    child: ElevatedButton(
                      onPressed: () => _updateAccessStatus(request["id"], "Rejected"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.redEA445C,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: TextView("Reject", style: myTextStyle.font_14w600.copyWith(color: MyColors.whiteFFFFFF)),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: SizedBox(
                     height: 44.h,
                    child: ElevatedButton(
                      onPressed: () => _updateAccessStatus(request["id"], "Approved"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.green34A853,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: TextView("Grant Access", style: myTextStyle.font_14w600.copyWith(color: MyColors.whiteFFFFFF)),
                    ),
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
          style: myTextStyle.font_14w400.copyWith(color: MyColors.gray9F9F9F),
        ),
        SizedBox(height: 6.h),
        TextView(
          value,
          style: myTextStyle.font_16ww600.copyWith(color: MyColors.dark000000),
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

  void _updateAccessStatus(String requestId, String newStatus) {
    setState(() {
      final index = accessRequests.indexWhere((req) => req["id"] == requestId);
      if (index != -1) {
        accessRequests[index]["status"] = newStatus;
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: TextView("Access $newStatus successfully", style: const TextStyle(color: Colors.white)),
        backgroundColor: newStatus == "Approved" ? MyColors.green34A853 : MyColors.redEA445C,
      ),
    );
  }

}