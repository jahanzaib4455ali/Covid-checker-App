import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunggy_operational_app/common/widget/text_view.dart';
import 'package:kunggy_operational_app/theme/my_colors.dart';
import 'package:kunggy_operational_app/theme/my_text_styles.dart';

class GuestReviewScreen extends StatefulWidget {
  const GuestReviewScreen({super.key});

  @override
  State<GuestReviewScreen> createState() => _GuestReviewScreenState();
}

class _GuestReviewScreenState extends State<GuestReviewScreen> {
  List<Map<String, dynamic>> reviews = [
    {
      "guestName": "John Smith",
      "roomNumber": "A-102",
      "rating": 5,
      "reviewDate": "15-01-2025",
      "category": "Service",
      "comment": "Excellent service! The housekeeping staff was very professional and the room was spotless.",
      "status": "New",
      "response": ""
    },
    {
      "guestName": "Sarah Johnson",
      "roomNumber": "B-205",
      "rating": 4,
      "reviewDate": "14-01-2025",
      "category": "Cleanliness",
      "comment": "Room was clean but could use better maintenance. Overall good experience.",
      "status": "Responded",
      "response": "Thank you for your feedback. We'll address the maintenance issues immediately."
    },
    {
      "guestName": "Mike Wilson",
      "roomNumber": "C-301",
      "rating": 3,
      "reviewDate": "13-01-2025",
      "category": "Staff Behavior",
      "comment": "Staff was helpful but response time could be improved.",
      "status": "New",
      "response": ""
    },
  ];

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
                        "Guest Review",
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w800,
                          color: MyColors.dark000000,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.w),
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: MyColors.whiteFFFFFF,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(color: MyColors.grayD0D5DD.withOpacity(0.8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.calendar_today, size: 16.w, color: MyColors.dark000000),
                        SizedBox(width: 8.w),
                        TextView(
                          "11-01-2023",
                          style: myTextStyle.font_14w500.copyWith(color: MyColors.dark000000),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
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
                        style: myTextStyle.font_14w600,
                        decoration: InputDecoration(
                          hintText: "Search reviews...",
                          hintStyle: myTextStyle.font_14w400.copyWith(color: MyColors.gray9F9F9F),
                          prefixIcon: const Icon(Icons.search, color: MyColors.gray9F9F9F),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                   Container(
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
                    child: Icon(Icons.tune, size: 24.w, color: MyColors.gray9F9F9F),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return _buildReviewCard(review, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review, int index) {
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
              TextView(
                review["reviewDate"],
                style: myTextStyle.font_14w500.copyWith(color: MyColors.gray9F9F9F),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: review["status"] == "New" ? MyColors.yellowFFDB57.withOpacity(0.1) : MyColors.green34A853.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextView(
                  review["status"],
                  style: myTextStyle.font_12w600.copyWith(
                    color: review["status"] == "New" ? MyColors.yellowFFDB57 : MyColors.green34A853
                  ),
                ),
              ),
            ],
          ),
          
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
             child: const Divider(height: 1, color: MyColors.grayE5E5E5),
          ),
          
          Row(
            children: [
              Expanded(child: _buildInfoColumn("Guest Name", review["guestName"])),
              Expanded(child: _buildInfoColumn("Room", review["roomNumber"])),
              Expanded(child: _buildInfoColumn("Category", review["category"])),
            ],
          ),
          
          SizedBox(height: 20.h),
          
          Row(
            children: [
              TextView(
                "Rating: ",
                style: myTextStyle.font_14w500.copyWith(color: MyColors.gray9F9F9F),
              ),
              ...List.generate(5, (starIndex) => Icon(
                starIndex < review["rating"] ? Icons.star : Icons.star_border,
                color: MyColors.yellowFFDB57,
                size: 20.w,
              )),
              SizedBox(width: 8.w),
              TextView(
                "(${review["rating"]}/5)",
                style: myTextStyle.font_16ww600.copyWith(color: MyColors.dark000000),
              ),
            ],
          ),
          
          SizedBox(height: 20.h),
          
          TextView(
            "Review Comment",
            style: myTextStyle.font_14w500.copyWith(color: MyColors.gray9F9F9F),
          ),
          SizedBox(height: 8.h),
          Container(
             width: double.infinity,
             padding: EdgeInsets.all(12.w),
             decoration: BoxDecoration(
               color: MyColors.grayF7F7F7,
               borderRadius: BorderRadius.circular(12),
             ),
             child: TextView(
               review["comment"],
               style: myTextStyle.font_14w600.copyWith(color: MyColors.dark000000),
             ),
          ),
          
          if (review["response"].isNotEmpty) ...[
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: MyColors.grayF7F7F7,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: MyColors.grayD0D5DD),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                       Icon(Icons.reply, size: 18.w, color: MyColors.primaryDark1D1929),
                       SizedBox(width: 8.w),
                      TextView(
                        "Management Response",
                        style: myTextStyle.font_14w600.copyWith(color: MyColors.primaryDark1D1929),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  TextView(
                    review["response"],
                    style: myTextStyle.font_14w500.copyWith(color: MyColors.dark000000),
                  ),
                ],
              ),
            ),
          ],
          
          if (review["status"] == "New") ...[
            SizedBox(height: 24.h),
            SizedBox(
               height: 48.h,
               width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _showResponseDialog(index),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primaryDark1D1929,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: TextView("Respond", style: myTextStyle.font_16ww600.copyWith(color: MyColors.whiteFFFFFF)),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value) {
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

  void _showResponseDialog(int index) {
    final TextEditingController responseController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: TextView("Respond to Review", style: myTextStyle.font_16ww700),
          content: TextField(
            controller: responseController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Enter your response...",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: MyColors.grayF7F7F7,
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: TextView("Cancel", style: myTextStyle.font_14w500.copyWith(color: MyColors.gray9F9F9F)),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  reviews[index]["response"] = responseController.text;
                  reviews[index]["status"] = "Responded";
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Response sent successfully")),
                );
              },
              style: ElevatedButton.styleFrom(
                 backgroundColor: MyColors.primaryDark1D1929,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: TextView("Send Response", style: myTextStyle.font_14w600.copyWith(color: MyColors.whiteFFFFFF)),
            ),
          ],
        );
      },
    );
  }
}