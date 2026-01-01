import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'role_selection_screen.dart';

class AccessPendingScreen extends StatefulWidget {
  const AccessPendingScreen({super.key});

  @override
  State<AccessPendingScreen> createState() => _AccessPendingScreenState();
}

class _AccessPendingScreenState extends State<AccessPendingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle headingStyle = TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    TextStyle subHeadingStyle = TextStyle(
      fontSize: 16.sp,
      color: Colors.grey[600],
    );
    TextStyle labelStyle = TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    TextStyle valueStyle = TextStyle(
      fontSize: 18.sp,
      color: Colors.grey[600],
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( // <--- Ye widget overflow fix karega
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 24.h),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_back, size: 32),
                ),
                SizedBox(height: 24.h),
                Image.asset(
                  'assets/images/approval.png',
                  width: 177,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 32.h),
                Text("Access Pending", style: headingStyle, textAlign: TextAlign.center),
                SizedBox(height: 16.h),
                Text(
                  "Your account is currently under review—please allow some time for the approval process to be completed.",
                  style: subHeadingStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Request has been sent to:", style: labelStyle),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Rakesh Sulangi", style: valueStyle),
                    Text("General Manager", style: valueStyle),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Rahul Kenari", style: valueStyle),
                    Text("Admin", style: valueStyle),
                  ],
                ),
                SizedBox(height: 24.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Device Information", style: labelStyle),
                ),
                SizedBox(height: 8.h),
                infoRow("Device Model", "Iphone 16 pro", valueStyle),
                infoRow("Mac Address", "Lorem isum", valueStyle),
                infoRow("IP address", "EAI000001", valueStyle),
                infoRow("Device Location", "Delhi, India", valueStyle),
                infoRow("Distance from Hotel", "10 Meters", valueStyle),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    timerCircle("00", "Days"),
                    timerCircle("02", "Hours"),
                    timerCircle("50", "Minutes"),
                    timerCircle("25", "Seconds"),
                  ],
                ),
                SizedBox(height: 24.h), // Bottom padding for smooth scrolling
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoRow(String label, String value, TextStyle valueStyle) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: valueStyle.copyWith(fontWeight: FontWeight.normal)),
          Text(value, style: valueStyle),
        ],
      ),
    );
  }

  Widget timerCircle(String value, String label) {
    return Column(
      children: [
        SizedBox(
          width: 60.w, // Added .w for consistency
          height: 60.w, // Added .w for consistency
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: 0.8,
                strokeWidth: 4,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.black87),
                backgroundColor: Colors.grey[300],
              ),
              Center(
                child: Text(
                  value,
                  style: TextStyle( // Added sp for responsiveness
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        Text(label, style: TextStyle(fontSize: 13.sp, color: Colors.black54)),
      ],
    );
  }
}