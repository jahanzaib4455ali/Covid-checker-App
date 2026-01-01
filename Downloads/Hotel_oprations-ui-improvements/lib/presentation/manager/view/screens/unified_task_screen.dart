import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'package:kunggy_operational_app/presentation/manager/tasks/view/create_task_screen.dart';

class UnifiedTaskScreen extends StatefulWidget {
  const UnifiedTaskScreen({super.key});

  @override
  State<UnifiedTaskScreen> createState() => _UnifiedTaskScreenState();
}

class _UnifiedTaskScreenState extends State<UnifiedTaskScreen> with TickerProviderStateMixin {
  late TabController _myTasksTabController;
  late TabController _staffTasksTabController;
  bool isMyTasksSelected = true; // Default to My Tasks

  @override
  void initState() {
    super.initState();
    // My Tasks: 2 tabs (Tasks in Progress, Tasks Completed)
    _myTasksTabController = TabController(length: 2, vsync: this);
    // Staff Tasks: 3 tabs (Tasks Pending, In Progress, Completed)
    _staffTasksTabController = TabController(length: 3, vsync: this);
  }

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
                        "Tasks",
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w800,
                          color: MyColors.dark000000,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: MyColors.whiteFFFFFF,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(color: MyColors.grayD0D5DD.withOpacity(0.8)),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 16.sp, color: MyColors.dark000000),
                        SizedBox(width: 8.w),
                        TextView("11-01-2023", style: myTextStyle.font_14w500),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
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
                    Expanded(
                      child: _topToggleButton("My Tasks", isSelected: isMyTasksSelected),
                    ),
                    Expanded(
                      child: _topToggleButton("Staff Tasks", isSelected: !isMyTasksSelected),
                    ),
                  ],
                ),
              ),
            ),
            
            // Dynamic TabBar based on selection
            _buildTabBar(),
            
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
                        style: myTextStyle.font_14w600, // Larger text input
                        decoration: InputDecoration(
                          hintText: "Search tasks...",
                          hintStyle: myTextStyle.font_14w400.copyWith(color: MyColors.gray9F9F9F),
                          prefixIcon: const Icon(Icons.search, color: MyColors.gray9F9F9F),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  _iconBox(Icons.settings),
                  SizedBox(width: 8.w),
                  _iconBox(Icons.tune),
                ],
              ),
            ),
            
            // Dynamic TabBarView based on selection
            Expanded(
              child: _buildTabBarView(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateTaskScreen()),
          );
        },
        backgroundColor: MyColors.primaryDark1D1929,
        child: const Icon(Icons.add, color: MyColors.whiteFFFFFF),
      ),
    );
  }

  Widget _buildTabBar() {
    if (isMyTasksSelected) {
      return TabBar(
        controller: _myTasksTabController,
        labelColor: MyColors.dark000000,
        unselectedLabelColor: MyColors.gray9F9F9F,
        indicatorColor: MyColors.primaryDark1D1929,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: myTextStyle.font_16ww600, // Larger tab text
        unselectedLabelStyle: myTextStyle.font_16ww500.copyWith(fontWeight: FontWeight.w400),
        tabs: const [
          Tab(text: "In Progress"),
          Tab(text: "Completed"),
        ],
      );
    } else {
      return TabBar(
        controller: _staffTasksTabController,
        labelColor: MyColors.dark000000,
        unselectedLabelColor: MyColors.gray9F9F9F,
        indicatorColor: MyColors.primaryDark1D1929,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: myTextStyle.font_16ww600,
        unselectedLabelStyle: myTextStyle.font_16ww500.copyWith(fontWeight: FontWeight.w400),
        isScrollable: true,
        tabs: const [
          Tab(text: "Pending"),
          Tab(text: "In Progress"),
          Tab(text: "Completed"),
        ],
      );
    }
  }

  Widget _buildTabBarView() {
    if (isMyTasksSelected) {
      return TabBarView(
        controller: _myTasksTabController,
        children: [
          _buildMyTaskList("In Progress"),
          _buildMyTaskList("Completed"),
        ],
      );
    } else {
      return TabBarView(
        controller: _staffTasksTabController,
        children: [
          _buildStaffTaskList("Pending"),
          _buildStaffTaskList("In Progress"),
          _buildStaffTaskList("Completed"),
        ],
      );
    }
  }

  // My Tasks List
  Widget _buildMyTaskList(String status) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 80.h), // Bottom padding for FAB
      itemCount: 3,
      itemBuilder: (context, index) => _myTaskCard(status, index),
    );
  }

  Widget _myTaskCard(String status, int index) {
    List<Map<String, String>> taskData = [
      {
        "taskType": "Room Inspection",
        "room": "101AM",
        "requestId": "R1234d",
        "requestTime": "09:30Am",
        "cleaningStatus": "Cleaned"
      },
      {
        "taskType": "Room Inspection", 
        "room": "102AM",
        "requestId": "R1235d",
        "requestTime": "10:15Am",
        "cleaningStatus": "Cleaned"
      },
      {
        "taskType": "Room Inspection",
        "room": "103AM", 
        "requestId": "R1236d",
        "requestTime": "11:00Am",
        "cleaningStatus": "Cleaned"
      }
    ];

    final task = taskData[index % taskData.length];

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.w), // more padding
      decoration: BoxDecoration(
        color: MyColors.whiteFFFFFF,
        borderRadius: BorderRadius.circular(16), // larger radius
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
              _infoColumn("Task Type", task["taskType"]!),
              _infoColumn("Room", task["room"]!),
              _infoColumn("Request ID", task["requestId"]!),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoColumn("Request Time", task["requestTime"]!),
              _infoColumn("Cleaning Status", task["cleaningStatus"]!),
              const SizedBox(width: 40),
            ],
          ),
          SizedBox(height: 24.h),
          if (status == "In Progress")
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 44.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.primaryDark1D1929,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                  ),
                  child: TextView(
                    "Start Inspection",
                    style: myTextStyle.font_14w600.copyWith(color: MyColors.whiteFFFFFF),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Staff Tasks List
  Widget _buildStaffTaskList(String status) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 80.h),
      itemCount: 2,
      itemBuilder: (context, index) => _staffTaskCard(status),
    );
  }

  Widget _staffTaskCard(String status) {
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
              _infoColumn("Department", "Housekeeping"),
              _infoColumn("Task", "Room Dusting"),
              _infoColumn("Priority", "Normal"),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: const Divider(height: 1, color: MyColors.grayE5E5E5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoColumn("Task Location", "Room A-102"),
              _infoColumn("Start Time", "12-06-2025\n11:00 AM"),
              _infoColumn("End Time", status == "Completed" ? "12-06-2025\n11:30 AM" : "--"),
            ],
          ),
          SizedBox(height: 24.h),
          _statusTimeline(status),
          if (status == "Pending")
            Padding(
              padding: EdgeInsets.only(top: 24.h),
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 44.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primaryDark1D1929,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                    ),
                    child: TextView(
                      "Assign",
                      style: myTextStyle.font_14w600.copyWith(color: MyColors.whiteFFFFFF),
                    ),
                  ),
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
        setState(() {
          isMyTasksSelected = title == "My Tasks";
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: isSelected ? MyColors.primaryDark1D1929 : MyColors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextView(
          title,
          textAlign: TextAlign.center,
          style: myTextStyle.font_16ww600.copyWith(
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

  Widget _dot(bool active, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 8.w,
          backgroundColor: active ? MyColors.primaryDark1D1929 : MyColors.grayD0D5DD,
        ),
        SizedBox(height: 8.h),
        TextView(
          label,
          textAlign: TextAlign.center,
          style: myTextStyle.font_12w500.copyWith(color: MyColors.gray9F9F9F),
        ),
      ],
    );
  }

  Widget _line(bool active) => Expanded(
        child: Container(
          height: 3.h,
          color: active ? MyColors.primaryDark1D1929 : MyColors.grayD0D5DD,
        ),
      );

  Widget _iconBox(IconData icon) {
    return Container(
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
      child: Icon(icon, size: 24.w, color: MyColors.gray9F9F9F),
    );
  }
}