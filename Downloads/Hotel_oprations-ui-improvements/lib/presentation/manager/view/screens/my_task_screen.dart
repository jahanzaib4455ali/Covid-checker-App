import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'create_new_task_screen.dart';
import 'task_inspection_screen.dart';

class MyTaskScreen extends StatefulWidget {
  const MyTaskScreen({super.key});

  @override
  State<MyTaskScreen> createState() => _MyTaskScreenState();
}

class _MyTaskScreenState extends State<MyTaskScreen> with TickerProviderStateMixin {
  late TabController _myTasksTabController;
  late TabController _staffTasksTabController;
  bool isStaffTasksSelected = false;

  @override
  void initState() {
    super.initState();
    _myTasksTabController = TabController(length: 2, vsync: this);
    _staffTasksTabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _myTasksTabController.dispose();
    _staffTasksTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const CreateNewTaskScreen())
          );
        },
        backgroundColor: const Color(0xFF1D1929),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: Column(
        children: [
          _buildTopToggleSection(),
          _buildDynamicTabBar(),
          const Divider(height: 1, color: Color(0xFFEAECF0)),
          _buildSearchSection(),
          Expanded(
            child: isStaffTasksSelected
                ? _buildStaffTabBarView()
                : _buildMyTasksTabBarView(),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
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
        style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.black),
      ),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE4E7EC)),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Icon(Icons.calendar_today_outlined, size: 14.sp, color: Colors.black),
              SizedBox(width: 6.w),
              TextView("11-01-2023", style: TextStyle(fontSize: 16.sp, color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopToggleSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
      child: Container(
        width: 356.w, // Total container width to accommodate both buttons
        height: 40.h,
        decoration: BoxDecoration(
            color: const Color(0xFFF2F4F7),
            borderRadius: BorderRadius.circular(100.r)),
        child: Row(
          children: [
            Container(
              width: 178.w,
              height: 40.h,
              child: _toggleButton("My Tasks", !isStaffTasksSelected, () {
                setState(() => isStaffTasksSelected = false);
              }),
            ),
            Container(
              width: 178.w,
              height: 40.h,
              child: _toggleButton("Staff Tasks", isStaffTasksSelected, () {
                setState(() => isStaffTasksSelected = true);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _toggleButton(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 178.w,
        height: 40.h,
        margin: EdgeInsets.all(1.w), // Small margin for border effect
        decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1D1929) : Colors.transparent,
            borderRadius: BorderRadius.circular(100.r),
            border: isSelected ? null : Border.all(color: Colors.transparent, width: 1)),
        alignment: Alignment.center,
        child: TextView(
          text,
          style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF667085),
              fontWeight: FontWeight.w600,
              fontSize: 16.sp),
        ),
      ),
    );
  }

  Widget _buildDynamicTabBar() {
    return TabBar(
      controller: isStaffTasksSelected ? _staffTasksTabController : _myTasksTabController,
      labelColor: Colors.black,
      unselectedLabelColor: const Color(0xFF667085),
      indicatorColor: const Color(0xFF2E90FA),
      indicatorWeight: 3,
      labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
      tabs: isStaffTasksSelected
          ? const [Tab(text: "Tasks Pending"), Tab(text: "In Progress"), Tab(text: "Completed")]
          : const [Tab(text: "Tasks in Progress"), Tab(text: "Tasks Completed")],
    );
  }

  Widget _buildMyTasksTabBarView() {
    return TabBarView(
      controller: _myTasksTabController,
      children: [
        _buildList(isCompleted: false, isStaff: false),
        _buildList(isCompleted: true, isStaff: false),
      ],
    );
  }

  Widget _buildStaffTabBarView() {
    return TabBarView(
      controller: _staffTasksTabController,
      children: [
        _buildList(isCompleted: false, isStaff: true, isPending: true),
        _buildList(isCompleted: false, isStaff: true, isInProgress: true),
        _buildList(isCompleted: true, isStaff: true),
      ],
    );
  }

  Widget _buildList({required bool isCompleted, required bool isStaff, bool isPending = false, bool isInProgress = false}) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: 2,
      itemBuilder: (context, index) => _taskCard(index,
          isCompleted: isCompleted,
          isStaff: isStaff,
          isPending: isPending,
          isInProgress: isInProgress),
    );
  }

  Widget _taskCard(int index, {required bool isCompleted, required bool isStaff, bool isPending = false, bool isInProgress = false}) {
    // Screenshot logic
    bool isMyTaskInProgress = !isStaff && !isCompleted && index == 1;
    bool isStaffCompleted = isStaff && isCompleted && index == 1;
    bool isStaffInProgress = isStaff && isInProgress && index == 1;
    bool isStaffPendingExpanded = isStaff && isPending && index == 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.h, top: 10.h),
          child: TextView("10:10AM", style: TextStyle(color: const Color(0xFF98A2B3), fontSize: 16.sp, fontWeight: FontWeight.w400)),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xFFEAECF0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- STAFF TASKS: COMPLETED TAB AS PER SCREENSHOT ---
                  if (isStaffCompleted) ...[
                    _rowItemThree("Department", "Housekeeping", "Task", "Room Dusting", "Priority", "Normal"),
                    _divider(),
                    _rowItemThree("Task Location", "Room A-102", "Start Time", "12-06-2025\n11:00 AM", "End Time", "12-06-2025\n11:30 AM"),
                    SizedBox(height: 20.h),
                    _buildTaskStatusTracker(currentStep: 0), // Task Accepted highlighted

                    // --- STAFF TASKS: IN PROGRESS TAB AS PER SCREENSHOT ---
                  ] else if (isStaffInProgress) ...[
                    _rowItemThree("Department", "Housekeeping", "Task", "Room Dusting", "Priority", "Normal"),
                    _divider(),
                    _rowItemThree("Task Location", "Room A-102", "Start Time", "12-06-2025\n11:00 AM", "End Time", "--"),
                    SizedBox(height: 20.h),
                    _buildTaskStatusTracker(currentStep: 1), // Task In Progress highlighted

                    // --- STAFF TASKS: PENDING EXPANDED ---
                  ] else if (isStaffPendingExpanded) ...[
                    _rowItemThree("Department", "Housekeeping", "Task", "Room Dusting", "Status", "Pending"),
                    _divider(),
                    _rowItemThree("Task Location", "Room A-102", "Guest Name", "Rahul K", "Room Number", "101A"),
                    _divider(),
                    TextView("Task Description", style: TextStyle(color: const Color(0xFF98A2B3), fontSize: 12.sp)),
                    SizedBox(height: 4.h),
                    TextView("My room is not cleaned well. Please do it again", style: TextStyle(color: const Color(0xFF1D1929), fontSize: 14.sp, fontWeight: FontWeight.w600)),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _responseTimeBox("29:30"),
                        _actionButton("Assign"),
                      ],
                    ),

                    // --- STANDARD COLLAPSED VIEW ---
                  ] else ...[
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          _colItem(isStaff ? "Department" : "Task Title", isStaff ? "Housekeeping" : (index == 0 ? "Guest Complaint" : "Room Inspection")),
                          _vDivider(),
                          _colItem(isStaff ? "Task" : (index == 0 ? "Guest Name" : "Room"), isStaff ? "Room Dusting" : (index == 0 ? "Rahul K" : "101AK")),
                          _vDivider(),
                          _colItem(isStaff ? "Status" : (index == 0 ? "Complain Time" : "Request ID"), isStaff ? "Accepted" : (index == 0 ? "10:31 Am" : "R101Ad")),
                        ],
                      ),
                    ),
                    if (isMyTaskInProgress) ...[
                      _divider(),
                      _rowItemTwo("Request Time", "10:31Am", "Cleaning Status", "Cleaned"),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: _actionButton("Start Inspection", onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const TaskInspectionScreen()),
                          );
                        }),
                      ),
                    ],
                  ],
                ],
              ),
            ),
            if (!isMyTaskInProgress && !isStaffCompleted && !isStaffInProgress && !isStaffPendingExpanded)
              Positioned(bottom: -10.h, right: 15.w, child: _arrowIcon()),
          ],
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget _divider() => Padding(padding: EdgeInsets.symmetric(vertical: 16.h), child: const Divider(color: Color(0xFFF2F4F7), thickness: 1));

  Widget _actionButton(String text, {VoidCallback? onTap}) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(color: const Color(0xFF2B2838), borderRadius: BorderRadius.circular(8.r)),
      child: TextView(text, style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold)),
    ),
  );

  Widget _responseTimeBox(String time) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD0D5DD)), borderRadius: BorderRadius.circular(4.r)),
        child: TextView(time, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp)),
      ),
      SizedBox(height: 4.h),
      TextView("Response Time", style: TextStyle(color: const Color(0xFF98A2B3), fontSize: 10.sp)),
    ],
  );

  Widget _buildTaskStatusTracker({required int currentStep}) {
    return Column(
      children: [
        TextView("Task Status", style: TextStyle(color: const Color(0xFF98A2B3), fontSize: 12.sp)),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _statusNode("Task\nAccepted", currentStep >= 0),
            _statusLine(active: currentStep >= 1),
            _statusNode("Task In\nProgress", currentStep >= 1),
            _statusLine(active: currentStep >= 2),
            _statusNode("Task\nCompleted", currentStep >= 2),
          ],
        ),
      ],
    );
  }

  Widget _statusNode(String text, bool isActive) => Column(
    children: [
      Icon(isActive ? Icons.check_circle : Icons.radio_button_unchecked, color: isActive ? const Color(0xFF1D1929) : const Color(0xFFEAECF0), size: 24.sp),
      SizedBox(height: 4.h),
      TextView(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 10.sp, color: Colors.black)),
    ],
  );

  Widget _statusLine({bool active = false}) => Expanded(child: Container(height: 2, color: active ? const Color(0xFF1D1929) : const Color(0xFFD0D5DD), margin: EdgeInsets.only(bottom: 20.h)));

  Widget _arrowIcon() => Container(
    padding: EdgeInsets.all(2.w),
    decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: const Color(0xFFEAECF0))),
    child: Icon(Icons.keyboard_arrow_down, size: 16.sp, color: const Color(0xFF98A2B3)),
  );

  Widget _rowItemThree(String l1, String v1, String l2, String v2, String l3, String v3) => IntrinsicHeight(
    child: Row(
      children: [
        _colItem(l1, v1),
        _vDivider(),
        _colItem(l2, v2),
        _vDivider(),
        _colItem(l3, v3),
      ],
    ),
  );

  Widget _rowItemTwo(String l1, String v1, String l2, String v2) => IntrinsicHeight(
    child: Row(
      children: [
        _colItem(l1, v1),
        _vDivider(),
        _colItem(l2, v2),
        const Spacer(),
      ],
    ),
  );

  Widget _buildSearchSection() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 20.h),
    child: Row(
      children: [
        Container(
          width: 269.w,
          height: 40.h,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Color(0xFF667085)),
              hintText: "Search",
              hintStyle: TextStyle(fontSize: 16.sp),
              filled: true,
              fillColor: const Color(0xFFF9FAFB),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r), 
                borderSide: const BorderSide(color: Color(0xFFD0D5DD), width: 1)
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r), 
                borderSide: const BorderSide(color: Color(0xFFD0D5DD), width: 1)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r), 
                borderSide: const BorderSide(color: Color(0xFFD0D5DD), width: 1)
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        _filterIcon(Icons.settings_outlined),
        SizedBox(width: 8.w),
        _filterIcon(Icons.tune_outlined),
      ],
    ),
  );

  Widget _colItem(String label, String value) => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(label, style: TextStyle(color: const Color(0xFF98A2B3), fontSize: 16.sp, fontWeight: FontWeight.w400)),
        SizedBox(height: 4.h),
        TextView(value, style: TextStyle(color: const Color(0xFF1D1929), fontSize: 16.sp, fontWeight: FontWeight.w600), maxLines: 2, overflow: TextOverflow.ellipsis),
      ],
    ),
  );

  Widget _vDivider() => VerticalDivider(color: const Color(0xFFEAECF0), thickness: 1, width: 30.w);

  Widget _filterIcon(IconData icon) => Container(
    width: 45.w,
    height: 40.h,
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFD0D5DD), width: 1), 
      borderRadius: BorderRadius.circular(10.r)
    ),
    child: Icon(icon, size: 20.sp, color: Colors.black),
  );
}