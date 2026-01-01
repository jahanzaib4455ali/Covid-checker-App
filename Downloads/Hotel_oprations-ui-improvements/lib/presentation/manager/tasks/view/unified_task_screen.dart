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

      backgroundColor: MyColors.whiteFFFFFF,
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
                      // Circle ke andar Back Icon
                      Container(
                        width: 40.w, // Circle ka size adjust karne ke liye
                        height: 40.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF2F4F7), // Light grey background jaisa image mein hai
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                                Icons.arrow_back,
                                color: MyColors.dark000000,
                                size: 20.sp // Icon ko circle ke hisab se thoda chota rakha hai
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
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
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                children: [
                  // Pehla Button (My Tasks)
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isMyTasksSelected = true),
                      child: Container(
                        height: 48.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isMyTasksSelected ? const Color(0xFF1D1929) : const Color(0xFFF2F4F7),
                          // Yahan 12.r ko 30.r kar diya taake button gool (Circle) lage
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(
                            color: isMyTasksSelected ? Colors.transparent : Colors.grey[300]!,
                          ),
                        ),
                        child: Text(
                          "My Tasks",
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            color: isMyTasksSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 12.w), // Dono buttons ke beech ka gap

                  // Dusra Button (Staff Tasks)
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isMyTasksSelected = false),
                      child: Container(
                        height: 48.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: !isMyTasksSelected ? const Color(0xFF1D1929) : const Color(0xFFF2F4F7),
                          // Yahan bhi 30.r kar diya
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(
                            color: !isMyTasksSelected ? Colors.transparent : Colors.grey[300]!,
                          ),
                        ),
                        child: Text(
                          "Staff Tasks",
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.w700,
                            color: !isMyTasksSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                        // Sirf single dot use karein aur agar font size fix karna hai toh wo bhi add kar dein
                        style: myTextStyle.font_16ww600.copyWith(color: MyColors.dark000000),

                        decoration: InputDecoration(
                          hintText: "Search ",
                          // 2. Hint text ka font size yahan se barhaya gaya hai:
                          hintStyle: myTextStyle.font_16ww500.copyWith(
                            color: MyColors.grayEBEBEB,
                            fontSize: 16.sp, // 13 se barha kar 16 kar diya
                            fontWeight: FontWeight.w400,
                          ),
                          // 3. Icon ko thoda bada aur bold black kiya gaya hai:
                          prefixIcon: Icon(
                            Icons.search,
                            color: MyColors.black,
                            size: 22.sp, // Icon size text ke mutabiq barhaya
                          ),
                          border: InputBorder.none,
                          // Padding ko adjust kiya taake text center mein rahe
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
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
        unselectedLabelColor: MyColors.black,
        indicatorColor: MyColors.primaryDark1D1929,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: myTextStyle.font_16ww700, // Larger tab text
        unselectedLabelStyle: myTextStyle.font_16ww500.copyWith(fontWeight: FontWeight.w400),
        tabs: const [
          Tab(text: "Tasks in Progress"),
          Tab(text: "Tasks Completed"),
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
          _buildMyTaskList("Tasks in Progress"),
          _buildMyTaskList("Tasks Completed"),
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
    // Mock data as per your list
    final task = {
      "taskType": index == 0 ? "Guest Complaint" : "Room Inspection",
      "middleLabel": index == 0 ? "Guest Name" : "Room",
      "middleValue": index == 0 ? "Rahul K" : "101AK",
      "rightLabel": index == 0 ? "Complain Time" : "Request ID",
      "rightValue": index == 0 ? "10:31 Am" : "R101Ad",
      "time": "10:10AM",
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Top Time Label (Card se bahar)
        Padding(
          padding: EdgeInsets.only(left: 4.w, bottom: 4.h),
          child: TextView(
            task["time"]!,
            style: myTextStyle.font_12w400.copyWith(color: MyColors.gray9F9F9F),
          ),
        ),

        // 2. Main Card
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.h),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: MyColors.whiteFFFFFF,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xFFEAECF0)), // Light border as per image
              ),
              child: IntrinsicHeight( // Vertical divider ki height barabar rakhne ke liye
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left Section
                    Expanded(child: _infoColumnItem(task["taskType"] == "Guest Complaint" ? "Task Title" : "Task Title", task["taskType"]!)),

                    // Vertical Divider 1
                    VerticalDivider(color: const Color(0xFFEAECF0), thickness: 1, indent: 5, endIndent: 5),

                    // Middle Section
                    Expanded(child: _infoColumnItem(task["middleLabel"]!, task["middleValue"]!, textAlign: TextAlign.center)),

                    // Vertical Divider 2
                    VerticalDivider(color: const Color(0xFFEAECF0), thickness: 1, indent: 5, endIndent: 5),

                    // Right Section
                    Expanded(child: _infoColumnItem(task["rightLabel"]!, task["rightValue"]!, textAlign: TextAlign.right)),
                  ],
                ),
              ),
            ),

            // 3. Bottom Arrow Icon (Overlap effect)
            Positioned(
              bottom: 8.h,
              right: 12.w,
              child: Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFEAECF0)),
                ),
                child: Icon(Icons.keyboard_arrow_down, size: 16.sp, color: const Color(0xFFD0D5DD)),
              ),
            ),
          ],
        ),
      ],
    );
  }

// Helper widget for card columns
  Widget _infoColumnItem(String label, String value, {TextAlign textAlign = TextAlign.left}) {
    return Column(
      crossAxisAlignment: textAlign == TextAlign.right ? CrossAxisAlignment.end : (textAlign == TextAlign.center ? CrossAxisAlignment.center : CrossAxisAlignment.start),
      mainAxisSize: MainAxisSize.min,
      children: [
        TextView(
          label,
          style: myTextStyle.font_12w400.copyWith(color: const Color(0xFF98A2B3)), // Grey label
        ),
        SizedBox(height: 2.h),
        TextView(
          value,
          style: myTextStyle.font_16ww600.copyWith(color: const Color(0xFF1D1929), fontSize: 14.sp), // Bold value
        ),
      ],
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
      child: Icon(icon, size: 24.w, color: MyColors.black),
    );
  }
}