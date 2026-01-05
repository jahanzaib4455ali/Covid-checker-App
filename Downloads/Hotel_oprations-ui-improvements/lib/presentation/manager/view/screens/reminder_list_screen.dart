import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'create_reminder_screen.dart';

class ReminderListScreen extends StatefulWidget {
  const ReminderListScreen({super.key});

  @override
  State<ReminderListScreen> createState() => _ReminderListScreenState();
}

class _ReminderListScreenState extends State<ReminderListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 70.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color(0xFFF2F4F7),
              child: Icon(Icons.arrow_back, color: Colors.black, size: 20),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text("Reminder", style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800, color: Colors.black)),
        actions: [
          const Icon(Icons.search, color: Colors.black),
          SizedBox(width: 10.w),
          const Icon(Icons.tune, color: Colors.black),
          SizedBox(width: 10.w),
          _buildDateFilter(),
          SizedBox(width: 15.w),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        itemCount: 3,
        itemBuilder: (context, index) => _buildReminderCard(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigating to Create Reminder Screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateReminderScreen()),
          );
        },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildDateFilter() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD0D5DD)), borderRadius: BorderRadius.circular(20.r)),
      child: Row(children: [
        Icon(Icons.calendar_today_outlined, size: 14.sp),
        SizedBox(width: 6.w),
        Text("11-01-2023", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600)),
      ]),
    );
  }

  Widget _buildReminderCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.h, top: 10.h),
          child: Text("10:10 AM", style: TextStyle(fontSize: 13.sp, color: const Color(0xFF667085))),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFEAECF0)),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.w),
                child: IntrinsicHeight(
                  child: Row(children: [
                    _buildInfoItem("Title", "Lorem"),
                    _vDivider(),
                    _buildInfoItem("Staff Responsible", "All Departments"),
                    _vDivider(),
                    _buildInfoItem("Status", "Active"),
                  ]),
                ),
              ),
              const Divider(height: 1, color: Color(0xFFEAECF0), thickness: 1),
              Padding(
                padding: EdgeInsets.all(15.w),
                child: Row(children: [
                  _buildInfoItem("Repeat Type", "Weekly"),
                  _vDivider(),
                  _buildInfoItem("Trigger Date", "23-06-2025"),
                  const Expanded(child: SizedBox()),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF98A2B3))),
        SizedBox(height: 4.h),
        Text(value, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700)),
      ]),
    );
  }

  Widget _vDivider() => Container(height: 30.h, width: 1, color: const Color(0xFFEAECF0), margin: EdgeInsets.symmetric(horizontal: 10.w));
}