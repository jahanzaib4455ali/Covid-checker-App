import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskInspectionScreen extends StatefulWidget {
  const TaskInspectionScreen({super.key});

  @override
  State<TaskInspectionScreen> createState() => _TaskInspectionScreenState();
}

class _TaskInspectionScreenState extends State<TaskInspectionScreen> {
  // Items list according to your screenshot
  final List<String> items = [
    "Linen and Bedding",
    "Minibar Refill",
    "Supplies and Amenities",
    "Dusting and Surfaces",
    "Floor Cleaning",
    "Bathroom Cleaning",
    "Trash Disposal",
    "Odor and Air Quality",
    "Glass and Window Cleaning",
    "Furniture Arrangement",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Task Inspection",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _buildInspectionRow(items[index]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D1929),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                ),
                onPressed: () {
                  // Final completion logic
                  Navigator.pop(context);
                },
                child: Text("Mark Complete", style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInspectionRow(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 15.sp, color: Colors.black)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: "8", // Default value from your image
                items: ["7", "8", "9", "10"].map((String value) {
                  return DropdownMenuItem<String>(value: value, child: Text(value));
                }).toList(),
                onChanged: (newValue) {},
                icon: const Icon(Icons.keyboard_arrow_down),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
