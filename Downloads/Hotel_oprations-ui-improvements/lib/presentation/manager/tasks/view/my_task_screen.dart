import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';

import '../../../../theme/my_colors.dart';
import '../../../../theme/my_text_styles.dart';

class MyTaskScreen extends StatefulWidget {
  const MyTaskScreen({super.key});

  @override
  State<MyTaskScreen> createState() => _MyTaskScreenState();
}

class _MyTaskScreenState extends State<MyTaskScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Index 0 par "Tasks in Progress" hai
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFF2F4F7),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: TextView(
          "Tasks",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/calendar.svg", width: 19.w, height: 19.h),
                SizedBox(width: 10.w),
                TextView(
                  "22-02-2023",
                  style: myTextStyle.font_16ww600.copyWith(
                      color: MyColors.dark000000,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
          )

        ],
      ),
      body: Column(
        children: [
          // My Tasks / Staff Tasks Switcher
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(color: const Color(0xFFF2F4F7), borderRadius: BorderRadius.circular(24.r)),
              child: Row(
                children: [
                  Expanded(child: _topToggle("My Tasks", true)),
                  Expanded(child: _topToggle("Staff Tasks", false)),
                ],
              ),
            ),
          ),
          // Tabs
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: const Color(0xFF667085),
            indicatorColor: const Color(0xFF2E90FA), // Blue indicator as per image highlight
            indicatorWeight: 3,
            tabs: const [Tab(text: "Tasks in Progress"), Tab(text: "Tasks Completed")],
          ),
          const Divider(height: 1, color: Color(0xFFEAECF0)),
          // Search Bar
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Color(0xFF667085)),
                      hintText: "Search",
                      filled: true,
                      fillColor: const Color(0xFFF9FAFB),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: const BorderSide(color: Color(0xFFD0D5DD))),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                _filterIcon(Icons.settings_outlined),
                SizedBox(width: 8.w),
                _filterIcon(Icons.tune_outlined),
              ],
            ),
          ),
          // List
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildInProgressList(),
                const Center(child: Text("Completed Tasks")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInProgressList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: 2,
      itemBuilder: (context, index) => _inProgressCard(index),
    );
  }

  Widget _inProgressCard(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView("10:10AM", style: TextStyle(color: const Color(0xFF98A2B3), fontSize: 12.sp)),
        SizedBox(height: 8.h),
        Container(
          margin: EdgeInsets.only(bottom: 20.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFEAECF0)),
          ),
          child: Column(
            children: [
              // Row 1: Main Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _colItem("Task Title", index == 0 ? "Guest Complaint" : "Room Inspection"),
                  _colItem(index == 0 ? "Guest Name" : "Room", index == 0 ? "Rahul K" : "101AK"),
                  _colItem(index == 0 ? "Complain Time" : "Request ID", index == 0 ? "10:31 Am" : "R101Ad"),
                ],
              ),
              if (index == 1) ...[ // Expanded state for In Progress (as per screenshot)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: const Divider(color: Color(0xFFF2F4F7)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _colItem("Request Time", "10:31Am"),
                    _colItem("Cleaning Status", "Cleaned"),
                    const Spacer(),
                  ],
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D1929),
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    ),
                    child: TextView("Start Inspection", style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _colItem(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(label, style: TextStyle(color: const Color(0xFF98A2B3), fontSize: 11.sp)),
          SizedBox(height: 4.h),
          TextView(value, style: TextStyle(color: Colors.black, fontSize: 13.sp, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _topToggle(String text, bool selected) {
    return Container(
      margin: EdgeInsets.all(4.w),
      decoration: BoxDecoration(color: selected ? const Color(0xFF1D1929) : Colors.transparent, borderRadius: BorderRadius.circular(20.r)),
      alignment: Alignment.center,
      child: TextView(text, style: TextStyle(color: selected ? Colors.white : const Color(0xFF667085), fontWeight: FontWeight.w600)),
    );
  }

  Widget _filterIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD0D5DD)), borderRadius: BorderRadius.circular(8.r)),
      child: Icon(icon, size: 20.sp, color: Colors.black),
    );
  }
}