import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/presentation/manager/tasks/view/my_task_screen.dart';

class StaffTaskScreen extends StatefulWidget {
  const StaffTaskScreen({super.key});

  @override
  State<StaffTaskScreen> createState() => _StaffTaskScreenState();
}

class _StaffTaskScreenState extends State<StaffTaskScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 3 Tabs: Pending, In Progress, Completed
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grayF7F7F7,
      appBar: AppBar(
        backgroundColor: MyColors.whiteFFFFFF,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyColors.dark000000),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextView(
          "Tasks",
          style: myTextStyle.font_18w600.copyWith(color: MyColors.dark000000),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.grayD0D5DD),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today, size: 16.w, color: MyColors.dark000000),
                SizedBox(width: 5.w),
                TextView(
                  "11-01-2023",
                  style: myTextStyle.font_12w400.copyWith(color: MyColors.dark000000),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Toggle Buttons: My Tasks / Staff Tasks
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Container(
              decoration: BoxDecoration(
                color: MyColors.grayF0F0F0,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Expanded(child: _topToggleButton("My Tasks", isSelected: false)),
                  Expanded(child: _topToggleButton("Staff Tasks", isSelected: true)),
                ],
              ),
            ),
          ),
          // Custom TabBar
          TabBar(
            controller: _tabController,
            labelColor: MyColors.dark000000,
            unselectedLabelColor: MyColors.gray9F9F9F,
            indicatorColor: MyColors.primaryDark1D1929,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: myTextStyle.font_14w600,
            unselectedLabelStyle: myTextStyle.font_14w500,
            tabs: const [
              Tab(text: "Tasks Pending"),
              Tab(text: "In Progress"),
              Tab(text: "Completed"),
            ],
          ),
          // Search Bar
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: myTextStyle.font_14w400.copyWith(color: MyColors.gray9F9F9F),
                      prefixIcon: const Icon(Icons.search, color: MyColors.gray9F9F9F),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: MyColors.whiteFFFFFF,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                _iconBox(Icons.settings),
                SizedBox(width: 5.w),
                _iconBox(Icons.tune),
              ],
            ),
          ),
          // Task List View
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTaskList("Pending"),
                _buildTaskList("In Progress"),
                _buildTaskList("Completed"),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: MyColors.primaryDark1D1929,
        child: const Icon(Icons.add, color: MyColors.whiteFFFFFF),
      ),
    );
  }

  Widget _buildTaskList(String status) {
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: 2,
      itemBuilder: (context, index) => _taskCard(status),
    );
  }

  Widget _taskCard(String status) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(15),
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
              _infoColumn("Department", "Housekeeping"),
              _infoColumn("Task", "Room Dusting"),
              _infoColumn("Priority", "Normal"),
            ],
          ),
          Divider(height: 30.h, color: MyColors.grayE5E5E5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoColumn("Task Location", "Room A-102"),
              _infoColumn("Start Time", "12-06-2025\n11:00 AM"),
              _infoColumn("End Time", status == "Completed" ? "12-06-2025\n11:30 AM" : "--"),
            ],
          ),
          SizedBox(height: 20.h),
          // Timeline logic based on status
          _statusTimeline(status),
          if (status == "Pending")
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primaryDark1D1929,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: TextView(
                  "Assign",
                  style: myTextStyle.font_14w600.copyWith(color: MyColors.whiteFFFFFF),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _statusTimeline(String status) {
    return Row(
      children: [
        _dot(true, "Task\nAccepted"),
        _line(status != "Pending"),
        _dot(status != "Pending", "Task In\nProgress"),
        _line(status == "Completed"),
        _dot(status == "Completed", "Task\nCompleted"),
      ],
    );
  }

  // --- Helper Widgets ---
  Widget _topToggleButton(String title, {required bool isSelected}) {
    return GestureDetector(
      onTap: () {
        if (title == "My Tasks") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyTaskScreen()),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? MyColors.primaryDark1D1929 : MyColors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextView(
          title,
          textAlign: TextAlign.center,
          style: myTextStyle.font_14w600.copyWith(
            color: isSelected ? MyColors.whiteFFFFFF : MyColors.dark000000,
          ),
        ),
      ),
    );
  }

  Widget _infoColumn(String label, String value) {
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

  Widget _dot(bool active, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 6.w,
          backgroundColor: active ? MyColors.primaryDark1D1929 : MyColors.grayD0D5DD,
        ),
        SizedBox(height: 5.h),
        TextView(
          label,
          textAlign: TextAlign.center,
          style: myTextStyle.font_10w400.copyWith(color: MyColors.gray9F9F9F),
        ),
      ],
    );
  }

  Widget _line(bool active) => Expanded(
        child: Container(
          height: 2.h,
          color: active ? MyColors.primaryDark1D1929 : MyColors.grayD0D5DD,
        ),
      );

  Widget _iconBox(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.grayD0D5DD),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 20.w, color: MyColors.gray9F9F9F),
    );
  }
}