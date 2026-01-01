import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

// --- Domain: Worker Model ---
// (Ideally this should be in a separate models file, but keeping here for single-file functionality check first)
class Worker {
  final String id;
  final String name;
  final String role;
  final double rating;
  final double distanceKm;
  final bool isOnline;
  final String imageUrl;

  Worker({
    required this.id,
    required this.name,
    required this.role,
    required this.rating,
    required this.distanceKm,
    required this.isOnline,
    required this.imageUrl,
  });
}

// --- Presentation: Worker Selection Screen ---
class WorkerSelectionScreen extends StatefulWidget {
  final String taskId;
  const WorkerSelectionScreen({super.key, required this.taskId});

  @override
  State<WorkerSelectionScreen> createState() => _WorkerSelectionScreenState();
}

class _WorkerSelectionScreenState extends State<WorkerSelectionScreen> {
  // Mock Data (Simulating Service Layer)
  List<Worker> workers = [
    Worker(id: '1', name: 'Ali Khan', role: 'Housekeeping', rating: 4.8, distanceKm: 0.5, isOnline: true, imageUrl: ''),
    Worker(id: '2', name: 'Sarah Ahmed', role: 'Housekeeping', rating: 4.5, distanceKm: 1.2, isOnline: true, imageUrl: ''),
    Worker(id: '3', name: 'John Doe', role: 'Senior Staff', rating: 4.9, distanceKm: 2.0, isOnline: false, imageUrl: ''),
    Worker(id: '4', name: 'Mike Ross', role: 'Trainee', rating: 3.8, distanceKm: 0.2, isOnline: true, imageUrl: ''),
  ];

  @override
  Widget build(BuildContext context) {
    // Sort by "Best Match" (Combination of Rating and Distance)
    // Simple logic: Closer is better, Higher rating is better.
    workers.sort((a, b) {
      double scoreA = (a.rating * 10) - (a.distanceKm * 2);
      double scoreB = (b.rating * 10) - (b.distanceKm * 2);
      return scoreB.compareTo(scoreA); // Descending
    });

    return Scaffold(
      backgroundColor: MyColors.grayF7F7F7,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextView("Select Worker", style: myTextStyle.font_18w600.copyWith(color: Colors.black)),
      ),
      body: Column(
        children: [
           // Best Match Header
           Container(
             width: double.infinity,
             padding: EdgeInsets.all(16.w),
             color: MyColors.grayF0F0F0,
             child: TextView(
               "Recommended based on Location & Rating",
               style: myTextStyle.font_14w400.copyWith(color: MyColors.gray667085),
             ),
           ),
           Expanded(
             child: ListView.builder(
               padding: EdgeInsets.all(16.w),
               itemCount: workers.length,
               itemBuilder: (context, index) {
                 final worker = workers[index];
                 final isBestMatch = index == 0;
                 return _buildWorkerCard(worker, isBestMatch);
               },
             ),
           ),
        ],
      ),
    );
  }

  Widget _buildWorkerCard(Worker worker, bool isBestMatch) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: isBestMatch ? Border.all(color: MyColors.primaryDark1D1929, width: 2) : Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          if (isBestMatch)
            Container(
              margin: EdgeInsets.only(bottom: 12.h),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0xFFDCFAE6), // Light Green
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, size: 14.sp, color: Colors.green),
                  SizedBox(width: 4.w),
                  TextView("Best Match", style: myTextStyle.font_12w600.copyWith(color: Colors.green)),
                ],
              ),
            ),
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: MyColors.grayF4F4F6,
                child: TextView(worker.name[0], style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.black54)),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(worker.name, style: myTextStyle.font_16ww600),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                         Icon(Icons.location_on, size: 14.sp, color: MyColors.gray9F9F9F),
                         SizedBox(width: 4.w),
                         TextView("${worker.distanceKm} km away", style: myTextStyle.font_12w400.copyWith(color: MyColors.gray667085)),
                         SizedBox(width: 12.w),
                         Icon(Icons.star, size: 14.sp, color: Colors.amber),
                         SizedBox(width: 4.w),
                         TextView("${worker.rating}", style: myTextStyle.font_12w400.copyWith(color: MyColors.gray667085)),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _showAssignConfirmation(worker);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primaryDark1D1929,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                ),
                child: TextView("Assign", style: myTextStyle.font_14w600.copyWith(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAssignConfirmation(Worker worker) {
     showDialog(
       context: context,
       builder: (context) => AlertDialog(
         backgroundColor: Colors.white,
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
         title: TextView("Assign Task?", style: myTextStyle.font_18w600),
         content: TextView(
           "Do you want to assign this task to ${worker.name}? They will be notified immediately.",
           style: myTextStyle.font_14w400.copyWith(color: MyColors.gray667085),
         ),
         actions: [
            TextButton(
             onPressed: () => Navigator.pop(context),
             child: TextView("Cancel", style: myTextStyle.font_14w600.copyWith(color: MyColors.gray667085)),
           ),
           ElevatedButton(
             onPressed: () {
               Navigator.pop(context); // Close Dialog
               Navigator.pop(context); // Close Screen (Return to Task List)
               ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(content: Text("Task Assigned Successfully!")),
               );
             },
             style: ElevatedButton.styleFrom(backgroundColor: MyColors.primaryDark1D1929),
             child: TextView("Confirm", style: myTextStyle.font_14w600.copyWith(color: Colors.white)),
           ),
         ],
       ),
     );
  }
}
