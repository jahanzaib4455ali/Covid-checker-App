import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateReminderScreen extends StatelessWidget {
  const CreateReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const CircleAvatar(backgroundColor: Color(0xFFF2F4F7), child: Icon(Icons.arrow_back, color: Colors.black)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Reminder", style: TextStyle(color: Colors.black, fontSize: 22.sp, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _label("Title"),
            _textField("Enter Title"),

            _label("Select Staff"),
            _searchField("Select List"),

            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Message", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                _voiceButton(),
              ],
            ),
            SizedBox(height: 8.h),
            _textField("Write here", maxLines: 5),

            const Spacer(),
            _submitButton(),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: EdgeInsets.only(bottom: 8.h, top: 16.h),
    child: Text(text, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
  );

  Widget _textField(String hint, {int maxLines = 1}) => TextField(
    maxLines: maxLines,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade400),
      enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color(0xFFD0D5DD)), borderRadius: BorderRadius.circular(12.r)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  );

  Widget _searchField(String hint) => TextField(
    decoration: InputDecoration(
      hintText: hint,
      suffixIcon: const Icon(Icons.search, color: Colors.grey),
      enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color(0xFFD0D5DD)), borderRadius: BorderRadius.circular(12.r)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  );

  Widget _voiceButton() => Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
    decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(20.r)),
    child: Row(children: [const Icon(Icons.mic, size: 18), SizedBox(width: 4.w), const Text("Voice")]),
  );

  Widget _submitButton() => SizedBox(
    width: double.infinity,
    height: 55.h,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1D1B20), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))),
      child: Text("Submit", style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold)),
    ),
  );
}