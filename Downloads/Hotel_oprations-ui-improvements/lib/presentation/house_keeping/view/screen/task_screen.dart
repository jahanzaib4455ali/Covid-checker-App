import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/general_scaffold.dart';
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

class _TaskScreenState extends State<TaskScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
      isBackButton: false,
      isProfile: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TextView(
              "Tasks",
              style: myTextStyle.font_18w600.copyWith(fontSize: 22.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Container(
              height: 45.h,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: MyColors.primaryDark1D1929,
                  borderRadius: BorderRadius.circular(30),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                labelStyle: myTextStyle.font_14w500,
                tabs: const [
                  Tab(text: "Incoming"),
                  Tab(text: "My Task"),
                  Tab(text: "Completed"),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            child: Row(
              children: [
                TextView("Filter", style: myTextStyle.font_14w400.copyWith(color: Colors.grey)),
                const Spacer(),
                Icon(Icons.search, size: 22.sp, color: Colors.black54),
                SizedBox(width: 15.w),
                Icon(Icons.swap_vert, size: 22.sp, color: Colors.black54),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                const TaskListView(type: "Incoming"),
                const TaskListView(type: "My Task"),
                const TaskListView(type: "Completed"),
              ],
            ),
          ),
        ],
      ),
    );
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
                  TextView("Housekeeping Task", style: myTextStyle.font_14w600),
                  SizedBox(height: 5.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: isCompleted ? const Color(0xFFE8F5E9) : (isDusting ? const Color(0xFFE8F5E9) : const Color(0xFFFFEBEE)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextView(
                      isCompleted ? "Urgent" : (isDusting ? "Normal" : "Urgent"),
                      style: myTextStyle.font_12w500.copyWith(
                        color: isCompleted ? Colors.red : (isDusting ? Colors.green : Colors.red),
                        fontSize: 11.sp,
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
                child: TextView("Completed", style: myTextStyle.font_12w500.copyWith(color: Colors.green, fontSize: 10.sp)),
              )
                  : Container(
                width: 75.w,
                padding: EdgeInsets.symmetric(vertical: 5.h),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    TextView("5:00", style: myTextStyle.font_14w600),
                    TextView(isMyTask ? "Task Time" : "Response Time",
                        style: myTextStyle.font_10w400.copyWith(fontSize: 8.sp, color: Colors.grey)),
                  ],
                ),
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
            TextView("Note", style: myTextStyle.font_12w400),
            TextView(
              "Coffee mug has slipped and whole coffee is on the floor...",
              style: myTextStyle.font_12w400.copyWith(color: Colors.grey.shade600, fontSize: 11.sp),
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
                    child: TextView("Guest Rating", style: myTextStyle.font_12w400.copyWith(color: Colors.grey.shade600)),
                  ),
                  TextView(":", style: myTextStyle.font_12w400.copyWith(color: Colors.grey.shade600)),
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
                  child: TextView("Accept", style: myTextStyle.font_14w500.copyWith(color: Colors.white)),
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
            style: myTextStyle.font_12w500.copyWith(
              color: isOutline ? Colors.black87 : Colors.white,
              fontSize: 11.sp,
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
            child: TextView(label, style: myTextStyle.font_12w400.copyWith(color: Colors.grey.shade600)),
          ),
          TextView(":", style: myTextStyle.font_12w400.copyWith(color: Colors.grey.shade600)),
          SizedBox(width: 10.w),
          Expanded(child: TextView(value, style: myTextStyle.font_12w500)),
        ],
      ),
    );
  }
}