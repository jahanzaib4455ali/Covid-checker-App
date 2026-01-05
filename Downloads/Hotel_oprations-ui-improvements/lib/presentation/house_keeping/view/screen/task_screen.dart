import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/src_general_scaffold.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';
import 'mini_bar_refill_screen.dart';
import 'change_amenities_screen.dart';
import 'report_issue_screen.dart';
import 'qr_scanner_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int selectedIndex = 0; // Track selected button
  final List<String> tabTitles = ["Incoming", "My Task", "Completed"];

  @override
  Widget build(BuildContext context) {
    return SrcGeneralScaffold(
      isBackButton: false,
      showAppBar: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextView(
              "Tasks",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.black),
            ),
          ),
          // Separate buttons instead of TabBar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: List.generate(3, (index) => 
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: index < 2 ? 8.w : 0),
                    child: _buildTabButton(
                      tabTitles[index], 
                      selectedIndex == index,
                      () => setState(() => selectedIndex = index)
                    ),
                  ),
                )
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: Row(
              children: [
                TextView(
                  "Filter", 
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF667085),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.search_outlined, 
                  size: 20.sp, 
                  color: const Color(0xFF667085),
                ),
                SizedBox(width: 12.w),
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFD0D5DD)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.tune, 
                    size: 20.sp, 
                    color: const Color(0xFF667085),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildCurrentTabView(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2D2D3A) : Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(
            color: isSelected ? const Color(0xFF2D2D3A) : const Color(0xFFE0E0E0),
            width: 1.5,
          ),
        ),
        alignment: Alignment.center,
        child: TextView(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : const Color(0xFF667085),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentTabView() {
    switch (selectedIndex) {
      case 0:
        return const TaskListView(type: "Incoming");
      case 1:
        return const TaskListView(type: "My Task");
      case 2:
        return const TaskListView(type: "Completed");
      default:
        return const TaskListView(type: "Incoming");
    }
  }
}

class TaskListView extends StatelessWidget {
  final String type;
  const TaskListView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      itemCount: 2,
      itemBuilder: (context, index) {
        return TaskDataCard(cardType: type, index: index);
      },
    );
  }
}

class TaskDataCard extends StatelessWidget {
  final String cardType;
  final int index;
  const TaskDataCard({super.key, required this.cardType, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isMyTask = cardType == "My Task";
    bool isCompleted = cardType == "Completed";
    bool isDusting = index == 1;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView("Housekeeping Task", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black)),
                  SizedBox(height: 5.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: isCompleted ? const Color(0xFFE8F5E9) : (isDusting ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextView(
                      isCompleted ? "Urgent" : (isDusting ? "Normal" : "Urgent"),
                      style: TextStyle(
                        color: isCompleted ? Colors.red : (isDusting ? Colors.green : Colors.red),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              // Timer or Completed Badge
              isCompleted
                  ? Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextView("Completed", style: TextStyle(color: Colors.green, fontSize: 16.sp, fontWeight: FontWeight.w500)),
              )
                  : Column(
                children: [
                  Container(
                    width: 120.w,
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: TextView("5:00", style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700, color: Colors.black)),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextView(isMyTask ? "Task Time" : "Response Time",
                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: Colors.grey)),
                ],
              )
            ],
          ),
          SizedBox(height: 15.h),
          _infoRow("Task Name", isDusting ? "Dusting Only" : "Room Cleaning"),
          _infoRow("Request Time", "10:31 AM"),

          if (isMyTask || isCompleted) ...[
            _infoRow("Assign To", "Raghav"),
            _infoRow("Assign By", "Self"),
          ],

          if (!isDusting) _infoRow("Guest Name", "Rahul Kumar"),
          _infoRow("Room Status", isDusting ? "Un-occupied" : "Occupied"),
          _infoRow("Request ID", "EA001"),
          _infoRow("Room No", "101"),

          // Notes Section
          if (!isDusting && !isMyTask) ...[
            SizedBox(height: 10.h),
            TextView("Note", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.grey)),
            TextView(
              "Coffee mug has slipped and whole coffee is on the floor...",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 16.sp, fontWeight: FontWeight.w400),
            ),
          ],

          // Completed Specific Info
          if (isCompleted) ...[
            SizedBox(height: 10.h),
            const Divider(color: Color(0xFFF2F2F2)),
            _infoRow("Task Time", "11:09"),
            Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Row(
                children: [
                  SizedBox(
                    width: 100.w,
                    child: TextView("Guest Rating", style: TextStyle(color: Colors.grey.shade600, fontSize: 16.sp, fontWeight: FontWeight.w400)),
                  ),
                  TextView(":", style: TextStyle(color: Colors.grey.shade600, fontSize: 16.sp, fontWeight: FontWeight.w400)),
                  SizedBox(width: 10.w),
                  Row(
                    children: List.generate(5, (starIndex) => Icon(
                        Icons.star,
                        size: 16.sp,
                        color: starIndex < 4 ? Colors.black : Colors.grey.shade300
                    )),
                  )
                ],
              ),
            ),
          ],

          SizedBox(height: isCompleted ? 10.h : 20.h),

          // Buttons Section
          if (isMyTask) ...[
            Row(
              children: [
                _buildActionButton("Minibar Refill", isOutline: true, onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MiniBarRefillScreen()));
                }),
                SizedBox(width: 8.w),
                _buildActionButton("Amenities Added", isOutline: true, onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangeAmenitiesScreen()));
                }),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                _buildActionButton("Report", isOutline: true, onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportIssueScreen()));
                }),
                SizedBox(width: 8.w),
                _buildActionButton("Mark Complete", isOutline: false, onTap: () {
                  // Complete logic
                }),
              ],
            ),
          ] else if (!isCompleted) ...[
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 120.w,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const QRScannerScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.primaryDark1D1929,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: TextView("Accept", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white)),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, {required bool isOutline, VoidCallback? onTap}) {
    return Expanded(
      child: SizedBox(
        height: 44.h,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: isOutline ? Colors.white : MyColors.primaryDark1D1929,
            elevation: 0,
            side: isOutline ? BorderSide(color: Colors.grey.shade400) : BorderSide.none,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          child: TextView(
            text,
            style: TextStyle(
              color: isOutline ? Colors.black87 : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        children: [
          SizedBox(
            width: 100.w,
            child: TextView(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 16.sp, fontWeight: FontWeight.w400)),
          ),
          TextView(":", style: TextStyle(color: Colors.grey.shade600, fontSize: 16.sp, fontWeight: FontWeight.w400)),
          SizedBox(width: 10.w),
          Expanded(child: TextView(value, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black))),
        ],
      ),
    );
  }
}